package com.demo.mms.service;

import com.demo.mms.common.domain.Store;
import com.demo.mms.dao.GoodsOperateMapper;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    GoodsOperateMapper goodsOperateMapper;
    @Override
    public Map<String, Object> getStoreGoodsClassify(Store store, ArrayList classifyList) {
        ResultMap resultMap=null;
        try{
            resultMap=goodsOperateMapper.queryGoodsWithClassify("store_id",store.getStore_id());
        }catch (Exception e){
            System.out.println(e);
        }
        System.out.println(resultMap);
        return null;
    }
}
