package com.shop.service;

import java.util.List;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;

public interface CategoryService {
	public List<CategoryVO> category();

	public void register(GoodsVO vo);

	public List<GoodsViewVO> goodslist();

	public GoodsViewVO goodsView(int gdsNum);

	public void goodsModify(GoodsVO vo);

	public void goodsDelete(int gdsNum);

	public List<OrderVO> orderList();

	public List<OrderListVO> orderView(OrderVO order);

	public void delivery(OrderVO order);

	public void changeStock(GoodsVO goods);

	public List<MemberVO> getMemberList();

	public void memberUpdate(MemberVO vo);

	public List<MemberVO> getMember(MemberVO vo);

	public void deleteMember(MemberVO vo);

	public MemberVO read(String userid);

}
