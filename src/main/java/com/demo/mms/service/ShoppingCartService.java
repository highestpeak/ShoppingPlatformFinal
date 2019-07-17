package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.User;

import java.util.Collection;


public interface ShoppingCartService {
    Object getInCartOfRelationshipById(Integer id);
    Collection<Object> getAllInCartOfRelationships();
    Collection<Object> getShoppingCartGoodsOfUser(User user);
    Collection<Object> getShoppingCartGoodsOfUserByUserId(Integer user);

    void insertGoodsToShoppingCartOfUser(Goods goods, User user);
    void insertGoodsToShoppingCartOfUser(Iterable<Goods> goods, User user);

    void modifyGoodNumber(Integer id, Integer newNumber);
    void modifyGoodNumber(InCartOf inCartOf, Integer newNumber);

    void deleteGoodFromCart(Integer id);
    void deleteGoodFromCart(InCartOf inCartOf);
}
