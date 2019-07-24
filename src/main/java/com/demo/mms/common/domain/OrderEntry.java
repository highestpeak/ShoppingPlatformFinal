package com.demo.mms.common.domain;

public class OrderEntry {
    private String id;
    private String orderId;
    private String goodsId;
    private Integer quantity;
    private Integer unitPrice;
    private String reviewId;

    public OrderEntry(String id, String orderId, String goodsId, Integer quantity, Integer unitPrice, String reviewId) {
        this.id = id;
        this.orderId = orderId;
        this.goodsId = goodsId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.reviewId = reviewId;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
}
