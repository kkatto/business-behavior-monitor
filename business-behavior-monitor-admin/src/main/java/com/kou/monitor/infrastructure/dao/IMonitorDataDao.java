package com.kou.monitor.infrastructure.dao;

import com.kou.monitor.infrastructure.po.MonitorData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:31
 */
@Mapper
public interface IMonitorDataDao {

    List<MonitorData> queryMonitorDataList(MonitorData monitorDataReq);

    void insert(MonitorData monitorDataReq);
}
