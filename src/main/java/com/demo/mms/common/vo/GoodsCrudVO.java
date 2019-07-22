package com.demo.mms.common.vo;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.Store;

import java.util.List;

public class GoodsCrudVO {
    private Store store;
    private Goods oldGoods;
    private Goods newGoods;

    private List<Goods> goodsToDel;
    private List<GoodsAddWithClassifyVO> goodsToAdd;

    public List<Goods> getGoodsToDel() {
        return goodsToDel;
    }

    public List<GoodsAddWithClassifyVO> getGoodsToAdd() {
        return goodsToAdd;
    }

    public void setGoodsToAdd(List<GoodsAddWithClassifyVO> goodsToAdd) {
        this.goodsToAdd = goodsToAdd;
    }

    public void setGoodsToDel(List<Goods> goodsToDel) {
        this.goodsToDel = goodsToDel;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Goods getOldGoods() {
        return oldGoods;
    }

    public void setOldGoods(Goods oldGoods) {
        this.oldGoods = oldGoods;
    }

    public Goods getNewGoods() {
        return newGoods;
    }

    public void setNewGoods(Goods newGoods) {
        this.newGoods = newGoods;
    }
}
