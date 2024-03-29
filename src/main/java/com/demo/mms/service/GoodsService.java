package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.vo.GoodsAddWithClassifyVO;
import com.demo.mms.common.vo.GoodsOnTimeVO;
import com.demo.mms.common.vo.GoodsWithClassifyVO;
import com.demo.mms.common.vo.StarGoodsGetVO;

import java.util.ArrayList;
import java.util.Map;

public interface GoodsService {

    /*
    查询商店所售卖所有商品分类，放入 classifyList
     */
    Map<String,Object> getStoreGoodsClassify(Store store, ArrayList classifyList);

    /*
    获取分类统计信息
     */
    Map<String,Object> getStoreGoodsClassifyChartInfo(Store store, ArrayList classifyList);

    /*
    classifiesToDel 包含所有本商店已经拥有的，需要删除的分类
     */
    Map<String,Object> deleteStoreGoodsClassify(Store store, ArrayList<GoodsClassify> classifiesToDel);

    /*
    classifiesToAdd 包含所有需要添加的分类
     */
    Map<String,Object> addStoreGoodsClassify(Store store, ArrayList<GoodsClassify> classifiesToAdd);

    /*
    classifiesToAdd 包含所有需要添加的分类
     */
    Map<String,Object> updateStoreGoodsClassify(Store store, GoodsClassify oldClassify,GoodsClassify newClassify);

    /*
    根据分类查找商店的，该分类下面所有商品
     */
    Map<String,Object> getStoreGoods(Store store, GoodsClassify classifyToGet,ArrayList goodsList);

    Map<String,Object> updateStoreGoods(Store store, Goods oldGoods, Goods newGoods);

    Map<String,Object> delStoreGoods(Store store, ArrayList<Goods> goodsToDel);

    Map<String,Object> addStoreGoods(Store store, ArrayList<GoodsAddWithClassifyVO> goodsToAdd);

    /*
    根据商品id，寻找一个商品的信息并返回
     */
    Map<String,Object> getStoreGoodsInfo(Store store, Goods goodsToGet,User user);

    Map<String,Object> starGoods(User user, Store store, Goods goods);

    Map<String,Object> starClassify(User user, GoodsClassify goodsClassify);

    Map<String,Object> getStarGoods(String user_id, ArrayList<StarGoodsGetVO> starGoodsVOs);

    Map<String,Object> getGoodsOnWithTime(String store_id,Map<String,ArrayList<String>> goodsOnTimeVOS) throws Exception;

    Map<String,Object> getAllGoodsSelled(Store store,ArrayList<GoodsWithClassifyVO> goodsList);
}
