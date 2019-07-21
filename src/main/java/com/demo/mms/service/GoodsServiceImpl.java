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

import java.lang.reflect.Array;
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

    @Override
    public Map<String, Object> getStoreGoodsClassifyChartInfo(Store store, ArrayList classifyList) {
        Map<String,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        Map<String,Integer> returnTempMap=new HashMap<>();
        ArrayList<ArrayList> classifyListTemp=new ArrayList<>();
        rs.putAll(getStoreGoodsClassify(store,classifyListTemp));
        for (ArrayList arrayList:classifyListTemp){
            String classifyName=(String) arrayList.get(1);
            if (returnTempMap.containsKey(classifyName)){
                returnTempMap.put(classifyName,returnTempMap.get(classifyName)+1);
            }else {
                returnTempMap.put(classifyName,0);
            }
        }
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(returnTempMap.entrySet());
        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Map.Entry<String, Integer> o1,
                               Map.Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
        });
        Map<String,Object> returnMap=new HashMap<>();
        for(Map.Entry<String,Integer> mapping:list){
            returnMap.put(mapping.getKey(),mapping.getValue());
        }
        rs.put("classifyMap",list);
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
            GoodsClassify nameCheck=null;
            GoodsClassify idCheck=null;
            try {
                nameCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_name",goodsClassify.getClassify_name());
                idCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_id",goodsClassify.getClassify_id());
            }catch (Exception e){
                e.printStackTrace();
            }
            if((nameCheck==null)&&(idCheck==null)){//分类不存在
                rs.put("classify "+goodsClassify.getClassify_name()+" existed",false);
            }else {//分类存在
                //根据分类名称去删除
                try {
                    goodsOperateMapper.deleteClassifyOfStore("classify_id",nameCheck.getClassify_name());
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
            rs.putAll(modifyClassifyHelp(store,nameCheck,newClassify));
        }
        return rs;
    }

    @Override
    public Map<String, Object> getStoreGoods(Store store, GoodsClassify classifyToGet,ArrayList goodsList) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        ArrayList<Goods> goodsInStore=null;
        //查找classify是否存在
        //获取所有商品
        if(classifyToGet.getClassify_name().equals("all")){
            goodsInStore=goodsOperateMapper.queryAllGoodsOfStore(store.getStore_id());
        }else {
            //获取特定种类商品
            //查找分类是否存在
            GoodsClassify goodsClassifyCheck=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_name",classifyToGet.getClassify_name());
            if(goodsClassifyCheck==null){//不存在
                rs.put("classify find",false);
                return rs;
            }
            //分类存在
            goodsInStore=goodsOperateMapper.queryAllGoodsOfStore_specialClass(store.getStore_id(),classifyToGet.getClassify_name());
        }
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
    public Map<String, Object> delStoreGoods(Store store, ArrayList<Goods> goodsToDel) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        for (Goods goods:goodsToDel){
            Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goods.getGoods_name());
            Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goods.getGoods_id());
            if((nameCheck==null)&&(idCheck==null)){//不存在
                rs.put("goods "+goods.getGoods_name()+" existed",false);
            }else {
                try {
                    goodsOperateMapper.deleteGoods(store.getStore_id(),"goods_name",nameCheck.getGoods_name());
                }catch (Exception e){
                    rs.put("goods "+goods.getGoods_name()+" del","cannot del");
                }
            }
        }

        return rs;
    }

    @Override
    public Map<String, Object> addStoreGoods(Store store, ArrayList<Goods> goodsToAdd) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        for (Goods goods:goodsToAdd){
            Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goods.getGoods_name());
            Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goods.getGoods_id());
            if((nameCheck!=null)||(idCheck!=null)){//存在
                rs.put("goods "+goods.getGoods_name()+" existed",true);
            }else {
                try {
                    goodsOperateMapper.insertGoods(
                            IDGenerator.getId(), store.getStore_id(),goods.getGoods_name(),
                            goods.getDescription(),goods.getPic_url(),goods.getStatus(),
                            goods.getOld_level(),ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
                }catch (Exception e){
                    rs.put("goods "+goods.getGoods_name()+" add","cannot add");
                }
            }
        }
        return rs;
    }

    private Map<String, Object> modifyClassifyHelp(Store store, GoodsClassify oldClassify, GoodsClassify newClassify) {
        Map<String,Object> rs = new HashMap<>();
        Map<String ,String> modifyList=new HashMap<>();
        if(newClassify.getClassify_name()!=null && !newClassify.getClassify_name().equals(oldClassify.getClassify_name())){
            modifyList.put("classify_name",newClassify.getClassify_name());
        }

        if(newClassify.getParent_id()!=null && !newClassify.getParent_id().equals(oldClassify.getParent_id())){
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

        if(newClassify.getTop_level_classify_id()!=null && !newClassify.getTop_level_classify_id().equals(oldClassify.getTop_level_classify_id())){
            //top_level应该比parent的top level大1
            //需要插入的level是0级
            try{
                if(Integer.parseInt(newClassify.getTop_level_classify_id())==0){
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
        Map<String ,Object> modifyList=new HashMap<>();
        if(newGoods.getGoods_name()!=null && !newGoods.getGoods_name().equals(oldGoods.getGoods_name())){
            modifyList.put("goods_name",Arrays.asList(oldGoods.getGoods_name(),newGoods.getGoods_name()));
        }

        if(newGoods.getDescription()!=null && !newGoods.getDescription().equals(oldGoods.getDescription())){
            modifyList.put("description",Arrays.asList(oldGoods.getDescription(),newGoods.getDescription()));
        }

        if(newGoods.getPic_url()!=null && !newGoods.getPic_url().equals(oldGoods.getPic_url())){
            modifyList.put("pic_url",Arrays.asList(oldGoods.getPic_url(),newGoods.getPic_url()));
        }

        if(newGoods.getStatus()!=null && !newGoods.getStatus().equals(oldGoods.getStatus())){
            modifyList.put("status",Arrays.asList(oldGoods.getStatus(),newGoods.getStatus()));
        }

        if(newGoods.getOld_level()!=null && !newGoods.getOld_level().equals(oldGoods.getOld_level())){
            modifyList.put("old_level",Arrays.asList(oldGoods.getOld_level(),newGoods.getOld_level()));
        }

        for (Map.Entry<String ,Object> entry:modifyList.entrySet()){
            try {
                List<String> modiyArr=(List<String>) entry.getValue();
                goodsOperateMapper.updateGoods(store.getStore_id(),
                        entry.getKey(),modiyArr.get(0),
                        entry.getKey(),modiyArr.get(1));
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
