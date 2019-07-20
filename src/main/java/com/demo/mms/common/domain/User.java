package com.demo.mms.common.domain;

import java.io.*;

public class User {
    private String user_id;
    private String verify;
    private String realname;
    private String nickname;
    private String avator_url;
    private Boolean sex;
    private String email;
    private String identity;
    private String note;
    private String create_time;
    private String update_time;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getVerify() {
        return verify;
    }

    public void setVerify(String verify) {
        this.verify = verify;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
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

    public String getType(){
        String fullClassNameWithPath=this.getClass().getName();
        return fullClassNameWithPath.substring(fullClassNameWithPath.lastIndexOf(".")+1);
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvator_url() {
        return avator_url;
    }

    public void setAvator_url(String avator_url) {
        this.avator_url = avator_url;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

//    public User serializableClone() throws IOException, ClassNotFoundException {
//        User clone;
//
//        ByteArrayOutputStream bo = new ByteArrayOutputStream();
//        ObjectOutputStream oo = new ObjectOutputStream(bo);
//        oo.writeObject(this);
//        ByteArrayInputStream bi = new ByteArrayInputStream(bo.toByteArray());
//        ObjectInputStream oi = new ObjectInputStream(bi);
//        clone = (User) oi.readObject();
//
//        return clone;
//    }
}
