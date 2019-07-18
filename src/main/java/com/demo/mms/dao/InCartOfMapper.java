package com.demo.mms.dao;

import java.util.List;

public interface InCartOfMapper {
    List<Object> selectAll();
    List<Object> selectAllOfUser(String userId);
    void deleteEntryById(String id);
    void insertEntry(String id, String buyerId, String goodsId, Integer num);
    void updateEntryByRelationId(String id, Integer newNum);
    void updateEntryByUserAndGoodsId(String userId, String goodsId, Integer newNum);
}
