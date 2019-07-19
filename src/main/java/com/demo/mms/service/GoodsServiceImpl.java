package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.utils.IDGenerator;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.StoreSelledClassifyVO;
import com.demo.mms.dao.GoodsOperateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    GoodsOperateMapper goodsOperateMapper;

    //查询商店所售卖所有商品分类
    @Override
    public Map<String, Object> getStoreGoodsClassify(Store store, ArrayList classifyList) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        ArrayList<StoreSelledClassifyVO> classifyOwnList=null;
        classifyOwnList=goodsOperateMapper.queryGoodsWithClassify(store.getStore_id());
        if (classifyOwnList==null || classifyOwnList.size()==0){
            rs.put("classify find",false);
            return rs;
        }
        //classify存在
        for (StoreSelledClassifyVO classifyOwn:classifyOwnList){
            classifyList.add(new ArrayList<>(Arrays.asList(classifyOwn.getClassify_id(),
                                            classifyOwn.getClassify_name(),
                                            classifyOwn.getTop_level_classify_id())));
        }
        return rs;
    }

    //删除商店所售卖部分商品分类
    @Override
    public Map<String, Object> deleteStoreGoodsClassify(Store store, ArrayList<GoodsClassify> classifiesToDel) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        for (GoodsClassify goodsClassify:classifiesToDel){
            //查询分类是否存在
            GoodsClassify nameCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_name",goodsClassify.getClassify_name());
            GoodsClassify idCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_id",goodsClassify.getClassify_id());
            if((nameCheck==null)&&(idCheck==null)){//分类不存在
                rs.put("classify "+goodsClassify.getClassify_name()+" existed",false);
            }else {//分类存在
                //根据分类名称去删除
                try {
                    goodsOperateMapper.deleteClassifyOfStore("classify_name",nameCheck.getClassify_name());
                }catch (Exception e){
                    rs.put("classify "+goodsClassify.getClassify_name()+" del","cannot del");
                }
            }
        }
        return rs;
    }

    //添加
    @Override
    public Map<String, Object> addStoreGoodsClassify(Store store, ArrayList<GoodsClassify> classifiesToAdd) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        Integer maxLevel;
        try {
            maxLevel=Integer.parseInt(goodsOperateMapper.queryMaxLevel_ClassifyOfStore(store.getStore_id()));
        }catch (Exception e){
            rs.put("querry error",true);
            return rs;
        }
        for (GoodsClassify goodsClassify:classifiesToAdd){
            //查询分类是否存在
            GoodsClassify nameCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_name",goodsClassify.getClassify_name());
            GoodsClassify idCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_id",goodsClassify.getClassify_id());
            if((nameCheck!=null)||(idCheck!=null)){//分类已经存在
                rs.put("classify "+goodsClassify.getClassify_name()+" existed",true);
                continue;
            }else {//分类不存在
                //先插入到goods_classify表
                try {
                    Integer thisLevel=Integer.parseInt(goodsClassify.getClassify_id());
                    goodsClassify.setClassify_id(IDGenerator.getId());
                    //检查top_level
                    if(thisLevel>maxLevel){
                        rs.put("top level "+goodsClassify.getTop_level_classify_id()+" too high","should less than "+maxLevel);
                        continue;
                    }
                    //需要插入的level是0级
                    if(Integer.parseInt(goodsClassify.getParent_id())==0){
                        //直接插入
                        goodsOperateMapper.insertNewClassify(goodsClassify.getClassify_id(),goodsClassify.getTop_level_classify_id(),goodsClassify.getClassify_name(),
                                ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
                        goodsOperateMapper.insertNewClassifyOfStore(IDGenerator.getId(),store.getStore_id(),goodsClassify.getClassify_id());
                        continue;
                    }
                    //top_level应该比parent的top level大1
                    GoodsClassify parentClassify=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_id",goodsClassify.getParent_id());
                    //不是parent的下一级
                    if(thisLevel-1!=Integer.parseInt(parentClassify.getTop_level_classify_id())){
                        rs.put("classify level "+goodsClassify.getTop_level_classify_id()+" error","parent level is "+parentClassify.getTop_level_classify_id());
                        continue;
                    }
                    //可以执行插入
                    goodsOperateMapper.insertNewClassify(goodsClassify.getClassify_id(),goodsClassify.getTop_level_classify_id(),goodsClassify.getClassify_name(),
                            ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
                    goodsOperateMapper.insertNewClassifyOfStore(IDGenerator.getId(),store.getStore_id(),goodsClassify.getClassify_id());
                }catch (Exception e){
                    rs.put("classify "+goodsClassify.getClassify_name()+" insert","error");
                    continue;
                }
            }
        }
        return rs;
    }

    @Override
    public Map<String, Object> updateStoreGoodsClassify(Store store,GoodsClassify oldClassify,GoodsClassify newClassify) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        GoodsClassify nameCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_name",oldClassify.getClassify_name());
        GoodsClassify idCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_id",oldClassify.getClassify_id());
        if((nameCheck==null)&&(idCheck==null)){//分类不存在
            rs.put("classify "+oldClassify.getClassify_name()+" existed",false);
        }else {
            rs.putAll(modifyClassifyHelp(store,oldClassify,newClassify));
        }
        return rs;
    }

    @Override
    public Map<String, Object> getStoreGoods(Store store, ArrayList goodsList) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        ArrayList<Goods> goodsInStore=goodsOperateMapper.queryAllGoodsOfStore(store.getStore_id());
        if (goodsInStore==null || goodsInStore.size()==0){
            rs.put("Goods find",false);
            return rs;
        }
        //classify存在
        goodsList.addAll(goodsInStore);
        return rs;
    }

    @Override
    public Map<String, Object> updateStoreGoods(Store store, Goods oldGoods, Goods newGoods) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",oldGoods.getGoods_name());
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",oldGoods.getGoods_id());
        if((nameCheck==null)&&(idCheck==null)){//不存在
            rs.put("goods "+oldGoods.getGoods_name()+" existed",false);
        }else {
            rs.putAll(modifyGoodsHelp(store,oldGoods,newGoods));
        }
        return rs;
    }

    @Override
    public Map<String, Object> delStoreGoods(Store store, Goods goodsToDel) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goodsToDel.getGoods_name());
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goodsToDel.getGoods_id());
        if((nameCheck==null)&&(idCheck==null)){//不存在
            rs.put("goods "+goodsToDel.getGoods_name()+" existed",false);
        }else {
            try {
                goodsOperateMapper.deleteGoods(store.getStore_id(),"goods_name",nameCheck.getGoods_name());
            }catch (Exception e){
                rs.put("goods "+goodsToDel.getGoods_name()+" del","cannot del");
            }
        }
        return rs;
    }

    @Override
    public Map<String, Object> addStoreGoods(Store store, Goods goodsToAdd) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goodsToAdd.getGoods_name());
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goodsToAdd.getGoods_id());
        if((nameCheck!=null)||(idCheck!=null)){//存在
            rs.put("goods "+goodsToAdd.getGoods_name()+" existed",true);
        }else {
            try {
                goodsOperateMapper.insertGoods(
                        IDGenerator.getId(), store.getStore_id(),goodsToAdd.getGoods_name(),
                        goodsToAdd.getDescription(),goodsToAdd.getPic_url(),goodsToAdd.getStatus(),
                        goodsToAdd.getOld_level(),ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
            }catch (Exception e){
                rs.put("goods "+goodsToAdd.getGoods_name()+" del","cannot del");
            }
        }
        return null;
    }

    private Map<String, Object> modifyClassifyHelp(Store store, GoodsClassify oldClassify, GoodsClassify newClassify) {
        Map<String,Object> rs = new HashMap<>();
        Map<String ,String> modifyList=new HashMap<>();
        if(!oldClassify.getClassify_name().equals(newClassify.getClassify_name())){
            modifyList.put("classify_name",newClassify.getClassify_name());
        }

        if(!oldClassify.getParent_id().equals(newClassify.getParent_id())){
            //top_level应该比parent的top level大1
            //需要插入的level是0级
            try{
                if(Integer.parseInt(newClassify.getParent_id())==0){
                    //直接插入
                    modifyList.put("parent_id",newClassify.getParent_id());
                }else {
                    GoodsClassify parentClassify=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_id",newClassify.getParent_id());
                    //不是parent的下一级
                    if(Integer.parseInt(newClassify.getTop_level_classify_id()) -1!=
                            Integer.parseInt(parentClassify.getTop_level_classify_id())){
                        rs.put("new classify level "+newClassify.getTop_level_classify_id()+" error","parent level is "+parentClassify.getTop_level_classify_id());
                        return rs;
                    }
                    modifyList.put("parent_id",newClassify.getParent_id());
                }
            }catch (Exception e){
                rs.put("modify level wrong",true);
                return rs;
            }
        }

        if(!oldClassify.getTop_level_classify_id().equals(newClassify.getTop_level_classify_id())){
            //top_level应该比parent的top level大1
            //需要插入的level是0级
            try{
                if(Integer.parseInt(oldClassify.getTop_level_classify_id())==0){
                    //直接插入
                    modifyList.put("top_level_classify_id",newClassify.getTop_level_classify_id());
                }else {
                    GoodsClassify parentClassify=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_id",newClassify.getParent_id());
                    //不是parent的下一级
                    if(Integer.parseInt(newClassify.getTop_level_classify_id()) -1!=
                            Integer.parseInt(parentClassify.getTop_level_classify_id())){
                        rs.put("new classify level "+newClassify.getTop_level_classify_id()+" error","parent level is "+parentClassify.getTop_level_classify_id());
                        return rs;
                    }
                    modifyList.put("top_level_classify_id",newClassify.getTop_level_classify_id());
                }
            }catch (Exception e){
                rs.put("modify top_level_classify_id wrong",true);
                return rs;
            }
        }

        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                goodsOperateMapper.updateGoodsClassify(entry.getKey(),(String)entry.getValue(),
                        "classify_id",oldClassify.getClassify_id());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        return rs;
    }

    private Map<String, Object> modifyGoodsHelp(Store store,Goods oldGoods, Goods newGoods) {
        Map<String,Object> rs = new HashMap<>();
        Map<String ,String> modifyList=new HashMap<>();
        if(!oldGoods.getGoods_name().equals(newGoods.getGoods_name())){
            modifyList.put("goods_name",oldGoods.getGoods_name());
        }

        if(!oldGoods.getDescription().equals(newGoods.getDescription())){
            modifyList.put("description",oldGoods.getDescription());
        }

        if(!oldGoods.getPic_url().equals(newGoods.getPic_url())){
            modifyList.put("pic_url",oldGoods.getPic_url());
        }

        if(!oldGoods.getStatus().equals(newGoods.getStatus())){
            modifyList.put("status",oldGoods.getStatus());
        }

        if(!oldGoods.getOld_level().equals(newGoods.getOld_level())){
            modifyList.put("old_level",oldGoods.getOld_level());
        }

        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                goodsOperateMapper.updateGoods(store.getStore_id(),entry.getKey(),(String)entry.getValue(),
                        "goods_id",oldGoods.getGoods_id());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            goodsOperateMapper.updateGoods(store.getStore_id(),"update_time",ProjectFactory.getPorjectStrDate(new Date()),
                    "goods_id",oldGoods.getGoods_id());
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
}
