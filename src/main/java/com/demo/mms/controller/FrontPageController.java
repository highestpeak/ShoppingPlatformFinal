package com.demo.mms.controller;

import com.demo.mms.service.LoginRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/front")
@Controller
public class FrontPageController {
    @Autowired
    LoginRegisterService loginRegisterService;

    @RequestMapping("/home")
    public String frontHomeGet(ModelMap modelMap,HttpServletRequest request){
        System.out.println("in frontHomeGet edit");
        modelMap.put("isLogin",loginRegisterService.isAlreadyLogin("",request));
//        modelMap.put("isLogin",true);
        return "front_home";
    }

    @RequestMapping("/history")
    public String viewHistoryGet(){
        System.out.println("in viewHistoryGet");
        return "front_history";
    }

    @RequestMapping("/order")
    public String oderGet(){
        System.out.println("in oderGet");
        return "front_My_order";
    }

    @RequestMapping("/sysNotice")
    public String sysNoticeGet(){
        System.out.println("in sysNoticeGet");
        return "front_SystemNotice";
    }

    @RequestMapping("/personalCenter")
    public String personalCenterGet(){
        System.out.println("in personalCenterGet");
        return "front_My_Personalcenter";
    }

    @RequestMapping("/myEvaluation")
    public String myEvaluationGet(){
        System.out.println("in myEvaluation");
        return "front_My_evaluation";
    }

    @RequestMapping("/cart")
    public String cartGet(){
        System.out.println("in myEvaluation");
        return "front_cart";
    }

}
