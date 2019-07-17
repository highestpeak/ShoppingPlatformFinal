package com.demo.mms.service;

import com.demo.mms.common.domain.Store;
import com.demo.mms.common.vo.GoodsWithClassifyVO;
import com.demo.mms.dao.GoodsOperateMapper;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    GoodsOperateMapper goodsOperateMapper;
    @Override
    public Map<String, Object> getStoreGoodsClassify(Store store, ArrayList classifyList) {
        Map<String,Object> rs = new HashMap<>();
        ArrayList<GoodsWithClassifyVO> classifyOwnList=null;
        try{
            classifyOwnList=goodsOperateMapper.queryGoodsWithClassify(store.getStore_id());
        }catch (Exception e){
            System.out.println(e);
            rs.put("querry error",true);
        }
        for (GoodsWithClassifyVO classifyOwn:classifyOwnList){
            classifyList.add(new ArrayList<>(Arrays.asList(classifyOwn.getClassify_id(),
                                            classifyOwn.getClassify_name(),
                                            classifyOwn.getTop_level_classify_id())));
        }
        return rs;
    }
}
