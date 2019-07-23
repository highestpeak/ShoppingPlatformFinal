package com.demo.mms.controller;

import com.demo.mms.dto.NewShoppingCartRelationDTO;
import com.demo.mms.dto.ShoppingCartDTO;
import com.demo.mms.dto.UpdateGoodsQuantityDTO;
import com.demo.mms.service.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.demo.mms.common.utils.ControllerUtility;



@RestController
@RequestMapping("/shoppingCart")
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
    public Object getUserShoppingCart(String user_id) {
        Map<String, Object> result = new HashMap<>();
        if (user_id == null) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, "empty user_id received.");
        }
        Collection<ShoppingCartDTO> relations;
        try {
            relations = shoppingCartService.getShoppingCartGoodsOfUserByUserId(user_id);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, relations);
        return result;
    }


    @PostMapping("/")
    @ResponseBody
    public Object insertGoods(@RequestBody NewShoppingCartRelationDTO args) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.insertGoodsToShoppingCartOfUser(args.getGoods_id(), args.getUser_id(), args.getQuantity());
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }


    @PutMapping("/{relation_id}")
    @ResponseBody
    public Object updateGoodsNum(@PathVariable String relation_id, @RequestBody UpdateGoodsQuantityDTO args) {
        Map<String, Object> result = new HashMap<>();
        int new_quantity = args.getQuantity();
        if (new_quantity <= 0) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, "assertion failed: new_quantity > 0");
            return result;
        }
        try {
            shoppingCartService.modifyGoodNumber(relation_id, new_quantity);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }


    @DeleteMapping("/{relation_id}")
    @ResponseBody
    public Object deleteGoods(@PathVariable String relation_id) {
        Map<String, Object> result = new HashMap<>();
        try {
            shoppingCartService.deleteGoodFromCart(relation_id);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }
}
