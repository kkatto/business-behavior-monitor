package com.kou.monitor.domain.repository;

import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.model.entity.MonitorFlowDesignerEntity;
import com.kou.monitor.domain.model.valobj.GatherNodeExpressionVO;
import com.kou.monitor.domain.model.valobj.MonitorTreeConfigVO;

import java.util.List;

/**
 * @description
 * @author KouJY
 * @create 2024-09-29 14:22
 */
public interface IMonitorRepository {

    List<GatherNodeExpressionVO> queryGatherNodeExpressionVO(String systemName, String className, String methodName);

    String queryMonitorNameByMonitorId(String monitorId);

    void saveMonitoryData(MonitorDataEntity monitorDataEntity);

    List<MonitorDataMapEntity> queryMonitorDataMapEntityList();

    MonitorTreeConfigVO queryMonitorFlowData(String monitorId);

    List<MonitorDataEntity> queryMonitorDataList(MonitorDataEntity monitorDataEntity);

    void updateMonitorFlowDesigner(MonitorFlowDesignerEntity monitorFlowDesignerEntity);
}
