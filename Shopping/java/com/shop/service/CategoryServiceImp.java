package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.GoodsViewVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderListVO;
import com.shop.domain.OrderVO;
import com.shop.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j // lombok 로그 이용.
@Service // 이 클래스가 서비스 계층을 맡는다고 알림.
@AllArgsConstructor // 모든 매개변수에 대한 생성자 생성.(생성자 여러개 아님)
public class CategoryServiceImp implements CategoryService {

	@Setter(onMethod_ = @Autowired)
	AdminMapper mapper;

	@Override
	public List<CategoryVO> category() {
		return mapper.category();
	}

	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);
	}

	@Override
	public List<GoodsViewVO> goodslist() {
		return mapper.goodslist();
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) {
		return mapper.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsVO vo) {
		mapper.goodsModify(vo);

	}

	@Override
	public void goodsDelete(int gdsNum) {

		mapper.goodsDelete(gdsNum);

	}

	@Override
	public List<OrderVO> orderList() {
		return mapper.orderList();
	}

	@Override
	public List<OrderListVO> orderView(OrderVO order) {
		return mapper.orderView(order);
	}

	@Override
	public void delivery(OrderVO order) {
		mapper.delivery(order);

	}

	@Override
	public void changeStock(GoodsVO goods) {
		mapper.changeStock(goods);
	}

	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return mapper.getMemberList();
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		mapper.memberUpdate(vo);
	}

	@Override
	public List<MemberVO> getMember(MemberVO vo) {
		return mapper.getMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		mapper.deleteMember(vo);
	}

	@Override
	public MemberVO read(String userid) {
		return mapper.read(userid);
	}

}
