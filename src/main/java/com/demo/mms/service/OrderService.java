package com.demo.mms.service;

import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Store;

import java.util.Collection;

public interface OrderService {
    Collection<Object> getAll() throws Exception;
    Collection<Object> getAllOfBuyer(Buyer buyer) throws Exception;
    Collection<Object> getAllOfStore(Store store) throws Exception;
}
