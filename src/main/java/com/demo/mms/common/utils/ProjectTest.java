package com.demo.mms.common.utils;

import com.demo.mms.common.domain.Buyer;

import java.util.*;

public class ProjectTest {
    //供测试使用，不是程序入口
    public static void main(String[] args){
        Buyer buyer = new Buyer();
        System.out.println(buyer.getType());

        Map<String,Object> mapTest=new HashMap<>();
        mapTest.put("1","a");
        mapTest.put("2","a");
        mapTest.put("3","a");
        mapTest.put("4","a");
        System.out.println(mapTest.toString());

        mapTest.put("list", Arrays.asList("hello","hi"));
        List<String> modiyArr=(List<String>) mapTest.get("list");
        System.out.println(((String)modiyArr.get(0))+" "+((String)modiyArr.get(1)));
    }
}
