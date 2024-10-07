package com.kou.monitor.infrastructure.dao;

import com.kou.monitor.infrastructure.po.MonitorDataMapNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:33
 */
@Mapper
public interface IMonitorDataMapNodeDao {

    List<MonitorDataMapNode> queryMonitoryDataMapNodeList(MonitorDataMapNode monitorDataMapNodeReq);

    List<MonitorDataMapNode> queryMonitorNodeConfigByMonitorId(String monitorId);
}
