package com.demo.mms.dao;

import com.demo.mms.common.domain.Express;
import com.demo.mms.common.domain.ExpressCompany;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ExpressMapper {
    @Select("SELECT * FROM `order` WHERE id = #{expressId}")
    Express selectById(String expressId) throws Exception;

    List<ExpressCompany> selectAllCompanies() throws Exception;
    ExpressCompany selectCompanyById(String expressCompanyId) throws Exception;

    @Insert("INSERT INTO `order` (id, express_company_id, express_code) VALUES (#{id}, #{ecid}, #{ecomp});")
    void insertExpress(@Param("id") String id, @Param("ecid") String expressCompanyId, @Param("ecomp") String expressCode) throws Exception;

    @Delete("DELETE FROM `order` WHERE id = #{id}")
    void deleteExpress(String id) throws Exception;
}
