package com.demo.mms.common.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

public class ProjectFactory {
    public static final String DATE_FORMAT_ALL = "yyyyMMdd-HHmmss";
    private static SimpleDateFormat ft = new SimpleDateFormat (DATE_FORMAT_ALL);
    public static String getPorjectStrDate(Date date){
        return ft.format(date);
    }

    public static final ArrayList<String> userTypeTable=new ArrayList<>(
            Arrays.asList("User","Buyer","Seller","Admin"));

    public static Cookie getCookieByName(HttpServletRequest request, String name){
        Map<String,Cookie> cookieMap = ReadCookieMap(request);
        if(cookieMap.containsKey(name)){
            Cookie cookie = (Cookie)cookieMap.get(name);
            return cookie;
        }else{
            return null;
        }
    }
    private  static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){
        Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
        Cookie[] cookies = request.getCookies();
        if(null!=cookies){
            for(Cookie cookie : cookies){
                cookieMap.put(cookie.getName(), cookie);
            }
        }
        return cookieMap;
    }

}
