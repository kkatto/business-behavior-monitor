package com.kou.monitor.trigger.http;

import com.kou.monitor.domain.model.entity.MonitorDataEntity;
import com.kou.monitor.domain.model.entity.MonitorDataMapEntity;
import com.kou.monitor.domain.model.entity.MonitorFlowDesignerEntity;
import com.kou.monitor.domain.model.valobj.MonitorTreeConfigVO;
import com.kou.monitor.domain.service.ILogAnalyticalService;
import com.kou.monitor.infrastructure.po.MonitorData;
import com.kou.monitor.infrastructure.po.MonitorDataMap;
import com.kou.monitor.trigger.http.dto.MonitorDataDTO;
import com.kou.monitor.trigger.http.dto.MonitorDataMapDTO;
import com.kou.monitor.trigger.http.dto.MonitorFlowDataDTO;
import com.kou.monitor.types.Response;
import com.kou.monitor.types.ResponseCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "query_monitor_flow_map", method = RequestMethod.GET)
    public Response<MonitorFlowDataDTO> queryMonitorFlowMap(@RequestParam String monitorId) {
        try {
            log.info("查询监控流数据 monitorId:{}", monitorId);
            MonitorTreeConfigVO monitorTreeConfigVO = logAnalyticalService.queryMonitorFlowData(monitorId);
            List<MonitorTreeConfigVO.Node> nodeList = monitorTreeConfigVO.getNodeList();
            List<MonitorTreeConfigVO.Link> linkList = monitorTreeConfigVO.getLinkList();

            List<MonitorFlowDataDTO.NodeData> nodeDataList = new ArrayList<>();
            for (MonitorTreeConfigVO.Node node : nodeList) {
                nodeDataList.add(new MonitorFlowDataDTO.NodeData(
                        node.getMonitorNodeId(),
                        node.getMonitorNodeId(),
                        node.getMonitorNodeName(),
                        node.getMonitorNodeValue(),
                        node.getLoc(),
                        node.getColor()));
            }

            List<MonitorFlowDataDTO.LinkData> linkDataList = new ArrayList<>(linkList.size());
            for (MonitorTreeConfigVO.Link link : linkList) {
                String linkValue = link.getLinkValue();
                linkDataList.add("0".equals(linkValue) ?
                        new MonitorFlowDataDTO.LinkData(link.getFromMonitorNodeId(), link.getToMonitorNodeId()) :
                        new MonitorFlowDataDTO.LinkData(link.getFromMonitorNodeId(), link.getToMonitorNodeId(), link.getLinkKey(), linkValue));
            }

            MonitorFlowDataDTO monitorFlowDataDTO = new MonitorFlowDataDTO();
            monitorFlowDataDTO.setNodeDataArray(nodeDataList);
            monitorFlowDataDTO.setLinkDataArray(linkDataList);

            // 返回结果
            return Response.<MonitorFlowDataDTO>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(monitorFlowDataDTO)
                    .build();
        } catch (Exception e) {
            log.error("查询监控流数据失败 monitorId:{}", monitorId, e);
            return Response.<MonitorFlowDataDTO>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    @RequestMapping(value = "query_monitor_data_list", method = RequestMethod.GET)
    public Response<List<MonitorDataDTO>> queryMonitorDataList(@RequestParam String monitorId, @RequestParam String monitorName, @RequestParam String monitorNodeId) {
        try {
            log.info("查询监控数据 monitorId:{}", monitorId);
            List<MonitorDataEntity> monitorDataEntityList = logAnalyticalService.queryMonitorDataList(MonitorDataEntity.builder()
                    .monitorId(StringUtils.isBlank(monitorId.trim()) ? null : monitorId)
                    .monitorName(StringUtils.isBlank(monitorName.trim()) ? null : monitorName)
                    .monitorNodeId(StringUtils.isBlank(monitorNodeId.trim()) ? null : monitorNodeId)
                    .build());

            List<MonitorDataDTO> monitorDataDTOList = new ArrayList<>();
            for (MonitorDataEntity monitorDataEntity : monitorDataEntityList) {
                monitorDataDTOList.add(MonitorDataDTO.builder()
                        .monitorId(monitorDataEntity.getMonitorId())
                        .monitorName(monitorDataEntity.getMonitorName())
                        .monitorNodeId(monitorDataEntity.getMonitorNodeId())
                        .systemName(monitorDataEntity.getSystemName())
                        .clazzName(monitorDataEntity.getClazzName())
                        .methodName(monitorDataEntity.getMethodName())
                        .attributeName(monitorDataEntity.getAttributeName())
                        .attributeField(monitorDataEntity.getAttributeField())
                        .attributeValue(monitorDataEntity.getAttributeValue())
                        .build());
            }
            return Response.<List<MonitorDataDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(monitorDataDTOList)
                    .build();
        } catch (Exception e) {
            log.error("查询监控数据失败 monitorId:{}", monitorId, e);
            return Response.<List<MonitorDataDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    @RequestMapping(value = "update_monitor_flow_designer", method = RequestMethod.POST)
    public Response<Boolean> updateMonitorFlowDesigner(@RequestParam String monitorId, @RequestBody MonitorFlowDataDTO monitorFlowDataDTO) {
        try {
            log.info("更新监控图配置 monitorId:{}", monitorId);
            List<MonitorFlowDataDTO.NodeData> nodeDataList = monitorFlowDataDTO.getNodeDataArray();
            List<MonitorFlowDataDTO.LinkData> linkDataList = monitorFlowDataDTO.getLinkDataArray();

            List<MonitorFlowDesignerEntity.Node> nodeList = new ArrayList<>();
            for (MonitorFlowDataDTO.NodeData nodeData : nodeDataList) {
                nodeList.add(MonitorFlowDesignerEntity.Node.builder()
                        .monitorNodeId(nodeData.getKey())
                        .loc(nodeData.getLoc())
                        .build());
            }

            List<MonitorFlowDesignerEntity.Link> linkList = new ArrayList<>();
            for (MonitorFlowDataDTO.LinkData linkData : linkDataList) {
                linkList.add(MonitorFlowDesignerEntity.Link.builder()
                        .from(linkData.getFrom())
                        .to(linkData.getTo())
                        .build());
            }

            MonitorFlowDesignerEntity monitorFlowDesignerEntity = MonitorFlowDesignerEntity.builder()
                    .monitorId(monitorId)
                    .nodeList(nodeList)
                    .linkList(linkList)
                    .build();

            logAnalyticalService.updateMonitorFlowDesigner(monitorFlowDesignerEntity);

            return Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(true)
                    .build();
        } catch (Exception e) {
            log.info("更新监控图配置失败 monitorId:{}", monitorId, e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }
}
