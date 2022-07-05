package com.shop.mapper;

import java.util.List;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;

public interface ShopMapper {

	public List<GoodsViewVO> list(int cateCode);

	public List<GoodsViewVO> home();

	public GoodsViewVO goodsView(int gdsNum);

	public void addCart(CartVO cart);

	public List<CartListVO> cartList(String userId);

	public void deleteCart(CartVO cart);

	public void orderInfo(OrderVO order);

	public void orderInfo_Details(OrderDetailVO orderDetail);

	public void cartAllDelete(String userId);

	public List<OrderVO> orderList(OrderVO order);

	public List<OrderListVO> orderView(OrderVO order);

	public void changeGdsCnt(int gdsNum);

	public List<GoodsViewVO> goodViewCnt();

	public void orderDelete(String orderId);

	public void orderDelete1(String orderId);

}
