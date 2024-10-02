package com.kou.monitor.domain.service;

import ognl.OgnlException;

import java.util.List;

/**
 * @author KouJY
 * @description
 * @create 2024-09-29 14:24
 */
public interface ILogAnalyticalService {

    void doAnalytical(String systemName, String className, String methodName, List<String> logList) throws OgnlException;
}
