package com.demo.mms.service;

import com.demo.mms.common.domain.Review;
import org.springframework.stereotype.Service;

import java.util.Collection;

public interface ReviewService {
    Collection<Review> select(String userId, String orderId, String goodsId) throws Exception;
}
