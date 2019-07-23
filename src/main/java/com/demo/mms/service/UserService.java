package com.demo.mms.service;

import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Map;

public interface UserService {
    Map<String,Object> login(String user_id, String verify,
                             HttpServletRequest request,
                             HttpServletResponse response);

    Map<String,Object> logout(String user_id,
                              HttpServletRequest request,
                              HttpServletResponse response);

    Map<String,Object> registerUser(User user, String type);

    boolean isAlreadyLogin(String user_id, HttpServletRequest request);

    Map<String,Object> newVerify(String user_id, String email, String newVerify);

    Map<String,Object> updateUser(User userOld, User userNew);

    Map<String,Object> getUserInfo(User user);

    Map<String,Object> delUser(User user);

    Map<String,Object> getViewHistory(User user, GoodsClassify goodsClassify);

    Map<String,Object> getViewHistory(Store store, GoodsClassify goodsClassify);

    Map<String,Object> getUserStar(String user_id);

    Map<String,Object> delUserStar(String user_id,String goodsStar_id);

    Map<String,Object> getUserNewWithTime(String goodsStar_id,Map<String,ArrayList<String>> uerOnTimeVOS) throws Exception;
}
