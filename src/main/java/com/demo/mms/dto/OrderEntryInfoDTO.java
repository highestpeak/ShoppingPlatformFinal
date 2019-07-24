package com.demo.mms.dto;

public class OrderEntryInfoDTO {
    private Double unit_price;
    private Integer quantity;

    public OrderEntryInfoDTO(Double unit_price, Integer quantity) {
        this.unit_price = unit_price;
        this.quantity = quantity;
    }

    public Double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(Double unit_price) {
        this.unit_price = unit_price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
