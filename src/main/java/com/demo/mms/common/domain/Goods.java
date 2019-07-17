package com.demo.mms.common.domain;

public class Goods {
    private String goods_id;
    private String store_id;
    private String pic_url;



    private String classify_id;
    private String classify_name;
    private String status;
    private String old_level;
    private String create_time;
    private String update_time;

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getStore_id() {
        return store_id;
    }

    public void setStore_id(String store_id) {
        this.store_id = store_id;
    }

    public String getPic_url() {
        return pic_url;
    }

    public void setPic_url(String pic_url) {
        this.pic_url = pic_url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOld_level() {
        return old_level;
    }

    public void setOld_level(String old_level) {
        this.old_level = old_level;
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
    public String getClassify_id() {
        return classify_id;
    }

    public void setClassify_id(String classify_id) {
        this.classify_id = classify_id;
    }

    public String getClassify_name() {
        return classify_name;
    }

    public void setClassify_name(String classify_name) {
        this.classify_name = classify_name;
    }
}
