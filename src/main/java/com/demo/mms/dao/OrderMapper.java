package com.demo.mms.dao;

import com.demo.mms.common.domain.Order;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.Collection;

public interface OrderMapper {
    Collection<Order> selectAll() throws Exception;
    Collection<Order> selectAllByStoreId(String storeId) throws Exception;
    Order selectById(String id) throws Exception;

    @Update("UPDATE `order` SET step = #{step} WHERE id = #{id};")
    void updateStepTo(@Param("id") String id, @Param("step") Integer newStep) throws Exception;

    @Update("UPDATE `order` SET express_id = #{eid} WHERE id = #{id};")
    void updateExpressId(@Param("id") String id, @Param("eid") String expressId) throws Exception;

    void save(Order order) throws Exception;
}
