package com.demo.mms.service;

import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.ExpressCompany;
import com.demo.mms.common.domain.Store;

import java.util.Collection;
import java.util.Map;

public interface OrderService {
    Collection<Object> getAll() throws Exception;
    Collection<Object> getAllOfBuyer(Buyer buyer) throws Exception;
    Collection<Object> getAllOfStore(Store store) throws Exception;
    String createOrder(String buyerId, Map<String, Integer> goodsIdAndCorrespondingNumbers) throws Exception;
    String setExpress(String orderEntryId, String expressCompanyId);
}
