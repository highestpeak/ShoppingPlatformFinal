package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.User;
import com.demo.mms.dao.InCartOfMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    private final InCartOfMapper mapper;

    public ShoppingCartServiceImpl(InCartOfMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public Object getInCartOfRelationshipById(String id) {
        List<Object> result = mapper.selectAll();
        return result.stream().filter(o -> {
            InCartOf relation = (InCartOf) o;
            return relation.getId().equals(id);
        }).collect(Collectors.toList()).get(0);
    }

    @Override
    public Collection<Object> getAllInCartOfRelationships() {
        return mapper.selectAll();
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUser(User user) {
        return mapper.selectAllOfUser(user.getUser_id());
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUserByUserId(String user) {
        return mapper.selectAllOfUser(user);
    }

    @Override
    public void insertGoodsToShoppingCartOfUser(Goods goods, User user, Integer num) {
        mapper.insertEntry(UUID.randomUUID().toString().replace("-", ""), user.getUser_id(), goods.getGoods_id(), num);
    }

    @Override
    public void modifyGoodNumber(String relationId, Integer newNumber) {
        mapper.updateEntryByRelationId(relationId, newNumber);
    }

    @Override
    public void modifyGoodNumber(InCartOf inCartOf, Integer newNumber) {
        mapper.updateEntryByRelationId(inCartOf.getId(), newNumber);
    }

    @Override
    public void modifyGoodNumber(User user, Goods goods, Integer newNumber) {
        modifyGoodNumber(user.getUser_id(), goods.getGoods_id(), newNumber);
    }

    @Override
    public void modifyGoodNumber(String userId, String goodsId, Integer newNumber) {
        mapper.updateEntryByUserAndGoodsId(userId, goodsId, newNumber);
    }

    @Override
    public void deleteGoodFromCart(String id) {
        mapper.deleteEntryById(id);
    }

    @Override
    public void deleteGoodFromCart(InCartOf inCartOf) {
        deleteGoodFromCart(inCartOf.getId());
    }
}
