package com.demo.mms.service;

import com.demo.mms.common.domain.Review;
import org.springframework.stereotype.Service;

import java.util.Collection;

public interface ReviewService {
    Collection<Review> select(String userId, String orderId, String goodsId) throws Exception;

    void insert(String orderEntryId, Integer rating, String content) throws Exception;

    Collection<Review> getRecentTenReviewOfGoods(String goodsId) throws Exception;
}
