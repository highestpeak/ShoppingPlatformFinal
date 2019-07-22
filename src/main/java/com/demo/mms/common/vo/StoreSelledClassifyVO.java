package com.demo.mms.common.vo;

public class StoreSelledClassifyVO {
    private String classify_id;
    private String classify_name;
    private String parent_id;

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

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public boolean equals(Object obj) {
        StoreSelledClassifyVO tempVo=(StoreSelledClassifyVO)obj;
        return this.getClassify_id().equals(tempVo.getClassify_id());
    }
}
