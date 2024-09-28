package com.kou.monitor.sdk.push;

import com.kou.monitor.sdk.model.LogMessage;

/**
 * @author KouJY
 * Date: 2024/9/27 11:44
 * Package: com.kou.monitor.sdk.push
 *
 * 信息发布
 */
public interface IPush {

    void open(String host, Integer port);

    void send(LogMessage logMessage);
}
