package com.demo.mms.controller;

import com.demo.mms.common.domain.Store;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.StoreCrudVO;
import com.demo.mms.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("store")
@Controller
public class StoreController {
    @Autowired
    StoreService storeService;

    @RequestMapping("/getInfo")
    @ResponseBody
    public Object getStoreInfo(@RequestBody Store store){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in getStoreInfo");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=storeService.getStoreInfo(store);
        if(!rsService.containsKey("store") && rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
        //---
        if(!rsService.containsKey("store") && rs.size()>1){
            rs.put("success",false);
        }
        rs.putAll(rsService);
        return rs;
    }

    @RequestMapping("/modify")
    @ResponseBody
    public Object updateStoreInfo(@RequestBody StoreCrudVO storeCrudVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in getStoreInfo");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Store oldStore=storeCrudVO.getOldStore();
        Store newStore=storeCrudVO.getNewStore();
        Map<String,Object> rsService=storeService.updateStoreInfo(oldStore,newStore);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

}
