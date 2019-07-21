package com.demo.mms.common.vo;

import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;

public class GoodsQueryVO {
    private Store store;
    private GoodsClassify goodsClassify;

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public GoodsClassify getGoodsClassify() {
        return goodsClassify;
    }

    public void setGoodsClassify(GoodsClassify goodsClassify) {
        this.goodsClassify = goodsClassify;
    }
}
