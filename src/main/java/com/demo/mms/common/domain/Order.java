package com.demo.mms.common.domain;

import java.util.Collection;
import java.util.Date;

public class Order {
    private String id;
    private Buyer buyer;
    private Collection<OrderEntry> entries;
    private Date createTime;
    private Date updateTime;
}
