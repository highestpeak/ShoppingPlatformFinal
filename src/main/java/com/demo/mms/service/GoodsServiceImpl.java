package com.demo.mms.service;

import com.demo.mms.common.domain.Goods;
import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;
import com.demo.mms.common.domain.StoreSellClassify;
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
            rs.putAll(modifyHelp(store,oldClassify,newClassify));
        }
        return rs;
    }

    private Map<String, Object> modifyHelp(Store store, GoodsClassify oldClassify, GoodsClassify newClassify) {
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
}
