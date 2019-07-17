package com.demo.mms.common.domain;

public class Store {
    private String store_id;
    private String note;
    private String store_pic_url;
    private String store_classify;
    private String level;
    private String certification;
    private String create_time;
    private String update_time;

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStore_pic_url() {
        return store_pic_url;
    }

    public void setStore_pic_url(String store_pic_url) {
        this.store_pic_url = store_pic_url;
    }

    public String getStore_classify() {
        return store_classify;
    }

    public void setStore_classify(String store_classify) {
        this.store_classify = store_classify;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
