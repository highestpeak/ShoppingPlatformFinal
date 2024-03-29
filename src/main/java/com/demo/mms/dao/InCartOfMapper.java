package com.demo.mms.dao;

import com.demo.mms.common.domain.InCartOf;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InCartOfMapper {
    InCartOf selectById(@Param("id") String id) throws Exception;

    List<InCartOf> selectAll() throws Exception;

    List<InCartOf> selectAllOfUser(@Param("buyer_id") String userId) throws Exception;

    void deleteEntryById(String id) throws Exception;

    void insertEntry(@Param("id") String id, @Param("buyerId") String buyerId, @Param("goodId") String goodsId, @Param("num") Integer num) throws Exception;

    void updateEntryByRelationId(@Param("id") String id, @Param("newNum") Integer newNum) throws Exception;

    void updateEntryByUserAndGoodsId(@Param("userId") String userId, @Param("goodsId") String goodsId, @Param("newNum") Integer newNum) throws Exception;

    void deleteEntryByUserAndGoodsId(@Param("userId") String userId, @Param("goodsId") String goodsId) throws Exception;
}
