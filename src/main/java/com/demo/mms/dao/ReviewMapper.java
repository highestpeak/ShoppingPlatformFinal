package com.demo.mms.dao;

import com.demo.mms.common.domain.Review;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Collection;

public interface ReviewMapper {
    @Select("SELECT * FROM review;")
    Collection<Review> getAll() throws Exception;

    @Insert("INSERT INTO review (id, rating, content) VALUES (#{rid}, #{rt}, #{c});")
    void insert(@Param("rid") String reviewId, @Param("rt") Integer rating, @Param("c") String content) throws Exception;
}
