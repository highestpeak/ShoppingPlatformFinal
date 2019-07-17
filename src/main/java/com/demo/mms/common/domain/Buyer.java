package com.demo.mms.common.domain;

public class Buyer extends User{
    private String avator_url;

    private String nickname;

    private String bank_card;

    private String create_time;

    private String update_time;

    public String getAvator_url() {
        return avator_url;
    }

    public void setAvator_url(String avator_url) {
        this.avator_url = avator_url;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getBank_card() {
        return bank_card;
    }

    public void setBank_card(String bank_card) {
        this.bank_card = bank_card;
    }

    @Override
    public String getCreate_time() {
        return create_time;
    }

    @Override
    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    @Override
    public String getUpdate_time() {
        return update_time;
    }

    @Override
    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
