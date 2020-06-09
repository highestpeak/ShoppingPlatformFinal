package com.demo.mms.controller;

import com.demo.mms.common.domain.*;
import com.demo.mms.common.utils.ControllerUtility;
import com.demo.mms.dao.GoodsOperateMapper;
import com.demo.mms.dao.OrderEntryMapper;
import com.demo.mms.dto.CreateOrderFromCartDTO;
import com.demo.mms.dto.OrderEntryInfoDTO;
import com.demo.mms.dto.OrderInfoDTO;
import com.demo.mms.dto.UpdateExpressInfoDTO;
import com.demo.mms.service.OrderService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@RequestMapping("/orders")
@RestController
public class OrderController {

    final private OrderService orderService;
    final private OrderEntryMapper orderEntryMapper;
    final private GoodsOperateMapper goodsOperateMapper;

    /*
     TODO:
        前台请求接口：
        获取一个商店 订单类型比例的chart图 返回 订单状态+相应订单数量
        获取一个商店 订单变化的chart图 几种订单状态就有几个调用的接口
        未付款订单的调用 返回 日期+数量
        已付款未发货订单的调用 返回 日期+数量
        正在快递的订单的调用 返回 日期+数量
        已完成订单的调用 返回 日期+数量
        获取各种订单数量相对于前一天的变化：  返回  订单类型 变化--上升or下降  百分比  今日订单总量  今日订单总额
        获取所有订单信息：  返回： 所有订单数目 未付款数目  正在快递数目  已完成数目
        x 获取最新十条用户评价  返回：用户名 用户头像url 用户评价内容 用户评价星级 评价时间
        后端请求接口：
        每日新下单的数量
        每日完成订单的数量
        每日创建好评数目
        每日创建差评数目
     */

    public OrderController(OrderService service, OrderEntryMapper orderEntryMapper, GoodsOperateMapper goodsOperateMapper) {
        orderService = service;
        this.orderEntryMapper = orderEntryMapper;
        this.goodsOperateMapper = goodsOperateMapper;
    }

    @PostMapping("/") @ResponseBody
    public Map<String, Object> CreateOrderFromCart(@RequestBody CreateOrderFromCartDTO args) {
        Map<String, Object> ret = new HashMap<>();
        Collection<Order> result;
        try {
            result = orderService.createOrderFromShoppingCart(
                    args.getRelation_id_list(),
                    args.getConsignee(),
                    args.getPhone(),
                    args.getAddress(),
                    args.getPost_code()
            );
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(ret, e);
            return ret;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(ret, result);
        return ret;
    }

    @GetMapping("/stat/recent/{storeId}") @ResponseBody
    public Map<String, Object> getRecentTenOrder(@PathVariable String storeId) {
        Map<String, Object> ret = new HashMap<>();
        Order[] result;
        try {
            result = orderService.getMostRecentTenOrder(storeId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(ret, e);
            return ret;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(ret, result);
        return ret;
    }

    @GetMapping("/stat/total/{storeId}") @ResponseBody
    public Map<String, Object> getOrderStatTotal(@PathVariable String storeId) {
        Map<String, Object> ret = new HashMap<>();
        Map<String, Integer> result;
        try {
            result = orderService.getOrderStatTotal(storeId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(ret, e);
            return ret;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(ret, result);
        return ret;
    }


    @GetMapping("/") @ResponseBody
    public Map<String, Object> getAll(String user_id, String store_id) {
        Map<String, Object> result = new HashMap<>();
        Collection<Order> orders;
        try {
            orders = orderService.select(user_id, store_id);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        Collection<OrderInfoDTO> ret = new ArrayList<>();
        Collection<OrderEntry> orderEntries;
        try {
            orderEntries = orderEntryMapper.getAll();
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        for (Order order : orders) {
            List<OrderEntry> entries = orderEntries.parallelStream().filter(entry -> entry.getOrderId().equals(order.getId())).collect(Collectors.toList());
            List<OrderEntryInfoDTO> entryDTOs = new ArrayList<>();
            double total_price = 0;
            for (OrderEntry entry : entries) {
                Goods goods = goodsOperateMapper.getGoodById(entry.getGoodsId());
                total_price += entry.getUnitPrice() * entry.getQuantity() / 100.0;
                entryDTOs.add(new OrderEntryInfoDTO(goods.getPic_url(), goods.getGoods_name(), entry.getUnitPrice() / 100.0, entry.getQuantity()));
            }
            ret.add(new OrderInfoDTO(order.getId(), total_price, order.getPhone(), order.getAddress(), order.getStep(), entryDTOs));
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, ret);
        return result;
    }

    @PostMapping("/{orderId}/proceed") @ResponseBody
    public Map<String, Object> proceed(@PathVariable String orderId) {
        Map<String, Object> result = new HashMap<>();
        try {
            orderService.proceed(orderId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }

    @PutMapping("/{orderId}/express/") @ResponseBody
    public Map<String, Object> updateExpressCode(@PathVariable String orderId, @RequestBody UpdateExpressInfoDTO args) {
        Map<String, Object> result = new HashMap<>();
        try {
            orderService.updateExpressInfo(orderId, args.getExpress_code(), args.getExpress_company_id());
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }

    @DeleteMapping("/{orderId}") @ResponseBody
    public Map<String, Object> deleteOrder(@PathVariable String orderId) {
        Map<String, Object> result = new HashMap<>();
        try {
            orderService.deleteOrder(orderId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }
}
