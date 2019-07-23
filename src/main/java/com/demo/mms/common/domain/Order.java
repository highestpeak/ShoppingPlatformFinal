package com.demo.mms.common.domain;


import java.sql.Timestamp;
import java.util.Date;

public class Order {
    private String id;

    private String userId;

    private String storeId;

    private String note;

    /*
    0 - 下单
    1 - 支付成功
    2 - 发货
    3 - 收货
    4 - 完成评价
     */
    private int step;

    private String consignee;
    private String phone;
    private String address;
    private String postcode;

    private String expressId;

    private String reviewId;

    private Date createTime;

    private Date updateTime;

    public Order(String id, String userId, String storeId, String note, int step, String consignee, String phone, String address, String postcode, String expressId, String reviewId, Date createTime, Date updateTime) {
        this.id = id;
        this.userId = userId;
        this.storeId = storeId;
        this.note = note;
        this.step = step;
        this.consignee = consignee;
        this.phone = phone;
        this.address = address;
        this.postcode = postcode;
        this.expressId = expressId;
        this.reviewId = reviewId;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Order(String id, String userId, String storeId, String note, Integer step, String expressId, String reviewId, Timestamp createTime, Timestamp updateTime) {
        this.id = id;
        this.userId = userId;
        this.storeId = storeId;
        this.note = note;
        this.step = step;
        this.expressId = expressId;
        this.reviewId = reviewId;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }

    public String getExpressId() {
        return expressId;
    }

    public void setExpressId(String expressId) {
        this.expressId = expressId;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
