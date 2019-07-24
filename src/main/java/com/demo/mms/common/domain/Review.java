package com.demo.mms.common.domain;

import java.sql.Timestamp;
import java.util.Date;

public class Review {
    private String id;
    private String content;
    private Integer rating;
    private Date createTime;

    public Review(String id, String content, Integer rating, Timestamp time) {
        this.id = id;
        this.content = content;
        this.rating = rating;
        this.createTime = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
