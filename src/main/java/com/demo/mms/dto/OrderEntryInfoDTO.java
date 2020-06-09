package com.demo.mms.dto;

public class OrderEntryInfoDTO {
    private String pic_url;
    private String goods_name;
    private Double unit_price;
    private Integer quantity;

    public OrderEntryInfoDTO(String pic_url, String goods_name, Double unit_price, Integer quantity) {
        this.unit_price = unit_price;
        this.quantity = quantity;
        this.pic_url = pic_url;
        this.goods_name = goods_name;
    }

    public String getPic_url() {
        return pic_url;
    }

    public void setPic_url(String pic_url) {
        this.pic_url = pic_url;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
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
