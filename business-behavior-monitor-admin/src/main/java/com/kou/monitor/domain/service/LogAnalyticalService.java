package com.kou.monitor.domain.service;

import com.alibaba.fastjson2.JSONObject;
import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.model.valobj.GatherNodeExpressionVO;
import com.kou.monitor.domain.repository.IMonitorRepository;
import com.kou.monitor.types.Constants;
import ognl.Ognl;
import ognl.OgnlContext;
import ognl.OgnlException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-30 15:40
 */
@Service
public class LogAnalyticalService implements ILogAnalyticalService {

    @Resource
    private IMonitorRepository monitorRepository;

    @Override
    public void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException {
        // 查询匹配解析节点
        List<GatherNodeExpressionVO> gatherNodeExpressionVOList = monitorRepository.queryGatherNodeExpressionVO(systemName, className, methodName);
        if (null == gatherNodeExpressionVOList || gatherNodeExpressionVOList.isEmpty()) {
            return;
        }

        for (GatherNodeExpressionVO gatherNodeExpressionVO : gatherNodeExpressionVOList) {
            String monitorName = monitorRepository.queryMonitorNameByMonitorId(gatherNodeExpressionVO.getMonitorId());

            List<GatherNodeExpressionVO.Filed> filedList = gatherNodeExpressionVO.getFiledList();
            for (GatherNodeExpressionVO.Filed filed : filedList) {
                Integer logIndex = filed.getLogIndex();

                String logName = logList.get(0);
                if (!filed.getLogName().equals(logName)) {
                    continue;
                }

                String attributeValue = "";
                String logStr = logList.get(logIndex);
                if ("Object".equals(filed.getLogType())) {
                    OgnlContext context = new OgnlContext();
                    context.setRoot(JSONObject.parseObject(logStr));
                    Object root = context.getRoot();
                    attributeValue = String.valueOf(Ognl.getValue(filed.getAttributeOgnl(), context, root));
                } else {
                    attributeValue = logStr.trim();
                    if (attributeValue.contains(Constants.COLON)) {
                        attributeValue = attributeValue.split(Constants.COLON)[1].trim();
                    }
                }

                MonitorDataEntity monitorDataEntity = MonitorDataEntity.builder()
                        .monitorId(gatherNodeExpressionVO.getMonitorId())
                        .monitorName(monitorName)
                        .monitorNodeId(gatherNodeExpressionVO.getMonitorNodeId())
                        .systemName(gatherNodeExpressionVO.getGatherSystemName())
                        .clazzName(gatherNodeExpressionVO.getGatherClazzName())
                        .methodName(gatherNodeExpressionVO.getGatherMethodName())
                        .attributeName(filed.getAttributeName())
                        .attributeField(filed.getAttributeField())
                        .attributeValue(attributeValue)
                        .build();

                monitorRepository.saveMonitoryData(monitorDataEntity);
            }
        }
    }

    @Override
    public List<MonitorDataMapEntity> queryMonitorDataMapEntityList() {
        return monitorRepository.queryMonitorDataMapEntityList();
    }
}
