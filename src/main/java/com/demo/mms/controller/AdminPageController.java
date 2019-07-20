package com.demo.mms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminPageController {
    @RequestMapping("/userManage")
    public String toUserManage(){
        return "admin_userManage";
    }
}
