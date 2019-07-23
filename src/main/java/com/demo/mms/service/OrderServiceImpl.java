package com.demo.mms.service;

import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.MailingInfo;
import com.demo.mms.common.domain.Order;
import com.demo.mms.common.domain.OrderEntry;
import com.demo.mms.dao.*;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;
    private final MailingInfoMapper mailingInfoMapper;
    private final OrderEntryMapper orderEntryMapper;
    private final InCartOfMapper inCartOfMapper;
    private final GoodsOperateMapper goodsOperateMapper;

    public OrderServiceImpl(OrderMapper orderMapper, MailingInfoMapper mailingInfoMapper, OrderEntryMapper orderEntryMapper, InCartOfMapper inCartOfMapper, GoodsOperateMapper goodsOperateMapper) {
        this.orderMapper = orderMapper;
        this.mailingInfoMapper = mailingInfoMapper;
        this.orderEntryMapper = orderEntryMapper;
        this.inCartOfMapper = inCartOfMapper;
        this.goodsOperateMapper = goodsOperateMapper;
    }

    @Override
    public Collection<Order> createOrderFromShoppingCart(List<String> shoppingCartRelationIds, String consignee, String phone, String address, String postcode) throws Exception {

        // 获取 user id
        String userId = inCartOfMapper.selectById(shoppingCartRelationIds.get(0)).getUserId();

        // 根据商品所在店家分单
        Map<String, List<String>> orderMap = new HashMap<>();
        for (String relation_id : shoppingCartRelationIds) {
            InCartOf relation = inCartOfMapper.selectById(relation_id);
            String goodsId = relation.getGoodsId();
            String storeId = goodsOperateMapper.getGoodById(goodsId).getStore_id();
            if (!orderMap.containsKey(storeId)) {
                orderMap.put(storeId, new ArrayList<>());
            }
            orderMap.get(storeId).add(goodsId);
        }

        // 建立所有 Order
        List<Order> orders = new ArrayList<>();
        for (String storeId : orderMap.keySet()) {
            Order order = new Order(
                    UUID.randomUUID().toString().replace("-", ""),
                    userId,
                    storeId,
                    "",
                    0,
                    consignee,
                    phone,
                    address,
                    postcode,
                    "",
                    "",
                    new Date(),
                    new Date()
            );
            orders.add(order);
            orderMapper.save(order);
        }

        // 建立 OrderEntries
        for (Order order : orders) {
            String storeId = order.getStoreId();
            List<String> relationIds = orderMap.get(storeId);
            for (String relationId : relationIds) {
                InCartOf relation = inCartOfMapper.selectById(relationId);
                OrderEntry entry = new OrderEntry(
                        UUID.randomUUID().toString().replace("-", ""),
                        relation.getGoodsId(),
                        relation.getNumber(),
                        goodsOperateMapper.getGoodById(relation.getGoodsId()).getPrice()
                );
                orderEntryMapper.save(entry);
            }
        }
        return orders;
    }

    @Override
    public Collection<Order> getAll() throws Exception {
        return orderMapper.selectAll();
    }

    @Override
    public Collection<Order> getAllOfBuyer(String buyerId) throws Exception {
        return null;
    }

    @Override
    public Collection<Order> getAllOfStore(String storeId) throws Exception {
        return null;
    }

    @Override
    public Order[] getMostRecentTenOrder(String storeId) throws Exception {
        // TODO: 检查一下能不能这么做类型转换。。
        return (Order[]) Arrays.copyOfRange(orderMapper.selectAll().
                parallelStream().
                sorted(Comparator.comparing(Order::getCreateTime)).toArray(), 0, 10);
    }

    @Override
    public String createOrder(String buyerId, Map<String, Integer> goodsIdAndCorrespondingNumbers, MailingInfo mailingInfo, String note) throws Exception {
        return null;
    }

    @Override
    public void makePaid(String orderEntryId) throws Exception {

    }

    @Override
    public void setExpressCompany(String orderEntryId, String expressCompanyId) throws Exception {

    }

    @Override
    public void makeSigned(String orderEntryId) throws Exception {
    }

    @Override
    public Map<String, Integer> getOrderStatTotal(String storeId) throws Exception {
        Map<String, Integer> result = new HashMap<>();
        Collection<Order> orders = orderMapper.selectAllByStoreId(storeId);
        int[] stat = new int[6];
        for (Order order : orders) {
            stat[order.getStep()] += 1;
        }
        result.put("booked", stat[0]);
        result.put("paid", stat[1]);
        result.put("delivering", stat[2]);
        result.put("received", stat[3]);
        result.put("reviewed", stat[4]);
        return result;
    }

    @Override
    public void proceed(String orderId) throws Exception {
        Order order = orderMapper.selectById(orderId);
        if (order.getStep() == 4) {
            throw new Exception("assertion failed: order.step < 4");
        }
        orderMapper.updateStepTo(orderId, order.getStep() + 1);
    }

    @Override
    public void updateExpressInfo(String orderId, String express_code, String express_company_id) throws Exception {
        Order order = orderMapper.selectById(orderId);

    }
}
