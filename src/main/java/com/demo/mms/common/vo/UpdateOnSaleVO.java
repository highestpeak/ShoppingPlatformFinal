package com.demo.mms.common.vo;

import com.demo.mms.common.domain.OnSale;

public class UpdateOnSaleVO {
    private String on_sale_id;
    private String due_time;
    private String note;
    private String discount;

    public String getOn_sale_id() {
        return on_sale_id;
    }

    public void setOn_sale_id(String on_sale_id) {
        this.on_sale_id = on_sale_id;
    }

    public String getDue_time() {
        return due_time;
    }

    public void setDue_time(String due_time) {
        this.due_time = due_time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }
}
