package com.demo.mms.dto;

import java.util.List;

import java.util.Map;

public class OrderInfoDTO {
    private String order_id;
    private Double total_price;
    private String phone;
    private String address;
    private Integer step;
    private List<OrderEntryInfoDTO> goods_list;

    public OrderInfoDTO(String order_id, Double total_price, String phone, String address, Integer step, List<OrderEntryInfoDTO> goods_list) {
        this.order_id = order_id;
        this.total_price = total_price;
        this.phone = phone;
        this.address = address;
        this.step = step;
        this.goods_list = goods_list;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public Double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Double total_price) {
        this.total_price = total_price;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getStep() {
        return step;
    }

    public void setStep(Integer step) {
        this.step = step;
    }

    public List<OrderEntryInfoDTO> getGoods_list() {
        return goods_list;
    }

    public void setGoods_list(List<OrderEntryInfoDTO> goods_list) {
        this.goods_list = goods_list;
    }
}
