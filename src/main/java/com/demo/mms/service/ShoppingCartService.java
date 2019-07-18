package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.User;

import java.util.Collection;
import java.util.Map;


public interface ShoppingCartService {
    Object getInCartOfRelationshipById(String id);
    Collection<Object> getAllInCartOfRelationships();
    Collection<Object> getShoppingCartGoodsOfUser(User user);
    Collection<Object> getShoppingCartGoodsOfUserByUserId(String user);

    void insertGoodsToShoppingCartOfUser(Goods goods, User user, Integer num);

    void modifyGoodNumber(String relationId, Integer newNumber);
    void modifyGoodNumber(InCartOf inCartOf, Integer newNumber);
    void modifyGoodNumber(User user, Goods goods, Integer newNumber);
    void modifyGoodNumber(String userId, String goodsId, Integer newNumber);

    void deleteGoodFromCart(String id);
    void deleteGoodFromCart(InCartOf inCartOf);
}
