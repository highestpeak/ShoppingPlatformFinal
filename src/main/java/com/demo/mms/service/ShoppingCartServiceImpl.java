package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.dao.InCartOfMapper;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    private final InCartOfMapper mapper;

    public ShoppingCartServiceImpl(InCartOfMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public Object getInCartOfRelationshipById(String id) throws Exception {
        List<Object> result = mapper.selectAll();
        return result.stream().filter(o -> {
            InCartOf relation = (InCartOf) o;
            return relation.getId().equals(id);
        }).collect(Collectors.toList()).get(0);
    }

    @Override
    public Collection<Object> getAllInCartOfRelationships() throws Exception {
        return mapper.selectAll();
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUser(Buyer user) throws Exception {
        return mapper.selectAllOfUser(user.getUser_id());
    }

    @Override
    public Collection<Object> getShoppingCartGoodsOfUserByUserId(String user) throws Exception {
        return mapper.selectAllOfUser(user);
    }

    @Override
    public void insertGoodsToShoppingCartOfUser(Goods goods, Buyer user, Integer num) throws Exception {
        mapper.insertEntry(UUID.randomUUID().toString().replace("-", ""), user.getUser_id(), goods.getGoods_id(), num);
    }

    @Override
    public void modifyGoodNumber(String relationId, Integer newNumber) throws Exception {
        mapper.updateEntryByRelationId(relationId, newNumber);
    }

    @Override
    public void modifyGoodNumber(InCartOf inCartOf, Integer newNumber) throws Exception {
        mapper.updateEntryByRelationId(inCartOf.getId(), newNumber);
    }

    @Override
    public void modifyGoodNumber(Buyer user, Goods goods, Integer newNumber) throws Exception {
        modifyGoodNumber(user.getUser_id(), goods.getGoods_id(), newNumber);
    }

    @Override
    public void modifyGoodNumber(String userId, String goodsId, Integer newNumber) throws Exception {
        mapper.updateEntryByUserAndGoodsId(userId, goodsId, newNumber);
    }

    @Override
    public void deleteGoodFromCart(String id) throws Exception {
        mapper.deleteEntryById(id);
    }

    @Override
    public void deleteGoodFromCart(Buyer buyer, Goods goods) throws Exception {
        mapper.deleteEntryByUserAndGoodsId(buyer.getUser_id(), goods.getGoods_id());
    }

    @Override
    public void deleteGoodFromCart(InCartOf inCartOf) throws Exception {
        deleteGoodFromCart(inCartOf.getId());
    }
}
