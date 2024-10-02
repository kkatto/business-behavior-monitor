package com.kou.monitor.infrastructure.repository;

import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.valobj.GatherNodeExpressionVO;
import com.kou.monitor.domain.repository.IMonitorRepository;
import com.kou.monitor.infrastructure.dao.*;
import com.kou.monitor.infrastructure.po.MonitorData;
import com.kou.monitor.infrastructure.po.MonitorDataMapNode;
import com.kou.monitor.infrastructure.po.MonitorDataMapNodeField;
import com.kou.monitor.infrastructure.redis.IRedisService;
import com.kou.monitor.types.Constants;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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
}
