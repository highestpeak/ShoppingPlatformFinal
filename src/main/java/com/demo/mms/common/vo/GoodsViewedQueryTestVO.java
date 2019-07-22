package com.demo.mms.common.vo;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.GoodsViewed;
import com.demo.mms.common.domain.User;

public class GoodsViewedQueryTestVO {//---第一次使用数据库到实体类的复杂结果映射
    private User user;
    private GoodsViewed goodsViewed;
    private Goods goods;
    private GoodsClassify goodsClassify;

    public GoodsViewed getGoodsViewed() {
        return goodsViewed;
    }

    public void setGoodsViewed(GoodsViewed goodsViewed) {
        this.goodsViewed = goodsViewed;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public GoodsClassify getGoodsClassify() {
        return goodsClassify;
    }

    public void setGoodsClassify(GoodsClassify goodsClassify) {
        this.goodsClassify = goodsClassify;
    }
}
