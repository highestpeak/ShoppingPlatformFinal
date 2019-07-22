package com.demo.mms.controller;


import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Goods;
import com.demo.mms.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.demo.mms.common.utils.ControllerUtility;


@RequestMapping("/shoppingCart")
@Controller
public class ShoppingCartController {

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


    @GetMapping("/")
    @ResponseBody
    public Object getUserShoppingCart(String userId) {
        Map<String, Object> result = new HashMap<>();
        Collection<Object> relations;
        try {
            relations = shoppingCartService.getShoppingCartGoodsOfUserByUserId(userId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, relations);
        return result;
    }


    @PostMapping("/")
    @ResponseBody
    public Object insertGoods(String goodsId, String buyerId, Integer num) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.insertGoodsToShoppingCartOfUser(goodsId, buyerId, num);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }


    @PutMapping("/")
    @ResponseBody
    public Object updateGoodsNum(String relationId, Integer newNum) {
        Map<String, Object> result = new HashMap<>();
        if (newNum <= 0) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, "assertion failed: newNum > 0");
        }
        try {
            shoppingCartService.modifyGoodNumber(relationId, newNum);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }


    @DeleteMapping("/")
    @ResponseBody
    public Object deleteGoods(String relationId) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.deleteGoodFromCart(relationId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }
}
