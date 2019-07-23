package com.demo.mms.controller;

import com.demo.mms.common.domain.Admin;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.MailInfoCrudVO;
import com.demo.mms.common.vo.UserVO;
import com.demo.mms.common.vo.ViewHistoryGetVO;
import com.demo.mms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//路由到service函数，接收字典返回值---错误、错误类型
//使用元组返回分页数据
@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    //数据请求
    //前台购买者调用
    @RequestMapping("/addBuyer")
    @ResponseBody
    public Object addBuyer(@RequestBody Buyer user){
        System.out.println("in addUser");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        //调用service服务
        Map<String,Object> rsService= userService.registerUser(user,"Buyer");
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
    public Object addAdmin(@RequestBody Admin user){
        System.out.println("in addAdmin");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        //调用service服务
        Map<String,Object> rsService= userService.registerUser(user,"Admin");
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
//        Map<String,Object> rsService=userService.registerUser("Seller",user);
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
    public Object login(@RequestBody User user,
                        HttpServletRequest request,
                        HttpServletResponse response){
        System.out.println("in login");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin= userService.login(user.getUser_id(),user.getVerify(),request,response);
        if(rsLogin!=null && !rsLogin.isEmpty()){//含有错误信息
            rs.putAll(rsLogin);
            rs.put("success",false);
            return rs;
        }
        if(rs.size()>1){
            rs.put("success",false);
        }
        return rs;
        //不返回列表，返回页面
        //buyer返回index
        //admin返回admin page
    }

    //使用user_id退出有风险，不法者可能会退出其他用户的登入状态
    @RequestMapping("/logout")
    @ResponseBody
    public Object logout(@RequestBody User user,
                         HttpServletRequest request,
                         HttpServletResponse response){
        System.out.println("in logout");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin= userService.logout(user.getUser_id(),request,response);
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

    @RequestMapping("/getInfo")
    @ResponseBody
    public Object getUserInfo(User user){
        System.out.println("in getUserInfo");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin= userService.getUserInfo(user);
        if(rsLogin!=null && !rsLogin.isEmpty() && !rsLogin.containsKey("userFind")){//含有错误信息
            rs.putAll(rsLogin);
            rs.put("success",false);
            return rs;
        }
        rs.putAll(rsLogin);
        if(rs.size()>1 && !rsLogin.containsKey("userFind")){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/newVerify")
    @ResponseBody
    public Object newVerify(@RequestBody User user){
        System.out.println("in forgetVerify");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        User userOld=new User();
        User userNew=new User();
        userOld.setUser_id(user.getUser_id());
        userOld.setEmail(user.getEmail());
        userNew.setVerify(user.getVerify());
        Map<String,Object> rsEdit= userService.updateUser(userOld,userNew);
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

    //注销用户
    //使用user_id有风险，不法者可能会注销其他用户
    @RequestMapping("/drop")
    @ResponseBody
    public Object dropUser(@RequestBody User user){
        System.out.println("in dropUser");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsLogin= userService.delUser(user);
        if(rsLogin!=null && !rsLogin.isEmpty() && !rsLogin.containsKey("userFind")){//含有错误信息
            rs.putAll(rsLogin);
            rs.put("success",false);
            return rs;
        }
        rs.putAll(rsLogin);
        if(rs.size()>1 && !rsLogin.containsKey("userFind")){
            rs.put("success",false);
        }
        return rs;
    }

    @RequestMapping("/modify")
    @ResponseBody
    public Object updateUserInfo(@RequestBody List<UserVO> userVOs){
        System.out.println("in updateUserInfo");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);

        User userOld=null;
        User userNew=null;
        for (UserVO userVO: userVOs){
            switch (userVO.getUserType()){
                case "userOld":
                    userOld=userVO.getUser();
                    break;
                case "userNew":
                    userNew=userVO.getUser();
                    break;
                default:
                    rs.put("success",false);
                    rs.put("userType","not find");
                    return rs;
            }
        }
        if (userOld==null || userNew==null){
            rs.put("data error","not enough data");
            rs.put("success",false);
            return rs;
        }

        Map<String,Object> rsService= userService.updateUser(userOld,userNew);
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
        rs.put("already login", userService.isAlreadyLogin(user.getUser_id(),request));
        rs.put("success",true);
        return rs;
    }

    @RequestMapping("/newPicVerify")
    @ResponseBody
    public Object newPicVerify(){
        return null;
    }

    //猜你喜欢
    //根据游览历史--选取频率较高的商品和分类推荐
    //根据收货地址--具有相同收货地址的用户的购买推荐
    //根据销量---推荐销量高的商品
    //根据用户关注的商品来推荐
    //推荐的商品后面跟一字段是 推荐原因
    @RequestMapping("/guessLike")
    @ResponseBody
    public Object guessUserLike(@RequestBody User user){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=null;
//        rsService=goodsService.starGoods(starGoodsVO.getUserId(),starGoodsVO.getStore(),starGoodsVO.getGoods());
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

    @RequestMapping("/getUserStar/{user_id}")
    @ResponseBody
    public Object getUserStar(@PathVariable String user_id){
        System.out.println(ProjectFactory.getPorjectStrDate(new Date())+" in goodsQuery");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService=null;
        rsService=userService.getUserStar(user_id);
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

    //获取用户游览历史
    //根据用户获取商品的请求来加入
    //根据用户游览请求的分类来加入
    @RequestMapping("/viewHistory")
    @ResponseBody
    public Object getViewHistory(@RequestBody ViewHistoryGetVO viewHistoryGetVO){
        System.out.println("in getViewHistory");
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        Map<String,Object> rsService= userService.getViewHistory(viewHistoryGetVO.getUser(), viewHistoryGetVO.getGoodsClassify());
        if(!rsService.containsKey("viewedHistoryReturn") && rsService!=null && !rsService.isEmpty()){//含有错误信息
            rs.putAll(rsService);
            rs.put("success",false);
            return rs;
        }
        if(!rsService.containsKey("viewedHistoryReturn") && rs.size()>1){
            rs.put("success",false);
        }
        return rs;
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
        return "login_login";
    }
    @RequestMapping("/toRegister")
    public Object toRegister(){
        return "login_register";
    }
    @RequestMapping("/toNewPassword")
    public Object toNewPassword(){
        return "login_forgetPassword";
    }
}
