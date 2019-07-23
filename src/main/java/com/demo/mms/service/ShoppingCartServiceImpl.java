package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.dao.GoodsOperateMapper;
import com.demo.mms.dao.InCartOfMapper;
import com.demo.mms.dto.ShoppingCartDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    private final UserService userService;
    private final GoodsOperateMapper goodsOperateMapper;
    private final InCartOfMapper mapper;

    public ShoppingCartServiceImpl(UserService userService, GoodsOperateMapper goodsOperateMapper, InCartOfMapper mapper) {
        this.userService = userService;
        this.goodsOperateMapper = goodsOperateMapper;
        this.mapper = mapper;
    }

    @Override
    public Object getInCartOfRelationshipById(String id) throws Exception {
        InCartOf relation = (InCartOf) mapper.selectById(id);
        Goods goods = goodsOperateMapper.getGoodById(relation.getGoodsId());
        return new ShoppingCartDTO(relation, goods);
    }

    @Override
    public Collection<InCartOf> getAllInCartOfRelationships() throws Exception {
        return mapper.selectAll();
    }

    @Override
    public Collection<InCartOf> getShoppingCartGoodsOfUser(Buyer user) throws Exception {
        return mapper.selectAllOfUser(user.getUser_id());
    }

    @Override
    public Collection<ShoppingCartDTO> getShoppingCartGoodsOfUserByUserId(String user) throws Exception {
        Collection<InCartOf> results = mapper.selectAllOfUser(user);
        Collection<ShoppingCartDTO> ret = new ArrayList<>();
        for (InCartOf relation : results) {
            Goods goods = goodsOperateMapper.getGoodById(relation.getGoodsId());
            ret.add(new ShoppingCartDTO(relation, goods));
        }
        return ret;
    }

    @Override
    public void insertGoodsToShoppingCartOfUser(String goodsId, String userId, Integer num) throws Exception {
        mapper.insertEntry(UUID.randomUUID().toString().replace("-", ""), userId, goodsId, num);
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
