package com.demo.mms.service;

import com.demo.mms.common.domain.Store;

import java.util.ArrayList;
import java.util.Map;

public interface GoodsService {

    /*
    根据store，读取该store所拥有的所有商品类别，放到classifyList里面
     */
    Map<String,Object> getStoreGoodsClassify(Store store, ArrayList classifyList);
}
