package com.demo.mms.common.domain;

public class Admin extends User{

    private String permission;

    private String create_time;

    private String update_time;

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
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