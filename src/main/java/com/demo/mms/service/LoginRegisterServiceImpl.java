package com.demo.mms.service;

import com.demo.mms.common.domain.Admin;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Seller;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.dao.UserOperateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class LoginRegisterServiceImpl implements LoginRegisterService{
    @Autowired
    UserOperateMapper userOperateMapper;

    @Override
    public Map<String,Object> login(String user_id,String verify,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
        Map<String,Object> rs = new HashMap<>();
        if(isAlreadyLogin(user_id,request)){//已经登录
            rs.put("already login",true);
            return rs;
        }
        //没有登陆
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        if(!userFind.getVerify().equals(verify)){//密码不正确
            rs.put("password wrong",true);
            return rs;
        }
//        if(true){//验证码不正确
//
//        }
        // 创建Cookie
        Cookie cookie = new Cookie("user_id_"+user_id, "exist");
        cookie.setMaxAge(60);// 有效期,秒为单位
        response.addCookie(cookie);// 设置cookie
        return rs;
    }

    @Override
    public Map<String, Object> logout(String user_id, HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> rs = new HashMap<>();
        if(!isAlreadyLogin(user_id,request)){//没有登录
            rs.put("already login",false);
            return rs;
        }
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        //删除会话消息
        Cookie cookie= ProjectFactory.getCookieByName(request,user_id);
        cookie.setMaxAge(0);//立即销毁
        System.out.println("被删除cookie:"+cookie.getName());
        response.addCookie(cookie);
        return rs;
    }

    //如果添加新的角色，需要修改的地方最少
    @Override
    public Map<String,Object> registerUser(User user, String type) {
        Map<String,Object> rs=new HashMap<>();
        if(!ProjectFactory.userTypeTable.contains(type)){
            rs.put("type not find",true);
            return rs;
        }
        //所有种类均需要此步user表判断
        Map<String,Object> rsTemp=addUser(user);
        if(rsTemp!=null && !rsTemp.isEmpty()){
            rs.putAll(rsTemp);
            return rs;
        }
        if(type.equals("User")){
            return rs;
        }
        //end
        //加入具体种类的用户
        //具体种类用户逻辑均为:
        //首先判断是否在user表内
        //再判断是否在具体类别表单中
        User userFind=null;
        userFind= userOperateMapper.queryUser(type,"user_id",user.getUser_id());
        if(userFind!=null){//已经存在具体种类user
            rs.put(type+" existed",true);
            return rs;
        }
        //type类别user不存在，可以新建
        switch (type){//user类型 已经返回
            case "Buyer":
                Buyer buyer=(Buyer)user;
                buyer.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                buyer.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertBuyer(buyer);
                break;
            case "Seller":
                Seller seller=(Seller)user;
                seller.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                seller.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertSeller(seller);
                break;
            case "Admin":
                Admin admin=(Admin)user;
                admin.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                admin.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertAdmin(admin);
                break;
            default:
                //抛出异常
                rs=new HashMap<>();
                rs.put("type not find",true);
                break;
        }

        return rs;
    }

    private Map<String,Object> addUser(User user){
        //处理校验
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind!=null){//已经存在user
            rs.put("user existed",true);
            return rs;
        }
        //user不存在，可以新建
        user.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
        user.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
        userOperateMapper.insertUser(user);
        return rs;
    }

    @Override
    public boolean isAlreadyLogin(String user_id, HttpServletRequest request) {
        Cookie cookie= ProjectFactory.getCookieByName(request,"user_id_"+user_id);
        if(cookie!=null){//已经登录
            return true;
        }
        return false;
    }

    @Override
    public Map<String, Object> newVerify(String user_id, String email, String newVerify) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        if(!userFind.getEmail().equals(email)){//邮箱不批配
            rs.put("email error",true);
            return rs;
        }
        userOperateMapper.updateUser("user_id",user_id,
                                    "verify",newVerify);
        return rs;
    }

}
