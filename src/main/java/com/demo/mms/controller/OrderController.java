package com.demo.mms.controller;


import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.Seller;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.utils.ControllerUtility;
import com.demo.mms.service.OrderService;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Method;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/order")
public class OrderController {

    final private OrderService orderService;

    public OrderController(OrderService service) {
        orderService = service;
    }

    private static Map<String, Object> getAllOf(OrderService orderService, String ofWhat, Object object) {
        Map<String, Object> result = new HashMap<>();
        Collection<Object> orders;
        try {
            if (ofWhat.isEmpty()) {
                orders = orderService.getAll();
            } else {
                Method method = OrderService.class.getMethod("getAllOf" + ofWhat);
                orders = (Collection<Object>) method.invoke(orderService, object);
            }
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, orders);
        return result;
    }

    @GetMapping("/")
    @ResponseBody
    public Map<String, Object> getAll() {
        return getAllOf(orderService, "", null);
    }

    @GetMapping("/buyer")
    @ResponseBody
    public Map<String, Object> getAllOfBuyer(Buyer buyer) {
        return getAllOf(orderService, "Buyer", buyer);
    }

    @GetMapping("/store")
    @ResponseBody
    public Map<String, Object> getAllOfSeller(Store store) {
        return getAllOf(orderService, "Store", store);
    }

    @PostMapping("/")
    @ResponseBody
    public Map<String, Object> insertOrder(Buyer buyer, Goods goods, Integer num) {
        return null;
    }
}
