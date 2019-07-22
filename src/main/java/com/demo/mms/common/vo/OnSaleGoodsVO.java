package com.demo.mms.common.vo;

import com.demo.mms.common.domain.OnSale;

public class OnSaleGoodsVO {
    private OnSale onSale;
    private String  goods_name;
    private int price;

    public OnSale getOnSale() {
        return onSale;
    }

    public void setOnSale(OnSale onSale) {
        this.onSale = onSale;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
