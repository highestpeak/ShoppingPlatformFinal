package com.demo.mms.controller;


import com.demo.mms.common.domain.Review;
import com.demo.mms.common.utils.ControllerUtility;
import com.demo.mms.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.naming.ldap.Control;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/review")
@RestController
public class ReviewController {

    private final ReviewService reviewService;

    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }


    @GetMapping("/")
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


    @PostMapping("/")
    @ResponseBody
    public Map<String, Object> insertReview() {
        return null;
    }
}
