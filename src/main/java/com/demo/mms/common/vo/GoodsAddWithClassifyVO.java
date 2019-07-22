package com.demo.mms.common.vo;

import com.demo.mms.common.domain.Goods;

public class GoodsAddWithClassifyVO extends Goods{
    private String classify_name;

    public String getClassify_name() {
        return classify_name;
    }

    public void setClassify_name(String classify_name) {
        this.classify_name = classify_name;
    }
}
