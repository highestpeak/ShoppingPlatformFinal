package com.demo.mms.dao;

import com.sun.istack.internal.NotNull;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InCartOfMapper {
    List<Object> selectAll() throws Exception;

    List<Object> selectAllOfUser(@Param("buyer_id") String userId) throws Exception;

    void deleteEntryById(String id) throws Exception;

    void insertEntry(@NotNull @Param("id") String id, @NotNull @Param("buyerId") String buyerId, @NotNull @Param("goodId") String goodsId, @NotNull @Param("num") Integer num) throws Exception;

    void updateEntryByRelationId(String id, Integer newNum) throws Exception;

    void updateEntryByUserAndGoodsId(String userId, String goodsId, Integer newNum) throws Exception;

    void deleteEntryByUserAndGoodsId(String userId, String goodsId) throws Exception;
}
