package com.demo.mms.dao;

import com.demo.mms.common.domain.Review;
import org.apache.ibatis.annotations.Select;

import java.util.Collection;

public interface ReviewMapper {
    @Select("SELECT * FROM review;")
    Collection<Review> getAll() throws Exception;
}
