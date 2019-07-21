package com.demo.mms.common.vo;

import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;

public class ViewHistoryGetVO {
    private User user;
    private Store store;
    private GoodsClassify goodsClassify;//如果为请求所有分类，则为all

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public GoodsClassify getGoodsClassify() {
        return goodsClassify;
    }

    public void setGoodsClassify(GoodsClassify goodsClassify) {
        this.goodsClassify = goodsClassify;
    }
}
