package com.demo.mms.dao;

import com.demo.mms.common.domain.Admin;
import com.demo.mms.common.domain.Buyer;
import com.demo.mms.common.domain.Seller;
import com.demo.mms.common.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

//所有传到mapper的数据全部都是正确的
public interface UserOperateMapper {
    @Select("select * from ${table} where ${column} = #{value}")
    User queryUser(@Param("table") String table,
                   @Param("column") String column,
                   @Param("value") String value);

    @Update("update user set ${columnNew} = #{valueNew} where ${columnKey} = #{valueKey}")
    int updateUser(@Param("columnKey") String columnKey,
                   @Param("valueKey") String valueKey,
                   @Param("columnNew") String columnNew,
                   @Param("valueNew") String valueNew);

    int insertUser(User user);
    int insertBuyer(Buyer buyerToIn);
    int insertSeller(Seller seller);
    int insertAdmin(Admin admin);


}