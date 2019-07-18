package com.demo.mms.controller;


import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Goods;
import com.demo.mms.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;


@RequestMapping("/shoppingCart")
@Controller
public class ShoppingCartController {
    private static void insertErrorMessageAndFailFlag(Map<String, Object> map, String errorMessage) {
        insertFailFlag(map);
        map.put("error_message", errorMessage);
    }

    private static void insertErrorMessageAndFailFlag(Map<String, Object> map, Exception exception) {
        insertFailFlag(map);
        map.put("error_message", exception.getMessage());
    }

    private static void insertQueryResultAndSuccessFlag(Map<String, Object> map, Object result) {
        insertSuccessFlag(map);
        map.put("result", result);
    }

    private static void insertFailFlag(Map<String, Object> map) {
        map.replace("success", false);
    }
    private static void insertSuccessFlag(Map<String, Object> map) {
        map.replace("success", true);
    }

    private final ShoppingCartService shoppingCartService;

    public ShoppingCartController(ShoppingCartService shoppingCartService) {
        this.shoppingCartService = shoppingCartService;
    }

    // for test
    @RequestMapping("/hello")
    @ResponseBody
    public Object sayHello(Object o) {
        if (o == null) {
            return "hello";
        }
        return o;
    }


    @RequestMapping("/")
    @ResponseBody
    public Object getUserShoppingCart(Buyer buyer) {
        Map<String, Object> result = new HashMap<>();
        Collection<Object> relations;
        try {
            relations = shoppingCartService.getShoppingCartGoodsOfUser(buyer);
        } catch (Exception e) {
            insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        insertQueryResultAndSuccessFlag(result, relations);
        return result;
    }


    @RequestMapping("/addGoods")
    @ResponseBody
    public Object getGoods(Buyer buyer, Goods goods, Integer num) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.insertGoodsToShoppingCartOfUser(goods, buyer, num);
        } catch (Exception e) {
            insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        result.put("success", true);
        return result;
    }


    @RequestMapping("/updateGoodsNum")
    @ResponseBody
    public Object updateGoodsNum(Buyer buyer, Goods goods, Integer newNum) {
        Map<String, Object> result = new HashMap<>();
        if (newNum <= 0) {
            insertErrorMessageAndFailFlag(result, "assertion failed: newNum > 0");
        }
        try {
            shoppingCartService.modifyGoodNumber(buyer, goods, newNum);
        } catch (Exception e) {
            insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        result.put("success", true);
        return result;
    }


    @RequestMapping("/deleteGoods")
    @ResponseBody
    public Object deleteGoods(Buyer buyer, Goods goods) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.deleteGoodFromCart(buyer, goods);
        } catch (Exception e) {
            insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        result.put("success", true);
        return result;
    }
}
