package com.kou.monitor.infrastructure.repository;

import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.model.valobj.GatherNodeExpressionVO;
import com.kou.monitor.domain.model.valobj.MonitorTreeConfigVO;
import com.kou.monitor.domain.repository.IMonitorRepository;
import com.kou.monitor.infrastructure.dao.*;
import com.kou.monitor.infrastructure.po.*;
import com.kou.monitor.infrastructure.redis.IRedisService;
import com.kou.monitor.types.Constants;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author KouJY
 * @description
 * @create 2024-09-30 16:34
 */
@Repository
public class MonitorRepository implements IMonitorRepository {

    @Resource
    private IMonitorDataDao monitorDataDao;
    @Resource
    private IMonitorDataMapDao monitorDataMapDao;
    @Resource
    private IMonitorDataMapNodeDao monitorDataMapNodeDao;
    @Resource
    private IMonitorDataMapNodeFieldDao monitorDataMapNodeFieldDao;
    @Resource
    private IMonitorDataMapNodeLinkDao monitorDataMapNodeLinkDao;
    @Resource
    private IRedisService redisService;

    @Override
    public List<GatherNodeExpressionVO> queryGatherNodeExpressionVO(String systemName, String className, String methodName) {
        String cacheKey = Constants.RedisKey.GATHER_NODE_EXPRESSION + Constants.UNDERLINE + systemName + Constants.UNDERLINE + className + Constants.UNDERLINE + methodName;
        List<GatherNodeExpressionVO> gatherNodeExpressionVOList = redisService.getValue(cacheKey);
        if (null != gatherNodeExpressionVOList) {
            return gatherNodeExpressionVOList;
        }

        // 1.查询采集节点
        MonitorDataMapNode monitorDataMapNodeReq = new MonitorDataMapNode();
        monitorDataMapNodeReq.setGatherSystemName(systemName);
        monitorDataMapNodeReq.setGatherClazzName(className);
        monitorDataMapNodeReq.setGatherMethodName(methodName);
        List<MonitorDataMapNode> monitorDataMapNodeList = monitorDataMapNodeDao.queryMonitoryDataMapNodeList(monitorDataMapNodeReq);
        if (monitorDataMapNodeList.isEmpty()) {
            return null;
        }

        gatherNodeExpressionVOList = new ArrayList<>();
        for (MonitorDataMapNode monitorDataMapNodeRes : monitorDataMapNodeList) {
            MonitorDataMapNodeField monitorDataMapNodeFieldReq = new MonitorDataMapNodeField();
            monitorDataMapNodeFieldReq.setMonitorId(monitorDataMapNodeRes.getMonitorId());
            monitorDataMapNodeFieldReq.setMonitorNodeId(monitorDataMapNodeRes.getMonitorNodeId());
            List<MonitorDataMapNodeField> monitorDataMapNodeFieldList = monitorDataMapNodeFieldDao.queryMonitorDataMapNodeFiledList(monitorDataMapNodeFieldReq);

            List<GatherNodeExpressionVO.Filed> filedList = new ArrayList<>();
            for (MonitorDataMapNodeField monitorDataMapNodeField : monitorDataMapNodeFieldList) {
                filedList.add(GatherNodeExpressionVO.Filed.builder()
                        .logName(monitorDataMapNodeField.getLogName())
                        .logIndex(monitorDataMapNodeField.getLogIndex())
                        .logType(monitorDataMapNodeField.getLogType())
                        .attributeField(monitorDataMapNodeField.getAttributeField())
                        .attributeName(monitorDataMapNodeField.getAttributeName())
                        .attributeOgnl(monitorDataMapNodeField.getAttributeOgnl())
                        .build());
            }

            gatherNodeExpressionVOList.add(GatherNodeExpressionVO.builder()
                    .monitorId(monitorDataMapNodeRes.getMonitorId())
                    .monitorNodeId(monitorDataMapNodeRes.getMonitorNodeId())
                    .gatherSystemName(monitorDataMapNodeRes.getGatherSystemName())
                    .gatherClazzName(monitorDataMapNodeRes.getGatherClazzName())
                    .gatherMethodName(monitorDataMapNodeRes.getGatherMethodName())
                    .filedList(filedList)
                    .build());
        }
        redisService.setValue(cacheKey, gatherNodeExpressionVOList);

        return gatherNodeExpressionVOList;
    }

    @Override
    public String queryMonitorNameByMonitorId(String monitorId) {
        return monitorDataMapDao.queryMonitorNameByMonitoryId(monitorId);
    }

    @Override
    public void saveMonitoryData(MonitorDataEntity monitorDataEntity) {
        MonitorData monitorDataReq = new MonitorData();
        monitorDataReq.setMonitorId(monitorDataEntity.getMonitorId());
        monitorDataReq.setMonitorName(monitorDataEntity.getMonitorName());
        monitorDataReq.setMonitorNodeId(monitorDataEntity.getMonitorNodeId());
        monitorDataReq.setSystemName(monitorDataEntity.getSystemName());
        monitorDataReq.setClazzName(monitorDataEntity.getClazzName());
        monitorDataReq.setMethodName(monitorDataEntity.getMethodName());
        monitorDataReq.setAttributeName(monitorDataEntity.getAttributeName());
        monitorDataReq.setAttributeField(monitorDataEntity.getAttributeField());
        monitorDataReq.setAttributeValue(monitorDataEntity.getAttributeValue());
        monitorDataDao.insert(monitorDataReq);

        String cacheKey = Constants.RedisKey.MONITOR_NODE_DATA_COUNT_KEY + monitorDataEntity.getMonitorId() + Constants.UNDERLINE + monitorDataEntity.getMonitorNodeId();
        redisService.incr(cacheKey);
    }

    @Override
    public List<MonitorDataMapEntity> queryMonitorDataMapEntityList() {
        List<MonitorDataMap> monitorDataMapList = monitorDataMapDao.queryMonitorDataMapEntityList();

        List<MonitorDataMapEntity> monitorDataMapEntitieList = new ArrayList<>(monitorDataMapList.size());
        for (MonitorDataMap monitorDataMap : monitorDataMapList) {
            monitorDataMapEntitieList.add(MonitorDataMapEntity.builder()
                    .monitorId(monitorDataMap.getMonitorId())
                    .monitorName(monitorDataMap.getMonitorName())
                    .build());
        }
        return monitorDataMapEntitieList;
    }

    @Override
    public MonitorTreeConfigVO queryMonitorFlowData(String monitorId) {
        // 监控节点配置
        List<MonitorDataMapNode> monitorDataMapNodeList = monitorDataMapNodeDao.queryMonitorNodeConfigByMonitorId(monitorId);
        // 监控节点链路
        List<MonitorDataMapNodeLink> monitorDataMapNodeLinkList = monitorDataMapNodeLinkDao.queryMonitorNodeLinkConfigByMonitorId(monitorId);

        Map<String, List<String>> fromMonitorNodeIdToNodeIdMap = new HashMap<>();
        for (MonitorDataMapNodeLink monitorDataMapNodeLink : monitorDataMapNodeLinkList) {
            String fromMonitorNodeId = monitorDataMapNodeLink.getFromMonitorNodeId();
            String toMonitorNodeId = monitorDataMapNodeLink.getToMonitorNodeId();

            fromMonitorNodeIdToNodeIdMap
                    .computeIfAbsent(fromMonitorNodeId, key -> new ArrayList<>())
                    .add(toMonitorNodeId);
        }

        List<MonitorTreeConfigVO.Node> nodeList = new ArrayList<>();
        for (MonitorDataMapNode monitorDataMapNode : monitorDataMapNodeList) {
            // 查询缓存节点流量值
            String cacheKey = Constants.RedisKey.MONITOR_NODE_DATA_COUNT_KEY + monitorId + Constants.UNDERLINE + monitorDataMapNode.getMonitorNodeId();
            Long count = redisService.getAtomicLong(cacheKey);

            nodeList.add(MonitorTreeConfigVO.Node.builder()
                    .monitorNodeId(monitorDataMapNode.getMonitorNodeId())
                    .monitorNodeName(monitorDataMapNode.getMonitorNodeName())
                    .loc(monitorDataMapNode.getLoc())
                    .color(monitorDataMapNode.getColor())
                    .monitorNodeValue(null == count ? "0" : String.valueOf(count))
                    .build());
        }

        List<MonitorTreeConfigVO.Link> linkList = new ArrayList<>();
        for (MonitorDataMapNodeLink monitorDataMapNodeLink : monitorDataMapNodeLinkList) {
            // 获取节点值
            String cacheKey = Constants.RedisKey.MONITOR_NODE_DATA_COUNT_KEY + monitorId + Constants.UNDERLINE + monitorDataMapNodeLink.getFromMonitorNodeId();
            Long fromCacheCount = redisService.getAtomicLong(cacheKey);
            Long toCacheCount = 0L;

            // 合并所有值
            List<String> toNodeIdList = fromMonitorNodeIdToNodeIdMap.get(monitorDataMapNodeLink.getFromMonitorNodeId());
            for (String toNodeId : toNodeIdList) {
                String toCacheKey = Constants.RedisKey.MONITOR_NODE_DATA_COUNT_KEY + monitorId + Constants.UNDERLINE + toNodeId;
                toCacheCount += redisService.getAtomicLong(toCacheKey);
            }

            long differenceValue = (null == fromCacheCount ? 0L : fromCacheCount) - toCacheCount;

            linkList.add(MonitorTreeConfigVO.Link.builder()
                    .fromMonitorNodeId(monitorDataMapNodeLink.getFromMonitorNodeId())
                    .toMonitorNodeId(monitorDataMapNodeLink.getToMonitorNodeId())
                    .linkKey(String.valueOf(monitorDataMapNodeLink.getId()))
                    .linkValue(String.valueOf(differenceValue <= 0 ? 0 : differenceValue))
                    .build());
        }

        return MonitorTreeConfigVO.builder()
                .monitorId(monitorId)
                .nodeList(nodeList)
                .linkList(linkList)
                .build();
    }
}
