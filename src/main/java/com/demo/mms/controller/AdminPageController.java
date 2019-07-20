package com.demo.mms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminPageController {
    @RequestMapping("/")
    public String toAdminHome(){
        return "admin_userManage";
    }

    @RequestMapping("/userManage")
    public String toUserManage(){
        return "admin_userManage";
    }
}
