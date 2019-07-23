package com.demo.mms.controller;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.*;
import com.demo.mms.service.GoodsService;
import com.demo.mms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@RequestMapping("/goods")
@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UserService userService;

    //查询商品
    //按分类查询
    //获取一个classify的所有商品，即list
    @RequestMapping("/getByClassify")
    @ResponseBody
    public Object goodsQuery(@RequestBody GoodsQueryVO goodsQueryVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Store store= goodsQueryVO.getStore();
        GoodsClassify classifyToGet= goodsQueryVO.getGoodsClassify();
        ArrayList goodsList=new ArrayList();
        Map<String,Object> rsService=null;
        rsService=goodsService.getStoreGoods(store,classifyToGet,goodsList);
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
        rs.put("goodsList",goodsList);
        return rs;
    }

    //查询商品--搜搜商品
    //按商品信息查询
    @RequestMapping("/getByInfo")
    @ResponseBody
    public Object goodsQuery(Store store,Goods goodsToGet){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        ArrayList goodsList=new ArrayList();
        Map<String,Object> rsService=null;
        GoodsClassify classifyToGet=new GoodsClassify();
        classifyToGet.setClassify_name("all");
        rsService=goodsService.getStoreGoods(store,classifyToGet,goodsList);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //here!!
        goodsList=getBySearchGoodsInfo(goodsList,goodsToGet);
        if(goodsList==null || goodsList.isEmpty()){
            rs.put("Goods find",false);
        }
        //处理返回页面的需要填写的值
        //code here
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        rs.put("goodsList",goodsList);
        return rs;
    }

    //查询商品--请求商品id
    //按商品信息查询
    @RequestMapping("/getGoodsInfo")
    @ResponseBody
    public Object goodsInfoGet(Store store,Goods goodsToGet){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=null;
        rsService=goodsService.getStoreGoodsInfo(store,goodsToGet);
        if(!rsService.containsKey("goodsGet") && rsService!=null && !rsService.isEmpty()){//含有错误信息
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
        rs.putAll(rsService);
        return rs;
    }

    //修改商品
    @RequestMapping("/modify")
    @ResponseBody
    public Object goodsUpdate(@RequestBody GoodsCrudVO goodsCrudVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsUpdate");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Store store=goodsCrudVO.getStore();
        Goods oldGoods=goodsCrudVO.getOldGoods();
        Goods newGoods=goodsCrudVO.getNewGoods();

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
    public Object goodsDel(@RequestBody GoodsCrudVO goodsCrudVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsDel");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Store store=goodsCrudVO.getStore();
        ArrayList<Goods> goodsToDel=(ArrayList<Goods>)goodsCrudVO.getGoodsToDel();

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
    public Object goodsAdd(@RequestBody GoodsCrudVO goodsCrudVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsAdd");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        Store store=goodsCrudVO.getStore();
        ArrayList<GoodsAddWithClassifyVO> goodsToAdd=(ArrayList<GoodsAddWithClassifyVO>)goodsCrudVO.getGoodsToAdd();

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

    //关注商品
    //必须传入goods的id 或者传入store id和goods name的组合
    //必须传入user id
    @RequestMapping("/star/set")
    @ResponseBody
    public Object starGoods(@RequestBody StarGoodsVO starGoodsVO){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in starGoods");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=null;
        rsService=goodsService.starGoods(starGoodsVO.getUser(),starGoodsVO.getStore(),starGoodsVO.getGoods());
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

    @RequestMapping("/star/get")
    @ResponseBody
    public Object getStarGoods(String user_id){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in starGoods");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        ArrayList<StarGoodsGetVO> starGoodsVOs=new ArrayList<>();
        Map<String,Object> rsService=null;
        rsService=goodsService.getStarGoods(user_id,starGoodsVOs);
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

    @RequestMapping("/star/del")
    @ResponseBody
    public Object delStarGoods(String user_id,String goodsStar_id){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in starGoods");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=null;
        rsService=userService.delUserStar(user_id,goodsStar_id);
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

    //模糊检索
    private ArrayList<Goods> getBySearchGoodsInfo(ArrayList<Goods> goodsList,Goods goodsToGet) {
        //默认按商品名称检索
        ArrayList<Goods> findList=new ArrayList<>();
        String namePattern = goodsToGet.getGoods_name().replace("","(.*?)");
        for (Goods good:goodsList){
            if (Pattern.matches(namePattern, good.getGoods_name())){
                findList.add(good);
            }
        }
        return findList;
    }


}
