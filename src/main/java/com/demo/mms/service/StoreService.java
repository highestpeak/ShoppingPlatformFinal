package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.OnSale;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.User;
import com.demo.mms.common.vo.OnSaleGoodsVO;

import java.util.ArrayList;
import java.util.Map;

public interface StoreService {

    Map<String,Object> getStoreInfo(Store store);

    Map<String ,Object> updateStoreInfo(Store oldStore, Store newStore);

    Map<String ,Object> setOnSale(OnSale onSale);

    Map<String ,Object> delOnSale(String on_sale_id);

    Map<String ,Object> getOnSaleGoods(String store_id, ArrayList<OnSaleGoodsVO> getOnSaleList);

    Map<String,Object> updateOnSaleGoods(String on_sale_id, String discount, String due_time, String note);

    Map<String,Object> getAllUser(ArrayList<User> users);

    Map<String ,Object> getTopTenNewGoods(String store_id,ArrayList<Goods> topTenNewGoods);

    Map<String ,Object> getStoreThingOfDay(Store store,String dateToGet);
}
