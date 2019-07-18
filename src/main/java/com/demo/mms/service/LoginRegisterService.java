package com.demo.mms.service;

import com.demo.mms.common.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public interface LoginRegisterService {
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
}
