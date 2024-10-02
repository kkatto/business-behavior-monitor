package com.kou.monitor.infrastructure.dao;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:32
 */
@Mapper
public interface IMonitorDataMapDao {

    String queryMonitorNameByMonitoryId(String monitorId);
}
