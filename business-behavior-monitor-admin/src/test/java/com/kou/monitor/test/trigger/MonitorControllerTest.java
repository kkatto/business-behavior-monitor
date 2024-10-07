package com.kou.monitor.test.trigger;

import com.alibaba.fastjson2.JSON;
import com.kou.monitor.trigger.http.MonitorController;
import com.kou.monitor.trigger.http.dto.MonitorDataDTO;
import com.kou.monitor.trigger.http.dto.MonitorDataMapDTO;
import com.kou.monitor.trigger.http.dto.MonitorFlowDataDTO;
import com.kou.monitor.types.Response;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-10-03 11:02
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class MonitorControllerTest {

    @Resource
    private MonitorController monitorController;

    @Test
    public void test_queryMonitorDataMapEntityList() {
        Response<List<MonitorDataMapDTO>> response = monitorController.queryMonitorDataMapEntityList();
        log.info("测试结果: {}", JSON.toJSONString(response));
    }

    @Test
    public void test_queryMonitorFlowMap() {
        Response<MonitorFlowDataDTO> response = monitorController.queryMonitorFlowMap("129009");
        log.info("测试结果: {}", JSON.toJSONString(response));
    }

    @Test
    public void test_queryMonitorDataList(){
        Response<List<MonitorDataDTO>> response = monitorController.queryMonitorDataList("","","");
        log.info("测试结果: {}", JSON.toJSONString(response));
    }
}
