package com.demo.mms.controller;

import com.demo.mms.common.domain.Admin;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.User;
import com.demo.mms.service.LoginRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//路由到service函数，接收字典返回值---错误、错误类型
//使用元组返回分页数据
@Controller
public class LoginRegisterController {
    @Autowired
    private LoginRegisterService loginRegisterService;

    //数据请求
    //前台购买者调用
    @RequestMapping("/addBuyer")
    @ResponseBody
    public Object addBuyer(Buyer user){
        System.out.println("in addUser");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        //调用service服务
        Map<String,Object> rsService=loginRegisterService.registerUser(user,"Buyer");
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    //管理员后台调用
    @RequestMapping("/addAdmin")
    @ResponseBody
    public Object addAdmin(Admin user){
        System.out.println("in addAdmin");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        //调用service服务
        Map<String,Object> rsService=loginRegisterService.registerUser(user,"Admin");
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        //处理返回页面的需要填写的值
        //code here
        //---
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    //扩展保留
//    //商家调用
//    @RequestMapping("/addSeller")
//    @ResponseBody
//    public Object addSeller(Seller user){
//        System.out.println("in addSeller");
//        Map<String,Object> rs = new HashMap<>();
//        //调用service服务
//        Map<String,Object> rsService=loginRegisterService.registerUser("Seller",user);
//        if(rsService!=null && rsService.isEmpty()){//含有错误信息
//            rs.putAll(rsService);
//            return rs;
//        }
//        //处理返回页面的需要填写的值
//        //code here
//        //---
//        return rs;
//    }

    @RequestMapping("/login")
    @ResponseBody
    public Object login(String user_id,String verify,
                        HttpServletRequest request,
                        HttpServletResponse response){
        System.out.println("in login");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin=loginRegisterService.login(user_id,verify,request,response);
        if(rsLogin!=null && !rsLogin.isEmpty()){//含有错误信息
            rs.putAll(rsLogin);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Object logout(String user_id,
                         HttpServletRequest request,
                         HttpServletResponse response){
        System.out.println("in logout");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin=loginRegisterService.logout(user_id,request,response);
        if(rsLogin!=null && !rsLogin.isEmpty()){//含有错误信息
            rs.putAll(rsLogin);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/newVerify")
    @ResponseBody
    public Object newVerify(String user_id,
                            String email,
                            String newVerify){
        System.out.println("in forgetVerify");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        User userOld=new User();
        User userNew=new User();
        userOld.setUser_id(user_id);
        userOld.setEmail(email);
        userNew.setVerify(newVerify);
        Map<String,Object> rsEdit=loginRegisterService.updateUser(userOld,userNew);
        if(rsEdit!=null && !rsEdit.isEmpty()){//含有错误信息
            rs.putAll(rsEdit);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/modifyUser")
    @ResponseBody
    public Object updateUserInfo(User userOld,User userNew){
        System.out.println("in updateUserInfo");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=loginRegisterService.updateUser(userOld,userNew);
        if(rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public Object checkPassword(String user_id,String password){
        //返回 password的 true和false
        //这个函数可以在验证用户的时候使用，比如支付的时候需要输入一下
        return null;
    }

    @RequestMapping("/checkIfLogin")
    @ResponseBody
    public Object checkIfLogin(User user,HttpServletRequest request){
        System.out.println("in checkIfLogin");
        Map<String,Object> rs = new HashMap<>();
        rs.put("already login",loginRegisterService.isAlreadyLogin(user.getUser_id(),request));
        rs.put("success",true);
        return rs;
    }

    @RequestMapping("/newPicVerify")
    @ResponseBody
    public Object newPicVerify(){
        return null;
    }

    private static boolean isEmail(String string) {
        if (string == null)
            return false;
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p;
        Matcher m;
        p = Pattern.compile(regEx1);
        m = p.matcher(string);
        if (m.matches())
            return true;
        else
            return false;
    }

    //重定位到具体页面
    //如何在前端直接跳转页面??
    @RequestMapping("/toLogin")
    public String  toLogin(){
        return "login";
    }
    @RequestMapping("/toRegister")
    public Object toRegister(){
        return "register";
    }
    @RequestMapping("/toNewPassword")
    public Object toNewPassword(){
        return "forgetPassword";
    }
}
