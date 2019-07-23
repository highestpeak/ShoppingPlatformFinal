package com.demo.mms.common.domain;

public class Express {
    private String id;
    private String consignee;
    private String address;
    private String postcode;
    private String phone;
    private String expressCompanyId;
    private String expressNumber;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getExpressCompanyId() {
        return expressCompanyId;
    }

    public void setExpressCompanyId(String expressCompanyId) {
        this.expressCompanyId = expressCompanyId;
    }

    public String getExpressNumber() {
        return expressNumber;
    }

    public void setExpressNumber(String expressNumber) {
        this.expressNumber = expressNumber;
    }

    public Express(String id, String consignee, String address, String postcode, String phone, String expressCompanyId, String expressNumber) {
        this.id = id;
        this.consignee = consignee;
        this.address = address;
        this.postcode = postcode;
        this.phone = phone;
        this.expressCompanyId = expressCompanyId;
        this.expressNumber = expressNumber;
    }
}
