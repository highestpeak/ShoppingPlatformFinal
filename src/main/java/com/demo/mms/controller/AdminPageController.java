package com.demo.mms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminPageController {
    @RequestMapping("/")
    public String toAdminHome(){
        return "admin_home";
    }

    @RequestMapping("/classifyManage")
    public String toClassifyManage(){
        return "admin_classifyManage";
    }

    @RequestMapping("/goodsManage")
    public String toGoodsManage(){
        return "admin_goodManage";
    }

    @RequestMapping("/orderManage")
    public String toOrderManage(){
        return "admin_orderManage";
    }

    @RequestMapping("/userManage")
    public String toUserManage(){
        return "admin_userManage";
    }

    @RequestMapping("/storeInfoManage")
    public String toStoreInfoManage(){
        return "admin_storeInfoManage";
    }


}
