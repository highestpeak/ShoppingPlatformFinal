package com.demo.mms.service;

import com.demo.mms.common.domain.Store;

import java.util.Map;

public interface StoreService {

    Map<String,Object> getStoreInfo(Store store);

    Map<String ,Object> updateStoreInfo(Store oldStore, Store newStore);
}
