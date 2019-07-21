package com.demo.mms.service;

import com.demo.mms.common.domain.*;
import com.demo.mms.common.utils.ProjectFactory;
import com.demo.mms.common.vo.GoodsViewedQueryVO;
import com.demo.mms.common.vo.ViewHistoryGetVO;
import com.demo.mms.common.vo.ViewedHistoryReturnVO;
import com.demo.mms.dao.GoodsOperateMapper;
import com.demo.mms.dao.UserOperateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserOperateMapper userOperateMapper;
    @Autowired
    GoodsOperateMapper goodsOperateMapper;

    @Override
    public Map<String,Object> login(String user_id,String verify,
                                    HttpServletRequest request,
                                    HttpServletResponse response) {
        Map<String,Object> rs = new HashMap<>();
        if(isAlreadyLogin(user_id,request)){//已经登录
            rs.put("already login",true);
            return rs;
        }
        //没有登陆
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        if(!userFind.getVerify().equals(verify)){//密码不正确
            rs.put("password wrong",true);
            return rs;
        }
//        if(true){//验证码不正确
//
//        }
        // 创建Cookie
        Cookie cookie = new Cookie("user_id", user_id);
        cookie.setMaxAge(60);// 有效期,秒为单位
        response.addCookie(cookie);// 设置cookie
        return rs;
    }

    @Override
    public Map<String, Object> logout(String user_id, HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> rs = new HashMap<>();
        if(!isAlreadyLogin(user_id,request)){//没有登录
            rs.put("already login",false);
            return rs;
        }
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//用户不存在
            rs.put("user existed",false);
            return rs;
        }
        //删除会话消息
        Cookie cookie= ProjectFactory.getCookieByName(request,user_id);
        cookie.setMaxAge(0);//立即销毁
        System.out.println("被删除cookie:"+cookie.getName());
        response.addCookie(cookie);
        return rs;
    }

    //如果添加新的角色，需要修改的地方最少
    @Override
    public Map<String,Object> registerUser(User user, String type) {
        Map<String,Object> rs=new HashMap<>();
        if(!ProjectFactory.userTypeTable.contains(type)){
            rs.put("type not find",true);
            return rs;
        }
        //所有种类均需要此步user表判断
        //end
        //加入具体种类的用户
        //具体种类用户逻辑均为:
        //首先判断是否在user表内
        //再判断是否在具体类别表单中
        Map<String,Object> rsTemp=addUser(user);
        if(rsTemp!=null && !rsTemp.isEmpty()){
            rs.putAll(rsTemp);
            return rs;
        }
        if(type.equals("User")){
            return rs;
        }
        //type类别user不存在，可以新建
        switch (type){//user类型 已经返回
            case "Buyer":
                Buyer buyer=(Buyer)user;
                buyer.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                buyer.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertBuyer(buyer);
                break;
            case "Seller":
                Seller seller=(Seller)user;
                seller.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                seller.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertSeller(seller);
                break;
            case "Admin":
                Admin admin=(Admin)user;
                admin.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
                admin.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
                userOperateMapper.insertAdmin(admin);
                break;
            default:
                //抛出异常
                rs=new HashMap<>();
                rs.put("type not find",true);
                break;
        }

        return rs;
    }

    private Map<String,Object> addUser(User user){
        //处理校验
        Map<String,Object> rs=new HashMap<>();
        User userFind=null;
        try {
            userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        }catch (Exception e){
            e.printStackTrace();
        }
//        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind!=null){//已经存在user
            rs.put("user existed",true);
            return rs;
        }
        //user不存在，可以新建
        user.setCreate_time(ProjectFactory.getPorjectStrDate(new Date()));
        user.setUpdate_time(ProjectFactory.getPorjectStrDate(new Date()));
        userOperateMapper.insertUser(user);
        return rs;
    }

    @Override
    public boolean isAlreadyLogin(String user_id, HttpServletRequest request) {
        Cookie cookie= ProjectFactory.getCookieByName(request,"user_id");
        if(cookie!=null){//已经登录
            return true;
        }
        return false;
    }

    @Override
    public Map<String, Object> newVerify(String user_id, String email, String newVerify) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user_id);
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        if(!userFind.getEmail().equals(email)){//邮箱不批配
            rs.put("email error",true);
            return rs;
        }
        userOperateMapper.updateUser("user_id",user_id,
                                    "verify",newVerify);
        return rs;
    }

    @Override
    public Map<String, Object> updateUser(User userOld, User userNew) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",userOld.getUser_id());
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        //存在User
        if(ProjectFactory.userTypeTable.contains(userOld.getType())){
            rs.putAll(updateUserHelp(userOld,userNew));
        }
        //处理user更新
        switch (userOld.getType()){
            case "User":
                break;
            case "Admin":
                rs.putAll(updateAdminHelp((Admin)userOld,(Admin)userNew));
                break;
            case "Buyer":
                rs.putAll(updateBuyerHelp((Buyer)userOld,(Buyer)userNew));
                break;
            case "Seller":
                rs.putAll(updateSellerHelp((Seller)userOld,(Seller)userNew));
                break;
            default:
                rs.put("type "+userOld.getType()+" find",false);
                break;
        }
        return rs;
    }

    @Override
    public Map<String, Object> getUserInfo(User user) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        //存在User
        rs.put("userFind",userFind);
        //这里说明返回的rs不应该是判断为空即为正确，
        //应当返回rs中有success为true说明执行正确，
        //这样可以网map里面放置多个值
        return rs;
    }

    @Override
    public Map<String, Object> delUser(User user) {
        Map<String,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        //存在User
        try {
            userOperateMapper.delUser("user_id",user.getUser_id());
        }catch (Exception e){
            rs.put("delError",true);
        }
        return rs;
    }

    @Override
    public Map<String, Object> getViewHistory(User user, GoodsClassify goodsClassify) {
        Map<String ,Object> rs=new HashMap<>();
        User userFind= userOperateMapper.queryUser("user","user_id",user.getUser_id());
        if(userFind==null){//不存在user
            rs.put("user existed",false);
            return rs;
        }
        if(goodsClassify.getClassify_name()==null){
            rs.put("classify name send","can not be null");
            return rs;
        }
        ArrayList<ViewedHistoryReturnVO> viewedHistoryReturnVOArrayList=new ArrayList<>();
        //存在user
        //查找全部游览的商品
        ArrayList<GoodsViewedQueryVO> goodsViewedQueryVOArrayList=null;
        if ("all".equals(goodsClassify.getClassify_name())){
            goodsViewedQueryVOArrayList=userOperateMapper.queryGoodsViewedByGoods(user.getUser_id());
            rs.putAll(QueryToReturnHelp(goodsViewedQueryVOArrayList,viewedHistoryReturnVOArrayList,"byGoods"));
            rs.put("view type","by Goods search all");
            rs.put("viewedHistoryReturn",viewedHistoryReturnVOArrayList);
            return rs;
        }
        //按商品分类查找游览对应分类
        goodsViewedQueryVOArrayList=userOperateMapper.queryGoodsViewedByClassify(user.getUser_id(),goodsClassify.getClassify_name());
        Map<String,Object> rsTemp=QueryToReturnHelp(goodsViewedQueryVOArrayList,viewedHistoryReturnVOArrayList,"byClassify");
        int countGoodsNotNullToGet=(int)rsTemp.get("byClassify");
        rsTemp.remove("byClassify");
        rs.putAll(rsTemp);
        rs.put("view type","by classify "+goodsClassify.getClassify_name()+" search");
        rs.put("view goods in classify "+goodsClassify.getClassify_name()+" count",countGoodsNotNullToGet);
        rs.put("view classify only "+goodsClassify.getClassify_name()+" count",viewedHistoryReturnVOArrayList.size()-countGoodsNotNullToGet);
        rs.put("viewedHistoryReturn",viewedHistoryReturnVOArrayList);
        return rs;
    }

    //返回用户信息+历史记录信息+商品信息+分类信息
    //即返回用户id  nickname realname  头像，sex email 和
    //历史记录view_time和view_id
    //商品 name pic_url goods_id
    //分类id name
    @Override
    public Map<String, Object> getViewHistory(Store store, GoodsClassify goodsClassify) {
        Map<String, Object> rs=new HashMap<>();
        //查找store是否存在
        Store storeCheck=goodsOperateMapper.queryStore("store_id",store.getStore_id());
        if(storeCheck==null){
            rs.put("store exist",false);
            return rs;
        }
        ArrayList<GoodsViewedQueryVO> goodsViewedQueryVOArrayList=
                userOperateMapper.queryGoodsViewedByStore(store.getStore_id(),goodsClassify.getClassify_name());
        return rs;
    }

    private Map<String, Object> QueryToReturnHelp(ArrayList<GoodsViewedQueryVO> goodsViewedQueryVOArrayList, ArrayList<ViewedHistoryReturnVO> viewedHistoryReturnVOArrayList,String type) {
        Map<String, Object> rs=new HashMap<>();
        int countGoodsNotNull=0;
        for (GoodsViewedQueryVO goodsViewedQueryVO:goodsViewedQueryVOArrayList){
            ViewedHistoryReturnVO viewedHistoryReturnVO=new ViewedHistoryReturnVO();
            viewedHistoryReturnVO.setView_time(goodsViewedQueryVO.getView_time());
            viewedHistoryReturnVO.setGoods_id(goodsViewedQueryVO.getGoods_id());
            viewedHistoryReturnVO.setGoods_name(goodsViewedQueryVO.getGoods_name());
            viewedHistoryReturnVO.setClassify_id(goodsViewedQueryVO.getClassify_id());
            viewedHistoryReturnVO.setClassify_name(goodsViewedQueryVO.getClassify_name());
            viewedHistoryReturnVOArrayList.add(viewedHistoryReturnVO);
            if(goodsViewedQueryVO.getGoods_id()!=null){
                countGoodsNotNull++;
            }
        }
        if("byClassify".equals(type)){
            rs.put("byClassify",countGoodsNotNull);
        }
        return rs;
    }

    private Map<String, Object> updateUserHelp(User userOld, User userNew) {
        Map<String,Object> rs=new HashMap<>();
        Map<String,String> modifyList=new HashMap<>();
        if(userNew.getVerify()!=null && !userNew.getVerify().equals(userOld.getVerify())){
            rs.putAll(newVerify(userOld.getUser_id(),userOld.getEmail(),userNew.getVerify()));
        }
        if(userNew.getRealname()!=null && !userNew.getRealname().equals(userOld.getRealname())){
            modifyList.put("realname",userNew.getRealname());
        }
        if(userNew.getNickname()!=null && !userNew.getNickname().equals(userOld.getNickname())){
            modifyList.put("nickname",userNew.getNickname());
        }
        if(userNew.getAvator_url()!=null && !userNew.getAvator_url().equals(userOld.getAvator_url())){
            modifyList.put("avator_url",userNew.getAvator_url());
        }
        if(userNew.getSex()!=null && !userNew.getSex().equals(userOld.getSex())){
            modifyList.put("sex",userNew.getSex().toString());
        }
        if(userNew.getEmail()!=null && !userNew.getEmail().equals(userOld.getEmail())){
            modifyList.put("email",userNew.getEmail());
        }
        if(userNew.getNote()!=null && !userNew.getNote().equals(userOld.getNote())){
            modifyList.put("note",userNew.getNote());
        }
        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                userOperateMapper.updateUser("user_id",userOld.getUser_id(),
                                            entry.getKey(),entry.getValue());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            userOperateMapper.updateUser("user_id",userOld.getUser_id(),"update_time",ProjectFactory.getPorjectStrDate(new Date()));
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
    private Map<String, Object> updateAdminHelp(Admin adminOld, Admin adminNew) {
        Map<String,Object> rs=new HashMap<>();
        Map<String,String> modifyList=new HashMap<>();
        if(!adminOld.getPermission().equals(adminNew.getPermission())){
            modifyList.put("permission",adminNew.getPermission());
        }
        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                userOperateMapper.updateUser("user_id",adminOld.getUser_id(),
                        entry.getKey(),entry.getValue());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            userOperateMapper.updateUser("user_id",adminOld.getUser_id(),"update_time",ProjectFactory.getPorjectStrDate(new Date()));
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
    private Map<String, Object> updateBuyerHelp(Buyer buyerOld, Buyer buyerNew) {
        Map<String,Object> rs=new HashMap<>();
        Map<String,String> modifyList=new HashMap<>();
        if(!buyerOld.getBank_card().equals(buyerNew.getBank_card())){
            modifyList.put("bank_card",buyerNew.getBank_card());
        }
        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                userOperateMapper.updateUser("user_id",buyerOld.getUser_id(),
                        entry.getKey(),entry.getValue());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            userOperateMapper.updateUser("user_id",buyerOld.getUser_id(),"update_time",ProjectFactory.getPorjectStrDate(new Date()));
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }
    private Map<String, Object> updateSellerHelp(Seller sellerOld, Seller sellerNew) {
        Map<String,Object> rs=new HashMap<>();
        Map<String,String> modifyList=new HashMap<>();
        if(!sellerOld.getBank_card().equals(sellerNew.getBank_card())){
            modifyList.put("bank_card",sellerNew.getBank_card());
        }
        for (Map.Entry<String ,String> entry:modifyList.entrySet()){
            try {
                userOperateMapper.updateUser("user_id",sellerOld.getUser_id(),
                        entry.getKey(),entry.getValue());
            }catch (Exception e){
                rs.put("update "+entry.getKey(),"error");
            }
        }
        try {
            userOperateMapper.updateUser("user_id",sellerOld.getUser_id(),"update_time",ProjectFactory.getPorjectStrDate(new Date()));
        }catch (Exception e){
            rs.put("update update_time","error");
        }
        return rs;
    }

}
