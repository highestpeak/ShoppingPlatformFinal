package com.demo.mms.common.utils;

import java.util.UUID;

/**
 * Created by hkx on 2018/7/15.
 */
public abstract class IDGenerator {

    public static String getId() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            System.out.println(IDGenerator.getId());
        }
    }
}
