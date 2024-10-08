package com.kou.monitor.infrastructure.dao;

import com.kou.monitor.infrastructure.po.MonitorDataMap;
import com.kou.monitor.infrastructure.po.MonitorDataMapNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:32
 */
@Mapper
public interface IMonitorDataMapDao {

    String queryMonitorNameByMonitoryId(String monitorId);

    List<MonitorDataMap> queryMonitorDataMapEntityList();
}
