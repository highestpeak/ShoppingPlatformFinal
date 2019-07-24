package com.demo.mms.controller;


import com.demo.mms.common.domain.Review;
import com.demo.mms.common.utils.ControllerUtility;
import com.demo.mms.dto.InsertReviewDTO;
import com.demo.mms.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.naming.ldap.Control;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/")
@RestController
public class ReviewController {

    private final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @GetMapping("reviews/")
    @ResponseBody
    public Map<String, Object> getReview(String user_id, String order_id, String goods_id) {
        Map<String, Object> result = new HashMap<>();
        Collection<Review> ret;
        try {
            ret = reviewService.select(user_id, order_id, goods_id);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, ret);
        return result;
    }

    @PostMapping("reviews/entry/{orderEntryId}/")
    @ResponseBody
    public Map<String, Object> insertReview(@RequestBody InsertReviewDTO args, @PathVariable String orderEntryId) {
        Map<String, Object> result = new HashMap<>();
        try {
            reviewService.insert(orderEntryId, args.getRating(), args.getContent());
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertSuccessFlag(result);
        return result;
    }

    @GetMapping("reviews/stat/recent/{goodsId}")
    @ResponseBody
    public Map<String, Object> getMostRecentTenRecordOfGoods(@PathVariable String goodsId) {
        Map<String, Object> result = new HashMap<>();
        Collection<Review> ret;
        try {
            ret = reviewService.getRecentTenReviewOfGoods(goodsId);
        } catch (Exception e) {
            ControllerUtility.insertErrorMessageAndFailFlag(result, e);
            return result;
        }
        ControllerUtility.insertQueryResultAndSuccessFlag(result, ret);
        return result;
    }
}
