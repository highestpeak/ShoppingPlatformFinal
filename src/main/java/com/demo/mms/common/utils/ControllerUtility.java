package com.demo.mms.common.utils;

import org.springframework.stereotype.Controller;

import java.util.Map;

public abstract class ControllerUtility {
    public static void insertErrorMessageAndFailFlag(Map<String, Object> map, String errorMessage) {
        insertFailFlag(map);
        map.put("error_message", errorMessage);
    }

    public static void insertErrorMessageAndFailFlag(Map<String, Object> map, Exception exception) {
        insertFailFlag(map);
        map.put("error_message", exception.getMessage());
    }

    public static void insertQueryResultAndSuccessFlag(Map<String, Object> map, Object result) {
        insertSuccessFlag(map);
        map.put("result", result);
    }

    public static void insertFailFlag(Map<String, Object> map) {
        map.replace("success", false);
    }

    public static void insertSuccessFlag(Map<String, Object> map) {
        map.replace("success", true);
    }
}
