package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.Buyer;

import java.util.Collection;
import java.util.Map;


public interface ShoppingCartService {
    Object getInCartOfRelationshipById(String id) throws Exception;
    Collection<Object> getAllInCartOfRelationships() throws Exception;
    Collection<Object> getShoppingCartGoodsOfUser(Buyer user) throws Exception;
    Collection<Object> getShoppingCartGoodsOfUserByUserId(String user) throws Exception;

    void insertGoodsToShoppingCartOfUser(String goodsId, String userId, Integer num) throws Exception;

    void modifyGoodNumber(String relationId, Integer newNumber) throws Exception;
    void modifyGoodNumber(InCartOf inCartOf, Integer newNumber) throws Exception;
    void modifyGoodNumber(Buyer user, Goods goods, Integer newNumber) throws Exception;
    void modifyGoodNumber(String userId, String goodsId, Integer newNumber) throws Exception;

    void deleteGoodFromCart(String id) throws Exception;
    void deleteGoodFromCart(Buyer buyer, Goods goods) throws Exception;
    void deleteGoodFromCart(InCartOf inCartOf) throws Exception;
}
