package com.demo.mms.service;

import com.demo.mms.common.domain.InCartOf;
import com.demo.mms.common.domain.Order;
import com.demo.mms.common.domain.OrderEntry;
import com.demo.mms.dao.*;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;
    private final OrderEntryMapper orderEntryMapper;
    private final InCartOfMapper inCartOfMapper;
    private final GoodsOperateMapper goodsOperateMapper;
    private final ExpressMapper expressMapper;

    public OrderServiceImpl(OrderMapper orderMapper, OrderEntryMapper orderEntryMapper, InCartOfMapper inCartOfMapper, GoodsOperateMapper goodsOperateMapper, ExpressMapper expressMapper) {
        this.orderMapper = orderMapper;
        this.orderEntryMapper = orderEntryMapper;
        this.inCartOfMapper = inCartOfMapper;
        this.goodsOperateMapper = goodsOperateMapper;
        this.expressMapper = expressMapper;
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
            orderMap.get(storeId).add(relation_id);
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
                        order.getId(),
                        relation.getGoodsId(),
                        relation.getNumber(),
                        goodsOperateMapper.getGoodById(relation.getGoodsId()).getPrice(),
                        "");
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
    public Order[] getMostRecentTenOrder(String storeId) throws Exception {
        return (Order[]) Arrays.copyOfRange(orderMapper.selectAll().
                parallelStream().
                sorted(Comparator.comparing(Order::getCreateTime)).toArray(), 0, 10);
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
        if (order == null) {
            throw new Exception("invalid order id!");
        }
        String expressId = UUID.randomUUID().toString().replace("-", "");
        expressMapper.insertExpress(expressId, express_company_id, express_code);
        orderMapper.updateExpressId(orderId, expressId);
    }

    public void deleteOrder(String orderId) throws Exception {
        Order order = orderMapper.selectById(orderId);
        if (order == null) {
            throw new Exception("invalid order id!");
        }
        expressMapper.deleteExpress(order.getExpressId());
        orderMapper.deleteOrder(orderId);
    }

    @Override
    public Collection<Order> select(String user_id, String store_id) throws Exception {
        return this.getAll().stream().
                filter(order -> user_id == null || order.getUserId().equals(user_id)).
                filter(order -> store_id == null || order.getStoreId().equals(store_id)).
                collect(Collectors.toList());
    }
}
