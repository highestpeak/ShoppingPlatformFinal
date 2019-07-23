package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.dto.ShoppingCartDTO;
import org.springframework.stereotype.Service;

import java.util.Collection;


public interface ShoppingCartService {
    Object getInCartOfRelationshipById(String id) throws Exception;
    Collection<InCartOf> getAllInCartOfRelationships() throws Exception;
    Collection<InCartOf> getShoppingCartGoodsOfUser(Buyer user) throws Exception;
    Collection<ShoppingCartDTO> getShoppingCartGoodsOfUserByUserId(String user) throws Exception;

    void insertGoodsToShoppingCartOfUser(String goodsId, String userId, Integer num) throws Exception;

    void modifyGoodNumber(String relationId, Integer newNumber) throws Exception;
    void modifyGoodNumber(InCartOf inCartOf, Integer newNumber) throws Exception;
    void modifyGoodNumber(Buyer user, Goods goods, Integer newNumber) throws Exception;
    void modifyGoodNumber(String userId, String goodsId, Integer newNumber) throws Exception;

    void deleteGoodFromCart(String id) throws Exception;
    void deleteGoodFromCart(Buyer buyer, Goods goods) throws Exception;
    void deleteGoodFromCart(InCartOf inCartOf) throws Exception;
}
