package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CartListVO;
import com.shop.domain.CartVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.mapper.ShopMapper;

import lombok.Setter;

@Service
public class ShopServiceImp implements ShopService {

	@Setter(onMethod_ = @Autowired)
	private ShopMapper mapper;

	@Override
	public List<GoodsViewVO> list(int cateCode) {

		return mapper.list(cateCode);

	}

	@Override
	public List<GoodsViewVO> home() {

		return mapper.home();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) {
		return mapper.goodsView(gdsNum);
	}

	@Override
	public void addCart(CartVO cart) {
		mapper.addCart(cart);

	}

	@Override
	public List<CartListVO> cartList(String userId) {
		return mapper.cartList(userId);
	}

	@Override
	public void deleteCart(CartVO cart) {
		mapper.deleteCart(cart);

	}

	@Override
	public void orderInfo(OrderVO order) {
		mapper.orderInfo(order);

	}

	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) {
		mapper.orderInfo_Details(orderDetail);

	}

	@Override
	public void cartAllDelete(String userId) {
		mapper.cartAllDelete(userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO order) {
		return mapper.orderList(order);
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		return mapper.orderView(order);
	}

	@Override
	public void changeGdsCnt(int gdsNum) {
		mapper.changeGdsCnt(gdsNum);

	}

	@Override
	public List<GoodsViewVO> goodViewCnt() {
		return mapper.goodViewCnt();
	}

	@Override
	public void orderDelete(String orderId) {
		mapper.orderDelete(orderId);

	}

	@Override
	public void orderDelete1(String orderId) {
		mapper.orderDelete1(orderId);

	}

}
