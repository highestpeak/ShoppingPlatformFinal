package com.demo.mms.dto;

public class UpdateGoodsQuantityDTO {
    private Integer new_quantity;

    public Integer getQuantity() {
        return new_quantity;
    }

    public void setQuantity(Integer new_quantity) {
        this.new_quantity = new_quantity;
    }

    public UpdateGoodsQuantityDTO(Integer new_quantity) {
        this.new_quantity = new_quantity;
    }
}
