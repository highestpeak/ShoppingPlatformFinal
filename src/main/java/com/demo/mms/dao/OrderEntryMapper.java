package com.demo.mms.dao;

import com.demo.mms.common.domain.OrderEntry;
import org.apache.ibatis.annotations.Select;

import java.util.Collection;

public interface OrderEntryMapper {
    @Select("SELECT * FROM order_entry;")
    Collection<OrderEntry> getAll() throws Exception;
    void save(OrderEntry entry) throws Exception;
}
