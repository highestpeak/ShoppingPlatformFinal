package com.demo.mms.common.domain;

import java.util.Date;

public class OrderEntry {
    private String id;
    private Goods goods;
    private Integer num;
    private Integer price;
    private Date payTime;
    private Express express;
    private Boolean recieved;

    private Integer score;
    private String description;

    public boolean isPositive() {
        return score > 6;
    }
}
