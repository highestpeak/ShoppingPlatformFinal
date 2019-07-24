package com.demo.mms.service;

import com.demo.mms.common.domain.*;

import java.util.List;
import java.util.Collection;
import java.util.Map;


public interface OrderService {
    Collection<Order> createOrderFromShoppingCart(List<String> shoppingCartRelationIds, String consignee, String phone, String address, String postcode) throws Exception;
    Collection<Order> getAll() throws Exception;
    Order[] getMostRecentTenOrder(String storeId) throws Exception;
    Map<String, Integer> getOrderStatTotal(String storeId) throws Exception;
    void proceed(String orderId) throws Exception;
    void updateExpressInfo(String orderId, String express_code, String express_company_id) throws Exception;
    void deleteOrder(String orderId) throws Exception;
    Collection<Order> select(String user_id, String store_id) throws Exception;
}
