package com.demo.mms.controller;

import com.demo.mms.common.domain.Store;
import com.demo.mms.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    //数据请求
    @RequestMapping("/classify")
    public Object getClassify(Store store, ModelMap modelMap){
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
        modelMap.put("classifyList",classifyList);
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        rs.put("classifyList",classifyList);
        return rs;
    }

}
