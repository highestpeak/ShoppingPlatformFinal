package com.demo.mms.dao;

import com.demo.mms.common.domain.*;
import com.demo.mms.common.vo.GoodsViewedQueryTestVO;
import com.demo.mms.common.vo.GoodsViewedQueryVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.ArrayList;

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

    @Delete("DELETE FROM user WHERE ${columnKey} = #{valueKey}")
    void delUser(@Param("columnKey") String columnKey,
                 @Param("valueKey") String valueKey);

    ArrayList<GoodsViewedQueryVO> queryGoodsViewedByGoods(String buyer_id);

    ArrayList<GoodsViewedQueryVO> queryGoodsViewedByClassify(String buyer_id,String classify_name);

    ArrayList<GoodsViewedQueryTestVO> queryGoodsViewedByStore(String store_id, String classify_name);
}