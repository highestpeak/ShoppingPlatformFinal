package com.demo.mms.common.domain;

import java.util.Date;

public class OrderEntry {
    private String id;
    private String goodsId;
    private Integer quantity;
    private Integer unitPrice;

    public OrderEntry(String id, String goodsId, Integer quantity, Integer unitPrice) {
        this.id = id;
        this.goodsId = goodsId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }
}
