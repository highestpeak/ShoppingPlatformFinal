package com.demo.mms.common.vo;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;

public class StarGoodsVO {
    private User user;
    private Store store;
    private Goods goods;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }
}
