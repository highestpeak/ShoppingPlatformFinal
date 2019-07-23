package com.demo.mms.service;

import com.demo.mms.common.domain.*;

import java.util.List;
import java.util.Collection;
import java.util.Map;


public interface OrderService {
    Collection<Order> createOrderFromShoppingCart(List<String> shoppingCartRelationIds, String consignee, String phone, String address, String postcode) throws Exception;
    Collection<Order> getAll() throws Exception;
    Collection<Order> getAllOfBuyer(String buyerId) throws Exception;
    Collection<Order> getAllOfStore(String storeId) throws Exception;
    Order[] getMostRecentTenOrder(String storeId) throws Exception;
    String createOrder(String buyerId, Map<String, Integer> goodsIdAndCorrespondingNumbers, MailingInfo mailingInfo, String note) throws Exception;
    void makePaid(String orderEntryId) throws Exception;
    void setExpressCompany(String orderEntryId, String expressCompanyId) throws Exception;
    void makeSigned(String orderEntryId) throws Exception;

    Map<String, Integer> getOrderStatTotal(String storeId) throws Exception;

    void proceed(String orderId) throws Exception;

    void updateExpressInfo(String orderId, String express_code, String express_company_id) throws Exception;
}
