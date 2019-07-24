package com.demo.mms.dto;

public class InsertReviewDTO {
    private String content;
    private Integer rating;

    public InsertReviewDTO(String content, Integer rating) {
        this.content = content;
        this.rating = rating;
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
}
