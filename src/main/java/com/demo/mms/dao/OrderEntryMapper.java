package com.demo.mms.dao;

import com.demo.mms.common.domain.OrderEntry;

public interface OrderEntryMapper {
    void save(OrderEntry entry) throws Exception;
}
