package com.demo.mms.common.domain;

import java.util.Date;
import java.util.List;

public class Order {
    private String id;
    private Buyer buyer;
    private List<OrderEntry> orderEntryList;
    private Integer status;
    private Date payTime;
    private Date createTime;
    private Date updateTime;
}
