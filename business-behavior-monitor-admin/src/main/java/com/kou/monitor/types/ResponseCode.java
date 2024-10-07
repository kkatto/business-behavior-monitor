package com.kou.monitor.types;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author KouJY
 * @description
 * @create 2024-10-03 10:37
 */
@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum ResponseCode {

    SUCCESS("0000", "转发"),
    UN_ERROR("0001", "未知失败"),
    ;

    private String code;

    private String info;
}
