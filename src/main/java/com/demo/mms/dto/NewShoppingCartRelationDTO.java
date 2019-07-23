package com.demo.mms.dto;

public class NewShoppingCartRelationDTO {
    private String user_id;
    private String goods_id;
    private Integer quantity;

    public NewShoppingCartRelationDTO(String user_id, String goods_id, Integer quantity) {
        this.user_id = user_id;
        this.goods_id = goods_id;
        this.quantity = quantity;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
