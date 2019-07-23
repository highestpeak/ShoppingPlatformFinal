package com.demo.mms.controller;

import com.demo.mms.common.vo.RedirectToCartVO;
import com.demo.mms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/front")
@Controller
public class FrontPageController {
    @Autowired
    UserService userService;

    @RequestMapping("/home")
    public String frontHomeGet(ModelMap modelMap,HttpServletRequest request){
        System.out.println("in frontHomeGet edit");
        modelMap.put("isLogin", userService.isAlreadyLogin("",request));
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

    @RequestMapping("/goodsInfoById/{store_id}/{goods_id}")
    public String goodsInfoByIdGet(@PathVariable String store_id,@PathVariable String goods_id,
                                   HttpServletRequest request,
                                   HttpServletResponse response){
        System.out.println("in goodsInfoByIdGet");
        return "good_info";
    }

    @RequestMapping("/goodsInfoByName/{store_id}/{goods_name}")
    public String goodsInfoByNameGet(@PathVariable String store_id,@PathVariable String goods_name){
        System.out.println("in goodsInfoByIdGet");
        return "good_info";
    }

    @RequestMapping("/redirectToCart")
    @ResponseBody
    public String redirectToCart(@RequestBody RedirectToCartVO redirectToCartVO){
        System.out.println("in goodsInfoByIdGet");

        return "good_info";
    }

}
