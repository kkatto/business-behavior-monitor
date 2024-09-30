package com.kou.monitor.test.infrastructure;

import com.alibaba.fastjson.JSON;
import com.kou.monitor.infrastructure.dao.IMonitorDataDao;
import com.kou.monitor.infrastructure.po.MonitorData;
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
 * @create 2024-09-29 14:47
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class MonitorDataDaoTest {

    @Resource
    private IMonitorDataDao monitorDataDao;

    @Test
    public void test_queryMonitorDataList() {
        List<MonitorData> monitorData = monitorDataDao.queryMonitorDataList(new MonitorData());
        log.info("测试结果: {}", JSON.toJSONString(monitorData));
    }
}
