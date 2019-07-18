package com.demo.mms.dao;

import java.util.List;

public interface InCartOfMapper {
    List<Object> selectAll() throws Exception;
    List<Object> selectAllOfUser(String userId) throws Exception;
    void deleteEntryById(String id) throws Exception;
    void insertEntry(String id, String buyerId, String goodsId, Integer num) throws Exception;
    void updateEntryByRelationId(String id, Integer newNum) throws Exception;
    void updateEntryByUserAndGoodsId(String userId, String goodsId, Integer newNum) throws Exception;
    void deleteEntryByUserAndGoodsId(String userId, String goodsId) throws Exception;
}
