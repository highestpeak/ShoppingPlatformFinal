package com.demo.mms.dao;


import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

public interface GoodsOperateMapper {
    @Select("select * " +
            "from goods inner join goods_classify on goods.classify_id = goods_classify.classify_id " +
            "where ${column} = #{value}")
    ResultMap queryGoodsWithClassify(@Param("column") String column,@Param("value") String value);

}
