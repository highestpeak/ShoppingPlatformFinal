package com.demo.mms.controller;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    //查询商品
    @RequestMapping("/get")
    @ResponseBody
    public Object goodsQuery(Store store){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        ArrayList goodsList=new ArrayList();
        Map<String,Object> rsService=goodsService.getStoreGoods(store,goodsList);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
        rs.put("goodsList",goodsList);
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    //修改商品
    @RequestMapping("/edit")
    @ResponseBody
    public Object goodsUpdate(Store store, Goods oldGoods,Goods newGoods){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsUpdate");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Map<String,Object> rsService=goodsService.updateStoreGoods(store,oldGoods,newGoods);
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


    //删除商品
    @RequestMapping("/del")
    @ResponseBody
    public Object goodsDel(Store store, Goods goodsToDel){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsDel");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Map<String,Object> rsService=goodsService.delStoreGoods(store, goodsToDel);
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

    //增加商品
    @RequestMapping("/add")
    @ResponseBody
    public Object goodsAdd(Store store, Goods goodsToAdd){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsAdd");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Map<String,Object> rsService=goodsService.addStoreGoods(store,goodsToAdd);
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
