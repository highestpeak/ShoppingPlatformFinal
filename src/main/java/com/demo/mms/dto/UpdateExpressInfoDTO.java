package com.demo.mms.dto;

public class UpdateExpressInfoDTO {
    private String express_code;
    private String express_company_id;

    public UpdateExpressInfoDTO(String express_code, String express_company_id) {
        this.express_code = express_code;
        this.express_company_id = express_company_id;
    }

    public String getExpress_code() {
        return express_code;
    }

    public void setExpress_code(String express_code) {
        this.express_code = express_code;
    }

    public String getExpress_company_id() {
        return express_company_id;
    }

    public void setExpress_company_id(String express_company_id) {
        this.express_company_id = express_company_id;
    }
}
