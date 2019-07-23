package com.demo.mms.dto;

import java.util.List;

public class CreateOrderFromCartDTO {
    private List<String> relation_id_list;
    private String consignee;
    private String phone;
    private String address;
    private String post_code;

    public CreateOrderFromCartDTO(List<String> relation_id_list, String consignee, String phone, String address, String post_code) {
        this.relation_id_list = relation_id_list;
        this.consignee = consignee;
        this.phone = phone;
        this.address = address;
        this.post_code = post_code;
    }

    public List<String> getRelation_id_list() {
        return relation_id_list;
    }

    public void setRelation_id_list(List<String> relation_id_list) {
        this.relation_id_list = relation_id_list;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
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

    public String getPost_code() {
        return post_code;
    }

    public void setPost_code(String post_code) {
        this.post_code = post_code;
    }
}
