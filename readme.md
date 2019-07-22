# 请求数据的参考范例

``` javascript
var dataSend={
};//放置数据
$.ajax({
    type: "POST",
    url: "http://localhost:8080/goods/del",//放置URL
    data: JSON.stringify(dataSend),//放置数据的字段
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false, //同步请求，注意此字段
    success: function (data) {
        //在这里取出数据
    }
});
```
ajax较为有用的教程:

spring MVC  接收对象的几种方法 <https://blog.csdn.net/lutinghuan/article/details/46820023>

spring MVC 接收复杂对象示例 <https://blog.ityuan.com/319>

JSON传值与接收 https://segmentfault.com/a/1190000012555875

接口名称

| 名称     | URL                             | 请求数据                                                     | 可能返回数据                                                 |
| -------- | ------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
|          | /classify/classifyOfStore       | store_id                                                     | {success:true/false}<br />{"classifyList":[{},{},{}]}<br />{"store exist":false}<br />{"classify find":false} |
|          | /classify/deleteClassifyOfStore | store_id<br />classifiesToDel<br />(必有classify_name或classify_id) | {success:true/false}<br />{"store exist":false}<br />{"classify "+classify_name+" existed":false}<br />{"classify "+classify_name+" del":"cannot del"} |
|          | /classify/addClassifyOfStore    | store_id<br />classifiesToDel<br />(必有classify_name或classify_id) | {success:true/false}<br />{"store exist":false}<br /><br />{"querry error":true}<br />{"classify "+classify_name+“ existed”:false}<br /><br />{“top level ”+Top_level_classify_id+“ too high”:"should less than " +maxLevel}<br /><br />{"classify level " +Top_level_classify_id+" error":<br />"parent level is "+Top_level_classify_id}<br />{"classify "+classify_name+ " insert","error"} |
|          | /classify/modifyClassifyOfStore | store_id<br />oldGoodsClassify<br />newGoodsClassify<br />(必有classify_name或classify_id) | {success:true/false}<br />{"classify "+classify_name+“ existed”:false}<br />{"store exist":false}<br />{"new classify level " +Top_level_classify_id+" error":<br />"parent level is "+Top_level_classify_id}<br />{"modify level wrong":true}<br />{"modify top_level_classify_id wrong":true}<br />{"update "+updateColumn:"error"} |
|          | /goods/getByClassify            | store_id                                                     | {success:true/false}<br />{"goodsList":[{},{},{}]}<br />{"store exist":false}<br />{"classify find":false}<br />{"Goods find":false} |
|          | /goods/getByInfo                | store_id<br />goodsToGet(需要查找的goods信息)(默认按名称模糊检索) | {success:true/false}<br />{"goodsList":[{},{},{}]}<br />{"store exist":false}<br />{"classify find":false}<br />{"Goods find":false} |
|          | /goods/modify                   | store_id<br />oldGoods<br />newGoods<br />(必有goods_name或goods_id) | {success:true/false}<br />{"store exist":false}<br />{"goods "+goodsName+" existed":false}<br />{"update "+updateColumn:"error"}<br />{"update update_time":"error"} |
|          | /goods/del                      | store_id<br />goodsToDel(必有goods_name或goods_id)           | {success:true/false}<br />{"store exist":false}<br />{"goods "+goodsName+" existed":false}<br />{"goods "+goodsName+" del":"cannot del"}<br /> |
|          | /goods/add                      | store_id<br />goodsToAdd(必有goods_name或goods_id)           | {success:true/false}<br />{"store exist":false}<br />{"goods "+goodsName+" existed":true}<br />{"goods "+goodsName+" add":"cannot del"}<br /> |
|          | /store/getInfo                  | store_id                                                     | {success:true/false}<br />{"store exist":false}<br />{"store",storeGeted} |
|          | /store/modify                   | store_id<br />oldStore<br />newStore                         | {success:true/false}<br />{"store exist":false}<br /><br />{"update "+updateColumn:"error"}<br />{"update update_time":"error"} |
| 用户注册 | /user/addBuyer                  | 必须有<br />user_id<br />verify<br />email<br />其他选有     | {success:true/false}<br />{"user existed":false}<br />{"type not find":true}<br /> |
|          | /user/login                     | user_id<br />verify                                          | {success:true/false}<br />{"already login":true}<br />{"user existed":false}<br />{"password wrong":true}<br /> |
|          |                                 |                                                              |                                                              |
|          | /user/logout                    | user_id<br />                                                | {success:true/false}<br />{"already login":false}<br />{"user existed":false}<br /> |
|          | /user/getInfo                   | user_id                                                      | {success:true/false}<br />{"userFind":userFinded}<br />{"user existed":false}<br /> |
|          | /user/newVerify                 | user_id<br />email<br />newVerify                            | {success:true/false}<br />{"already login":false}<br />{"user existed":false}<br /><br />{"update "+updateColumn:"error"}<br />{"update update_time":"error"} |
|          | /user/drop                      |                                                              | {success:true/false}<br />{"user existed":false}<br />{"delError":true} |
|          | /user/modify                    | userOld<br />userNew<br />提交示例<br />dataSend={<br /><br />[<br />     {<br />         user_id:""<br />     },<br /><br />    {<br />         user_id:""<br />     }<br />]<br />} | {success:true/false}<br />{"user existed":false}<br />{"userType":"not find"}<br />{"data error":"not enough data"}<br />{"update "+updateColumn:"error"}<br />{"update update_time":"error"} |
|          | /user/checkPassword             | user_id<br />password                                        | 暂未实现                                                     |
|          | /user/checkIfLogin              | user_id                                                      | {"already login":true/false}<br />{success:true/false}<br /> |
|          | /user/newPicVerify              | 暂未实现                                                     |                                                              |
|          | /user/viewHistory               | user_id<br />classify_name<br />(请求全部历史请赋值"all")    | {success:true/false}<br />{"user existed":false}<br />{"classify name send":"can not be null"}<br />{"view type":"by Goods search all"}<br />{"viewedHistoryReturn":viewedHistoryReturnVOArrayList}<br />{"view type","by classify "+Classify_name+" search"}<br />{"view goods in classify "+Classify_name()+" count",count}<br />{"view classify only "+Classify_name()+" count",count}<br /> |
|          | /store/getViewedHistory         | store_id<br />classify_name<br />(请求全部历史请赋值"all")   | {success:true/false}<br />{"store exist":false}<br /><br />{"viewedHistoryReturn",[{}{}{}]} |
|          | /store/getChartOfClassify       | store_id<br />                                               | {success:true/false}<br />{"store exist":false}<br />{"classifyMap",[{}{}{}]} |
|          |                                 |                                                              |                                                              |

注意：请求数据的名称需要和列表一致;

store_id默认请求"0000";

具体请求数据的格式请查看controller接口定义；然后按照json格式去匹配；

准备吧返回字段中的空格替换成-