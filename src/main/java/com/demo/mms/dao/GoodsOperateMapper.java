package com.demo.mms.dao;


import com.demo.mms.common.domain.User;
import com.demo.mms.common.vo.GoodsWithClassifyVO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

public interface GoodsOperateMapper {
//    @Select("select goods_id,Goods.classify_id as classify_id,Goods.classify_name as classify_name,top_level_classify_id,status,old_level " +
//            "from Goods inner join goods_classify on Goods.classify_id = goods_classify.classify_id " +
//            "where ${column} = #{value}")
//    ResultMap queryGoodsWithClassify(@Param("column") String column,@Param("value") String value);
    ArrayList<GoodsWithClassifyVO> queryGoodsWithClassify(String store_id);

//    @Select("select * from ${table} where ${column} = #{value}")
//    HashMap queryTable(@Param("table") String user_table,
//                   @Param("column") String column,
//                   @Param("value") String value);
}
