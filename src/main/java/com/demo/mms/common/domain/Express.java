package com.demo.mms.common.domain;

public class Express {
    private String id;
    private String expressCompanyId;
    private String expressNumber;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Express(String id, String expressCompanyId, String expressNumber) {
        this.id = id;
        this.expressCompanyId = expressCompanyId;
        this.expressNumber = expressNumber;
    }
}
