package com.demo.mms.controller;

import com.demo.mms.common.domain.Store;
import com.demo.mms.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    //数据请求
    @RequestMapping("/classifyOfStore")
    @ResponseBody
    public Object getClassify(Store store){
        System.out.println("in getClassify");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        ArrayList classifyList=new ArrayList();
        Map<String,Object> rsService=goodsService.getStoreGoodsClassify(store,classifyList);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
//        modelMap.put("classifyList",classifyList);
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        rs.put("classifyList",classifyList);
        return rs;
    }
    //页面请求
    @RequestMapping("/manageClassify")
    public String toManageClassify(Store store){
        System.out.println("in toManageClassify");
//        Map<String,Object> rs = new HashMap<>();
//        rs.put("success",true);
//        Map<String,Object> rsGetClassify=(Map<String,Object>)getClassify(store);
//        if(!((boolean)rsGetClassify.get("success"))){//含有错误信息
//            rs.putAll(rsGetClassify);
//            modelMap.put("rsMap",rs);
//            return "404";
//        }
//        modelMap.put("classifyList",rsGetClassify.get("classifyList"));
//        modelMap.put("rsMap",rs);
        return "good_manage";
    }
}
