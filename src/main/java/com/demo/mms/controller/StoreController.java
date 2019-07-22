package com.demo.mms.controller;

import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.StoreCrudVO;
import com.demo.mms.common.vo.ViewHistoryGetVO;
import com.demo.mms.service.GoodsService;
import com.demo.mms.service.StoreService;
import com.demo.mms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("store")
@Controller
public class StoreController {
    @Autowired
    StoreService storeService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;

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

    //获取分类chart图所需信息
    //分类+数量
    @RequestMapping("/getChartOfClassify")
    @ResponseBody
    public Object chartClassifyGet(Store store){
        System.out.println("in chartClassifyGet store");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        ArrayList classifyList=new ArrayList();
//        Map<String,Object> rsService= userService.getViewHistory(viewHistoryGetVO.getStore(),viewHistoryGetVO.getGoodsClassify());
        Map<String,Object> rsService= goodsService.getStoreGoodsClassifyChartInfo(store,classifyList);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    //获取订单chart图所需信息
    @RequestMapping("/getChartOfOrder")
    @ResponseBody
    public Object chartOrderGet(Store store){

        return null;
    }

    //获取注册用户chart图所需信息
    @RequestMapping("/getChartOfUser")
    @ResponseBody
    public Object chartUserGet(@RequestBody Store store){
        return null;
    }

    //获取用户的游览历史
    //返回用户信息+历史记录信息+商品信息+分类信息
    @RequestMapping("/getViewedHistory")
    @ResponseBody
    public Object getViewedHistory(@RequestBody ViewHistoryGetVO viewHistoryGetVO){
        System.out.println("in getViewedHistory store");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService= userService.getViewHistory(viewHistoryGetVO.getStore(),viewHistoryGetVO.getGoodsClassify());
//        Map<String,Object> rsService= null;
        if(!rsService.containsKey("viewedHistoryReturn") && rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        if(!rsService.containsKey("viewedHistoryReturn") && rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    //进行商品促销---增删查改
    @RequestMapping("/onSale")
    @ResponseBody
    public Object modifyOnSale(@RequestBody Store store){
        return null;
    }

    //获取商店某天发生的事情的info json
    @RequestMapping("/getThingOfDay")
    @ResponseBody
    public Object thingOfDayGet(Store store){
        return null;
    }

    //获取所有的注册用户
    @RequestMapping("/getUser")
    public Object getUserAll(){
        System.out.println("in getViewedHistory store");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        ArrayList<User> users=new ArrayList<>();
        Map<String,Object> rsService= storeService.getAllUser(users);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
            return rs;
        }
        rs.put("userList",users);
        return rs;
    }
}
