package com.demo.mms.dao;


import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.vo.StoreSelledClassifyVO;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

public interface GoodsOperateMapper {
    @Select("select * from store where ${column} = #{value}")
    Store queryStore(
                     @Param("column") String column,
                     @Param("value") String value);

    ArrayList<StoreSelledClassifyVO> queryGoodsWithClassify(String store_id);

    @Select("select * from store_sell_classify NATURAL JOIN goods_classify where ${column} = #{value} and store_id = #{store_id}")
    GoodsClassify queryClassifyOfStore(@Param("store_id") String store_id,
                                       @Param("column") String column,
                                       @Param("value") String value);

    @Select("select max(top_level_classify_id) " +
            "from store_sell_classify NATURAL JOIN goods_classify " +
            "where store_id = #{store_id}")
    String queryMaxLevel_ClassifyOfStore(@Param("store_id") String store_id);

    @Delete("DELETE from store_sell_classify where classify_id in " +
            "(select classify_id from store_sell_classify natural join goods_classify where ${column} = #{value})")
    void deleteClassifyOfStore(@Param("column") String column,
                               @Param("value") String value);

    @Insert("INSERT INTO goods_classify (classify_id, top_level_classify_id, classify_name, create_time, update_time) " +
            "VALUES (#{classify_id}, #{top_level_classify_id}, #{classify_name},#{create_time},#{update_time})")
    void insertNewClassify(@Param("classify_id") String classify_id,
                          @Param("top_level_classify_id") String top_level_classify_id,
                           @Param("classify_name") String classify_name,
                           @Param("create_time") String create_time,
                          @Param("update_time") String update_time);

    @Insert("INSERT INTO store_sell_classify (id, store_id, classify_id) VALUES (#{id}, #{store_id}, #{classify_id})")
    void insertNewClassifyOfStore(@Param("id") String id,
                                  @Param("store_id") String store_id,
                                  @Param("classify_id") String classify_id);

    @Update("update goods_modify SET ${columnModify} = #{valueModify} " +
            "where ${columnKey} = #{valueKey}")
    void updateGoodsClassify(@Param("columnModify") String columnModify,
                             @Param("valueModify") String valueModify,
                             @Param("columnKey") String columnKey,
                             @Param("valueKey") String valueKey);
}
