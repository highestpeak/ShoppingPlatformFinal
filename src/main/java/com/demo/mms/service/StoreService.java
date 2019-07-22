package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;

import java.util.ArrayList;
import java.util.Map;

public interface StoreService {

    Map<String,Object> getStoreInfo(Store store);

    Map<String ,Object> updateStoreInfo(Store oldStore, Store newStore);

    Map<String ,Object> getStoreThingOfDay(Store store,String dateToGet);

    Map<String ,Object> setOnSale(String store_id,String oldGoodsId,Goods newOnSaleGoodInfo);

    Map<String ,Object> delOnSale(String store_id,String goodOnSaleId);

    Map<String ,Object> getOnSaleGoods(String store_id, ArrayList<Goods> getOnSaleList);

    Map<String,Object> updateOnSaleGoods(String store_id,String goodOnSaleId,Goods newGoodsOnSale);

    Map<String,Object> getAllUser(ArrayList<User> users);

}
