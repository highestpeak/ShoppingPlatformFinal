package com.demo.mms.dao;

import com.demo.mms.common.domain.OrderEntry;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Collection;

public interface OrderEntryMapper {
    @Select("SELECT * FROM order_entry;")
    Collection<OrderEntry> getAll() throws Exception;
    
    void save(OrderEntry entry) throws Exception;

    @Update("UPDATE order_entry SET review_id = #{rid} WHERE id = #{oeid};")
    void updateReviewId(@Param("oeid") String id, @Param("rid") String reviewId);
}
