package com.demo.mms.common.vo;

import com.demo.mms.common.domain.User;

public class UserVO extends User{
    private String userType;

    public User getUser() {
        User user=new User();
        user.setRealname(this.getRealname());
        user.setSex(this.getSex());
        user.setVerify(this.getVerify());
        user.setUser_id(this.getUser_id());
        user.setEmail(this.getEmail());
        user.setCreate_time(this.getCreate_time());
        user.setUpdate_time(this.getUpdate_time());
        user.setAvator_url(this.getAvator_url());
        user.setIdentity(this.getIdentity());
        user.setNickname(this.getNickname());
        user.setNote(this.getNote());
        return user;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

}
