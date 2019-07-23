package com.demo.mms.dto;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.InCartOf;

public class ShoppingCartDTO {
    private String relationId;
    private String pictureUrl;
    private String name;
    private Integer quantity;
    private Double unitPrice;
    private Double totalPrice;

    public ShoppingCartDTO(InCartOf relation, Goods goods) {
        this.relationId = relation.getId();
        this.pictureUrl = goods.getPic_url();
        this.name = goods.getGoods_name();
        this.quantity = relation.getNumber();
        Integer price = goods.getPrice();
        if (price == null) {
            this.unitPrice = 0.0;
        } else {
            this.unitPrice = price / 100.0;
        }
        this.totalPrice = this.unitPrice * this.quantity;
    }

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
