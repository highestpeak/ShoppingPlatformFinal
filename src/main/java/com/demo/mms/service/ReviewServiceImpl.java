package com.demo.mms.service;


import com.demo.mms.common.domain.Order;
import com.demo.mms.common.domain.OrderEntry;
import com.demo.mms.common.domain.Review;
import com.demo.mms.dao.*;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ReviewServiceImpl implements ReviewService {

    private final ReviewMapper reviewMapper;
    private final UserOperateMapper userOperateMapper;
    private final OrderEntryMapper orderEntryMapper;
    private final OrderMapper orderMapper;
    private final GoodsOperateMapper goodsOperateMapper;

    public ReviewServiceImpl(ReviewMapper reviewMapper, UserOperateMapper userOperateMapper, OrderEntryMapper orderEntryMapper, OrderMapper orderMapper, GoodsOperateMapper goodsOperateMapper) {
        this.reviewMapper = reviewMapper;
        this.userOperateMapper = userOperateMapper;
        this.orderEntryMapper = orderEntryMapper;
        this.orderMapper = orderMapper;
        this.goodsOperateMapper = goodsOperateMapper;
    }

    @Override
    public Collection<Review> select(String userId, String orderId, String goodsId) throws Exception {
        Collection<OrderEntry> orderEntries = orderEntryMapper.getAll();
        Map<String, Order> orders = new HashMap<>();
        for (Order order : orderMapper.selectAll()) {
            orders.put(order.getId(), order);
        }
        return reviewMapper.getAll().parallelStream()
                .filter(review -> userId == null || orderEntries.stream()
                        .filter(orderEntry -> orderEntry.getReviewId().equals(review.getId()))
                        .anyMatch(orderEntry -> userId.equals(orders.get(orderEntry.getOrderId()).getUserId()))
                ).filter(review -> orderId == null || orderEntries.parallelStream()
                        .filter(entry -> entry.getReviewId().equals(review.getId()))
                        .findFirst().get().getOrderId().equals(orderId)
                ).filter(review -> goodsId == null || orderEntries.parallelStream()
                        .filter(entry -> entry.getReviewId().equals(review.getId()))
                        .findFirst().get().getGoodsId().equals(goodsId)
                ).collect(Collectors.toList());
    }

    @Override
    public void insert(String orderEntryId, Integer rating, String content) throws Exception {
        String reviewId = UUID.randomUUID().toString().replace("-", "");
        orderEntryMapper.updateReviewId(orderEntryId, reviewId);
        reviewMapper.insert(reviewId, rating, content);
    }

    @Override
    public Collection<Review> getRecentTenReviewOfGoods(String goodsId) throws Exception {
        List<OrderEntry> orderEntries = orderEntryMapper.getAll().parallelStream().filter(entry -> goodsId.equals(entry.getGoodsId())).collect(Collectors.toList());
        Collection<Review> allReviews = reviewMapper.getAll();
        Map<String, Review> reviewMap = new HashMap<>();
        for (Review review : allReviews) {
            reviewMap.put(review.getId(), review);
        }
        List<Review> reviewsOfInterest = new ArrayList<>();
        for (OrderEntry entry : orderEntries) {
            if (entry.getReviewId() == null || entry.getReviewId().isEmpty()) {
                continue;
            }
            reviewsOfInterest.add(reviewMap.get(entry.getReviewId()));
        }
        reviewsOfInterest = reviewsOfInterest.parallelStream().sorted(Comparator.comparing(Review::getCreateTime).reversed()).collect(Collectors.toList());
        return reviewsOfInterest.subList(0, reviewsOfInterest.size()>10 ? 10 : reviewsOfInterest.size());
    }
}
