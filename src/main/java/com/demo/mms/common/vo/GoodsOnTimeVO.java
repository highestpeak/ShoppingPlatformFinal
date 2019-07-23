package com.demo.mms.common.vo;

import java.util.ArrayList;

public class GoodsOnTimeVO {
    private String create_time;
    private ArrayList<String > goodsNames;

    public ArrayList<String> getGoodsNames() {
        return goodsNames;
    }

    public void setGoodsNames(ArrayList<String> goodsNames) {
        this.goodsNames = goodsNames;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }
}
