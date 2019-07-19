package com.demo.mms.controller;

import com.demo.mms.common.domain.GoodsClassify;
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
public class ClassifyController {
    @Autowired
    private GoodsService goodsService;
    //数据请求
    //查询商店所售卖所有商品分类
    @RequestMapping("/classifyOfStore")
    @ResponseBody
    public Object getClassify(Store store){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in getClassify");
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
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        rs.put("classifyList",classifyList);
        return rs;
    }

    //删除商店所售卖所有商品的---传入classifiesToDel包含所有本商店已经拥有的，需要删除的分类
    @RequestMapping("/deleteClassifyOfStore")
    @ResponseBody
    public Object deleteClassifyOfStore(Store store, ArrayList<GoodsClassify> classifiesToDel){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in deleteClassifyOfStore");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        
        Map<String,Object> rsService=goodsService.deleteStoreGoodsClassify(store,classifiesToDel);
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

    //添加商店所售卖商品的分类--传入需要添加的分类list，其中分类的top_level不得大于本店最大的top_level
    //必须传入分类名称、分类level
    @RequestMapping("/addClassifyOfStore")
    @ResponseBody
    public Object addClassifyOfStore(Store store, ArrayList<GoodsClassify> classifiesToAdd){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in addClassifyOfStore");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        
        Map<String,Object> rsService=goodsService.addStoreGoodsClassify(store,classifiesToAdd);
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

    //更改商店分类信息
    @RequestMapping("/modifyClassifyOfStore")
    @ResponseBody
    public Object modifyClassifyOfStore(Store store, GoodsClassify oldClassify,GoodsClassify newClassify){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in modifyClassifyOfStore");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Map<String,Object> rsService=goodsService.updateStoreGoodsClassify(store, oldClassify,newClassify);
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
        return rs;
    }

    //页面请求
    @RequestMapping("/manageClassify")
    public String toManageClassify(Store store){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in toManageClassify");
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
