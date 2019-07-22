package com.demo.mms.common.vo;

import com.demo.mms.common.domain.GoodsClassify;

public class ClassifySelledQueryVO extends GoodsClassify{
    private String store_selled_id;

    public String getStore_selled_id() {
        return store_selled_id;
    }

    public void setStore_selled_id(String store_selled_id) {
        this.store_selled_id = store_selled_id;
    }
}
