package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.User;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Override
    public Object getInCartOfRelationshipById(Integer id) {
        return null;
    }

    @Override
    public Collection<Object> getAllInCartOfRelationships() {
        return null;
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUser(User user) {
        return null;
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUserByUserId(Integer user) {
        return null;
    }

    @Override
    public void insertGoodsToShoppingCartOfUser(Goods goods, User user) {

    }

    @Override
    public void insertGoodsToShoppingCartOfUser(Iterable<Goods> goods, User user) {

    }

    @Override
    public void modifyGoodNumber(Integer id, Integer newNumber) {

    }

    @Override
    public void modifyGoodNumber(InCartOf inCartOf, Integer newNumber) {

    }

    @Override
    public void deleteGoodFromCart(Integer id) {

    }

    @Override
    public void deleteGoodFromCart(InCartOf inCartOf) {

    }
}
