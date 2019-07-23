package com.demo.mms.service;


import com.demo.mms.common.domain.OrderEntry;
import com.demo.mms.common.domain.Review;
import com.demo.mms.dao.OrderEntryMapper;
import com.demo.mms.dao.ReviewMapper;
import com.demo.mms.dao.UserOperateMapper;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.function.Predicate;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;
    private final UserOperateMapper userOperateMapper;
    private final OrderEntryMapper orderEntryMapper;

    public ReviewServiceImpl(ReviewMapper reviewMapper, UserOperateMapper userOperateMapper, OrderEntryMapper orderEntryMapper) {
        this.reviewMapper = reviewMapper;
        this.userOperateMapper = userOperateMapper;
        this.orderEntryMapper = orderEntryMapper;
    }

    @Override
    public Collection<Review> select(String userId, String orderId, String goodsId) throws Exception {
        Collection<OrderEntry> orderEntries = orderEntryMapper.getAll();
        return reviewMapper.getAll().stream().filter(
                new Predicate<Review>() {
                    @Override
                    public boolean test(Review review) {
                        if (userId == null) return true;
                        orderEntries
                    }
                }
        )
    }
}
