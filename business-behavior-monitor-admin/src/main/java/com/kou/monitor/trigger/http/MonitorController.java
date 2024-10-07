package com.kou.monitor.trigger.http;

import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.service.ILogAnalyticalService;
import com.kou.monitor.infrastructure.po.MonitorDataMap;
import com.kou.monitor.trigger.http.dto.MonitorDataMapDTO;
import com.kou.monitor.types.Response;
import com.kou.monitor.types.ResponseCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-10-03 10:15
 */
@Slf4j
@RestController()
@CrossOrigin("*")
@RequestMapping("/api/v1/monitor/")
public class MonitorController {

    @Resource
    private ILogAnalyticalService logAnalyticalService;

    /**
     * http://localhost:8091/api/v1/monitor/query_monitor_data_map_entity_list
     */
    @RequestMapping(value = "query_monitor_data_map_entity_list", method = RequestMethod.GET)
    public Response<List<MonitorDataMapDTO>> queryMonitorDataMapEntityList() {
        try {
            List<MonitorDataMapEntity> monitorDataMapEntityList = logAnalyticalService.queryMonitorDataMapEntityList();
            List<MonitorDataMapDTO> monitorDataMapDTOList = new ArrayList<>(monitorDataMapEntityList.size());

            for (MonitorDataMapEntity monitorDataMapEntity : monitorDataMapEntityList) {
                monitorDataMapDTOList.add(MonitorDataMapDTO.builder()
                        .monitorId(monitorDataMapEntity.getMonitorId())
                        .monitorName(monitorDataMapEntity.getMonitorName())
                        .build());
            }
            return Response.<List<MonitorDataMapDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(monitorDataMapDTOList)
                    .build();
        } catch (Exception e) {
            log.error("查询监控列表数据失败", e);
            return Response.<List<MonitorDataMapDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }
}
