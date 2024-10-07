package com.kou.monitor.domain.service;

import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.model.valobj.MonitorTreeConfigVO;
import ognl.OgnlException;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:24
 */
public interface ILogAnalyticalService {

    void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException;

    List<MonitorDataMapEntity> queryMonitorDataMapEntityList();

    MonitorTreeConfigVO queryMonitorFlowData(String monitorId);

    List<MonitorDataEntity> queryMonitorDataList(MonitorDataEntity monitorDataEntity);
}
