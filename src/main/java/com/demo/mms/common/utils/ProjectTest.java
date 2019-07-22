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

        Object integerTest=new Integer(0);
        modifyInteger(integerTest);
        System.out.println(integerTest);


        Map<String, String> map = new HashMap<String, String>();
        map.put("c", "ccccc");
        map.put("a", "aaaaa");
        map.put("b", "bbbbb");
        map.put("d", "ddddd");

        List<Map.Entry<String,String>> list = new ArrayList<Map.Entry<String,String>>(map.entrySet());
        Collections.sort(list,new Comparator<Map.Entry<String,String>>() {
            //升序排序
            public int compare(Map.Entry<String, String> o1,
                               Map.Entry<String, String> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }

        });
        Map<String,Object> testMap=new HashMap<>();
        for(Map.Entry<String,String> mapping:list){
            testMap.put(mapping.getKey(),mapping.getValue());
//            System.out.println(mapping.getKey()+":"+mapping.getValue());
        }
        System.out.println(testMap);
        String strTest="                            ";
        System.out.println(strTest.trim().isEmpty());
    }

    private static void modifyInteger(Object integerTest) {
        integerTest=new Integer(23);
    }
}
