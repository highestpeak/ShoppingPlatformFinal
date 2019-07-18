package com.demo.mms.service;

import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;

import java.util.ArrayList;
import java.util.Map;

public interface GoodsService {

    /*
    查询商店所售卖所有商品分类，放入 classifyList
     */
    Map<String,Object> getStoreGoodsClassify(Store store, ArrayList classifyList);

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
}
