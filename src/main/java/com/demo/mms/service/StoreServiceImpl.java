package com.demo.mms.service;

import com.demo.mms.common.domain.*;
import com.demo.mms.common.utils.IDGenerator;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.OnSaleGoodsVO;
import com.demo.mms.dao.GoodsOperateMapper;
import com.demo.mms.dao.UserOperateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class StoreServiceImpl implements StoreService{
    @Autowired
    GoodsOperateMapper goodsOperateMapper;
    @Autowired
    UserOperateMapper userOperateMapper;
    @Override
    public Map<String,Object> getStoreInfo(Store store) {
        Map<String ,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        rs.put("store",storeCheck);
        return rs;
    }

    @Override
    public Map<String, Object> updateStoreInfo(Store oldStore, Store newStore) {
        Map<String ,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",oldStore.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        rs.putAll(modifyStoreInfoHelp(oldStore,newStore));
        return rs;
    }

    @Override
    public Map<String, Object> getStoreThingOfDay(Store store, String dateToGet) {
        return null;
    }

    @Override
    public Map<String, Object> setOnSale(OnSale onSale) {
        //查找store是否存在
        Map<String ,Object> rs=new HashMap<>();
        Store storeCheck=goodsOperateMapper.queryStore("store_id",onSale.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(storeCheck.getStore_id(),"goods_id",onSale.getGoods_id());
        if(idCheck==null){
            rs.put("goods exist",false);
            return rs;
        }
        onSale.setOn_sale_id(IDGenerator.getId());
        onSale.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
        try {
            goodsOperateMapper.insertOnSale(onSale);
        }catch (Exception e){
            rs.put("insert error",true);
        }
        return rs;
    }

    @Override
    public Map<String, Object> delOnSale(String on_sale_id) {
        Map<String ,Object> rs=new HashMap<>();
        OnSale onSaleCheck=goodsOperateMapper.queryOnSale("on_sale_id",on_sale_id);
        if(onSaleCheck==null){
            rs.put("onSale not exist",true);
            return rs;
        }
        try {
            goodsOperateMapper.delOnSale("on_sale_id",on_sale_id);
        }catch (Exception e){
            rs.put("can not del","exception");
        }
        return rs;
    }

    @Override
    public Map<String, Object> getOnSaleGoods(String store_id, ArrayList<OnSaleGoodsVO> getOnSaleList) {
        Map<String ,Object> rs=new HashMap<>();
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store_id);
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        ArrayList<OnSaleGoodsVO> tempGet=null;
        try {
            tempGet=goodsOperateMapper.getStoreOnSale(store_id);
        }catch (Exception e){
            rs.put("get error",true);
            return rs;
        }
        getOnSaleList.addAll(tempGet);
        return rs;
    }

    @Override
    public Map<String, Object> updateOnSaleGoods(String on_sale_id, String discount, String due_time, String note) {
        return null;
    }

    @Override
    public Map<String, Object> getAllUser(ArrayList<User> users) {
        Map<String,Object> rs=new HashMap<>();
        users.addAll(userOperateMapper.queryAllUser());
        return rs;
    }

    @Override
    public Map<String, Object> getTopTenNewGoods(Store store, ArrayList<Goods> topTenNewGoods) {
        Map<String ,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store存在
        topTenNewGoods.addAll(goodsOperateMapper.queryStoreTopTenNewGoods(store.getStore_id()));
        return rs;
    }

    private Map<String, Object> modifyStoreInfoHelp(Store oldStore, Store newStore) {
        Map<String,Object> rs = new HashMap<>();
        Map<String ,String> modifyList=new HashMap<>();
        if(newStore.getStore_classify()!=null && !newStore.getStore_classify().equals(oldStore.getStore_classify())){
            modifyList.put("store_classify",newStore.getStore_classify());
        }
        if(newStore.getStore_name()!=null && !newStore.getStore_name().equals(oldStore.getStore_name())){
            modifyList.put("store_name",newStore.getStore_name());
        }
        if(newStore.getCertification()!=null && !newStore.getCertification().equals(oldStore.getCertification())){
            modifyList.put("certification",newStore.getCertification());
        }
        if(newStore.getLevel()!=null && !newStore.getLevel().equals(oldStore.getLevel())){
            modifyList.put("level",newStore.getLevel());
        }
        if(newStore.getNote()!=null && !newStore.getNote().equals(oldStore.getNote())){
            modifyList.put("note",newStore.getNote());
        }
        if(newStore.getStore_pic_url()!=null && !newStore.getStore_pic_url().equals(oldStore.getStore_pic_url())){
            modifyList.put("store_pic_url",newStore.getStore_pic_url());
        }
        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                goodsOperateMapper.updateStore("store_id",oldStore.getStore_id(),
                        entry.getKey(),(String)entry.getValue()
                        );
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            goodsOperateMapper.updateStore("store_id",oldStore.getStore_id(),
                    "update_time", ProjectFactory.getPorjectStrDate(new Date())
                    );
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
}
