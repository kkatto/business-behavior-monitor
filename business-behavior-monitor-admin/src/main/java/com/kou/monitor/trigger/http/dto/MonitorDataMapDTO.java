package com.kou.monitor.trigger.http.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author KouJY
 * @description
 * @create 2024-10-03 10:22
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MonitorDataMapDTO {

    // 监控ID
    private String monitorId;
    // 监控名称
    private String monitorName;
}
