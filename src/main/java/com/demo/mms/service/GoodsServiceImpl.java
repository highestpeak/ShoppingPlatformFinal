package com.demo.mms.service;

import com.demo.mms.common.domain.*;
import com.demo.mms.common.utils.IDGenerator;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.*;
import com.demo.mms.dao.GoodsOperateMapper;
import com.demo.mms.dao.UserOperateMapper;
import com.google.protobuf.MapEntry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.DocFlavor;
import javax.swing.text.Style;
import java.lang.reflect.Array;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService{
    @Autowired
    GoodsOperateMapper goodsOperateMapper;
    @Autowired
    UserOperateMapper userOperateMapper;

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
                                            classifyOwn.getParent_id())));
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
        ArrayList<StoreGoodsChartByClassifyVO> classifyListTemp=goodsOperateMapper.queryStoreGoodsChartByClassify(store.getStore_id());

        for (StoreGoodsChartByClassifyVO arrayList:classifyListTemp){
            String classifyName=arrayList.getClassify_name();
            if(arrayList.getGoods_id()!=null){
                if (returnTempMap.containsKey(classifyName) ){
                    returnTempMap.put(classifyName,returnTempMap.get(classifyName)+1);
                }else {
                    returnTempMap.put(classifyName,1);
                }
            }else {
                returnTempMap.put(classifyName,0);
            }
        }
        rs.put("classifyMap",returnTempMap);
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
                if(idCheck!=null){
                    goodsOperateMapper.deleteClassifyOfStore("classify_id",idCheck.getClassify_id());
                    goodsOperateMapper.deleteGoodsClassify("classify_id",idCheck.getClassify_id());
                }

                if(nameCheck!=null){
                    goodsOperateMapper.deleteClassifyOfStore("classify_name",nameCheck.getClassify_name());
                    goodsOperateMapper.deleteGoodsClassify("classify_name",nameCheck.getClassify_name());
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
            if(nameCheck!=null){//分类已经存在
                rs.put("classify "+goodsClassify.getClassify_name()+" existed",true);
                continue;
            }else {//分类不存在
                //先插入到goods_classify表
                try {
                    goodsClassify.setClassify_id(IDGenerator.getId());
                    //需要插入的level是0级
                    if(Integer.parseInt(goodsClassify.getParent_id())==0){
                        //直接插入
                        goodsOperateMapper.insertNewClassify(
                                goodsClassify.getClassify_id(),
                               "0",
                                goodsClassify.getParent_id(),
                                goodsClassify.getClassify_name(),
                                ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
                        goodsOperateMapper.insertNewClassifyOfStore(IDGenerator.getId(),store.getStore_id(),goodsClassify.getClassify_id());
                        continue;
                    }
                    //top_level应该比parent的top level大1
                    GoodsClassify parentClassify=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_id",goodsClassify.getParent_id());
                    //可以执行插入
                    goodsOperateMapper.insertNewClassify(
                            goodsClassify.getClassify_id(),
                            parentClassify.getTop_level_classify_id()+1,
                            goodsClassify.getParent_id(),
                            goodsClassify.getClassify_name(),
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
            return rs;
        }
        //分类存在
        GoodsClassify findNewClassifyParent=null;
        if(Integer.parseInt(newClassify.getParent_id())==0){
            newClassify.setParent_id("0");
            newClassify.setTop_level_classify_id("0");
        }else {
            findNewClassifyParent=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_id",newClassify.getParent_id());
            if(findNewClassifyParent==null){
                rs.put("parent of "+newClassify.getClassify_name()+" not find",true);
                return rs;
            }
            newClassify.setParent_id(findNewClassifyParent.getClassify_id());
            newClassify.setTop_level_classify_id(Integer.toString(Integer.valueOf(findNewClassifyParent.getTop_level_classify_id())+1));
        }
        //新分类父级分类存在
        rs.putAll(modifyClassifyHelp(store,nameCheck,newClassify));
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
//        ArrayList<Goods> goodsInStore=goodsOperateMapper.queryAllGoodsOfStore(store.getStore_id());
        //查找classify是否存在
        //获取所有商品
        if(classifyToGet.getClassify_name().equals("all")){
//            goodsInStore=goodsOperateMapper.queryAllGoodsOfStore(store.getStore_id());
            ArrayList<GoodsWithClassifyVO> goodsInStoreWithClassify=goodsOperateMapper.queryAllGoodsOfStoreWithClassifySend(store.getStore_id());
            goodsList.addAll(goodsInStoreWithClassify);
        }else {
            //获取特定种类商品
            //查找分类是否存在
            GoodsClassify goodsClassifyCheck=goodsOperateMapper.queryClassifyOfStore(store.getStore_id(),"classify_name",classifyToGet.getClassify_name());
            if(goodsClassifyCheck==null){//不存在
                rs.put("classify find",false);
                return rs;
            }
            //分类存在
            ArrayList<Goods> goodsInStore=goodsOperateMapper.queryAllGoodsOfStore_specialClass(store.getStore_id(),classifyToGet.getClassify_name());
            if (goodsInStore==null || goodsInStore.size()==0){
                rs.put("Goods find",false);
                return rs;
            }
            goodsList.addAll(goodsInStore);
        }

        //classify存在

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
            if (idCheck!=null){
                rs.putAll(modifyGoodsHelp(store,oldGoods,newGoods,"goods_id",idCheck.getGoods_id()));
            }else {//nameCheck!=null
                rs.putAll(modifyGoodsHelp(store,oldGoods,newGoods,"goods_name",idCheck.getGoods_name()));
            }
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
    public Map<String, Object> addStoreGoods(Store store, ArrayList<GoodsAddWithClassifyVO> goodsToAdd) {
        Map<String,Object> rs = new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        for (GoodsAddWithClassifyVO goods:goodsToAdd){
            Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goods.getGoods_name());
            Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goods.getGoods_id());

            if((nameCheck!=null)||(idCheck!=null)){//存在
                rs.put("goods "+goods.getGoods_name()+" existed",true);
            }else {
                ClassifySelledQueryVO classifyCheck=goodsOperateMapper.queryClassifyOfStore(storeCheck.getStore_id(),"classify_name",goods.getClassify_name());
                if(classifyCheck==null){//分类不存在
                    rs.put("classify "+goods.getClassify_name()+" selled",false);
                    return rs;
                }
                try {
                    String newGoodsId=IDGenerator.getId();
                    goodsOperateMapper.insertGoods(
                            newGoodsId, store.getStore_id(),goods.getGoods_name(),Integer.toString(goods.getPrice()),
                            goods.getDescription(),goods.getPic_url(),goods.getStatus(),
                            goods.getOld_level(),ProjectFactory.getPorjectStrDate(new Date()),ProjectFactory.getPorjectStrDate(new Date()));
                    goodsOperateMapper.insertNewClassifyOfGoods(IDGenerator.getId(),classifyCheck.getStore_selled_id(),newGoodsId);
                }catch (Exception e){
                    e.printStackTrace();
                    rs.put("goods "+goods.getGoods_name()+" add","cannot add");
                }
            }
        }
        return rs;
    }

    @Override
    public Map<String, Object> getStoreGoodsInfo(Store store, Goods goodsToGet) {
        Map<String,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        //store 存在
        //查找商品是否存在
        Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goodsToGet.getGoods_name());
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goodsToGet.getGoods_id());
        if((nameCheck==null)&&(idCheck==null)){//不存在
            rs.put("goods "+goodsToGet.getGoods_name()+" existed",false);
        }else {
            if (idCheck!=null){
                rs.put("goodsGet",idCheck);
            }else {//nameCheck!=null
                rs.put("goodsGet",nameCheck);
            }
        }

        return rs;
    }

    @Override
    public Map<String, Object> starGoods(User user, Store store, Goods goods) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        Goods nameCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_name",goods.getGoods_name());
        Goods idCheck=goodsOperateMapper.queryGoodsOfStore(store.getStore_id(),"goods_id",goods.getGoods_id());
        if((nameCheck==null)&&(idCheck==null)){//不存在
            rs.put("goods "+goods.getGoods_name()+" existed",false);
        }else {
            GoodsStar goodsStar=new GoodsStar();
            goodsStar.setGoodsStar_id(IDGenerator.getId());
            goodsStar.setUser_id(user.getUser_id());
            goodsStar.setSetStar_time(ProjectFactory.getPorjectStrDate(new Date()));
            if (idCheck!=null){
                goodsStar.setGoods_id(idCheck.getGoods_id());
                userOperateMapper.insertInterestedGoods(goodsStar);
            }else {//nameCheck!=null
                goodsStar.setGoods_id(nameCheck.getGoods_id());
                userOperateMapper.insertInterestedGoods(goodsStar);
            }
        }

        return rs;
    }

    @Override
    public Map<String, Object> getStarGoods(String user_id, ArrayList<StarGoodsGetVO> starGoodsVOs) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        ArrayList<StarGoodsGetVO> starGoodsTemp=new ArrayList<>();
        starGoodsTemp=userOperateMapper.getStarGoods("user_id",user_id);
        starGoodsVOs.addAll(starGoodsTemp);
        return rs   ;
    }

    @Override
    public Map<String, Object> getGoodsOnWithTime(String store_id, Map<String,ArrayList<String>> goodsOnTimeVOS) throws Exception{
        if (goodsOnTimeVOS==null){
            throw new Exception("goodsOnTimeVOS can not be null");
        }
        Map<String,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store_id);
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        ArrayList<Goods> goodsInStore=goodsOperateMapper.queryAllGoodsOfStore(store_id);
        for (Goods goods:goodsInStore){
            String createTime=goods.getCreate_time();
            if(goodsOnTimeVOS.containsKey(createTime)){
                goodsOnTimeVOS.get(createTime).add(goods.getGoods_name());
            }else {
                goodsOnTimeVOS.put(createTime,new ArrayList<>(Arrays.asList(goods.getGoods_name())));
            }
        }
        return rs;
    }

    @Override
    public Map<String, Object> getAllGoodsSelled(Store store,ArrayList<GoodsWithClassifyVO> goodsList) {
        Map<String,Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        ArrayList<GoodsWithClassifyVO> goodsInStoreWithClassify=goodsOperateMapper.queryAllGoodsOfStoreWithClassifySend(store.getStore_id());
        //设置所有分类名称 更改为根类名称
        ArrayList<String > allClassifyNameReturn=new ArrayList<>();
        ArrayList classifyList=new ArrayList();
        rs.putAll(this.getStoreGoodsClassify(store,classifyList));
        Map<String,ArrayList<String >> classifyTempMapKeyId=new HashMap<>();//key为id value为name 和 parent id
        Map<String,String> classifyToRoot=new HashMap<>();//id 为classify name value为parent name
        for (Object object:classifyList){
            ArrayList<String> classifyArray=(ArrayList<String>)(object);
            classifyTempMapKeyId.put(
                    classifyArray.get(0),
                    new ArrayList<>(Arrays.asList(classifyArray.get(1),classifyArray.get(2)))
            );

        }//所有的分类映射成了一个map
        for (Map.Entry<String,ArrayList<String >> entry:classifyTempMapKeyId.entrySet()){
            classifyToRoot.put(entry.getValue().get(0),getParentClassifyName(classifyTempMapKeyId,entry.getValue()));
        }//classifyToRoot id 为classify name value为parent name
        for (GoodsWithClassifyVO goodsWithClassifyVO:goodsInStoreWithClassify){
            goodsWithClassifyVO.setClassify_name(classifyToRoot.get(goodsWithClassifyVO.getClassify_name()));
        }//修改分类名称为root类的名称
        Map<String ,String> rootClassify=new HashMap<>();
        for (Map.Entry<String ,String > entry:classifyToRoot.entrySet()){
            rootClassify.put(entry.getValue(),"");
        }
        ArrayList<String> rootClassifyNameList=new ArrayList<>(rootClassify.keySet());
        goodsList.addAll(goodsInStoreWithClassify);
        rs.put("rootClassList",rootClassifyNameList);
//        for (Object object:classifyList){
//            ArrayList<String> classifyArray=(ArrayList<String>)(object);
//            String parent_id=classifyArray.get(2);
//            if(parent_id.equals("0")){//
//                allClassifyNameReturn.add(classifyArray.get(1));
//            }else {
//                allClassifyNameReturn.add(getParentClassifyName(classifyList,classifyArray));
//            }
//        }
        goodsList.addAll(goodsInStoreWithClassify);
        return rs;
    }

    private String getParentClassifyName(final Map<String,ArrayList<String >> classifyTempMap,
                                         ArrayList<String > currClassify) {
        String parentName=null;
        if(currClassify.get(1).equals("0")){//parent id
            parentName= currClassify.get(0);
        }else {
            parentName= getParentClassifyName(classifyTempMap,classifyTempMap.get(currClassify.get(1)));
        }
        return parentName;
    }

    @Override
    public Map<String, Object> starClassify(User user, GoodsClassify goodsClassify) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        GoodsClassify idCheck=goodsOperateMapper.queryGoodsClassify("classify_id",goodsClassify.getClassify_id());
        GoodsClassify nameCheck=goodsOperateMapper.queryGoodsClassify("classify_name",goodsClassify.getClassify_name());
        if((idCheck==null)&&(nameCheck==null)){//不存在
            rs.put("goods classify"+nameCheck.getClassify_name()+" existed",false);
        }else {
            ClassifyStar classifyStar=new ClassifyStar();
            classifyStar.setClassifyStar_id(IDGenerator.getId());
            classifyStar.setUser_id(user.getUser_id());
            classifyStar.setSetStar_time(ProjectFactory.getPorjectStrDate(new Date()));
            if (idCheck!=null){
                classifyStar.setClassify_id(idCheck.getClassify_id());
                userOperateMapper.insertInterestedClassify(classifyStar);
            }else {//nameCheck!=null
                classifyStar.setClassify_id(nameCheck.getClassify_id());
                userOperateMapper.insertInterestedClassify(classifyStar);
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

        if(!newClassify.getParent_id().equals(oldClassify.getParent_id())){
            //top_level应该比parent的top level大1
            //需要插入的level是0级
            modifyList.put("parent_id",newClassify.getParent_id());
        }

        if(!newClassify.getTop_level_classify_id().equals(oldClassify.getTop_level_classify_id())){
            //top_level应该比parent的top level大1
            //需要插入的level是0级
            modifyList.put("top_level_classify_id",newClassify.getTop_level_classify_id());
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

    private Map<String, Object> modifyGoodsHelp(Store store,Goods oldGoods, Goods newGoods,String modifyKey,String modifyValue) {
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
                        modifyKey,modifyValue,
                        entry.getKey(),modiyArr.get(1));
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            goodsOperateMapper.updateGoods(store.getStore_id(),
                    modifyKey,modifyValue,
                    "update_time",ProjectFactory.getPorjectStrDate(new Date()));
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
}
