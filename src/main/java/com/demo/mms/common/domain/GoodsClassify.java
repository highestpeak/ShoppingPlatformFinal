package com.demo.mms.common.domain;

public class GoodsClassify {
    private String classify_id;
    private String top_level_classify_id;
    private String classify_name;
    private String create_time;
    private String update_time;

    public String getClassify_id() {
        return classify_id;
    }

    public void setClassify_id(String classify_id) {
        this.classify_id = classify_id;
    }

    public String getTop_level_classify_id() {
        return top_level_classify_id;
    }

    public void setTop_level_classify_id(String top_level_classify_id) {
        this.top_level_classify_id = top_level_classify_id;
    }

    public String getClassify_name() {
        return classify_name;
    }

    public void setClassify_name(String classify_name) {
        this.classify_name = classify_name;
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
