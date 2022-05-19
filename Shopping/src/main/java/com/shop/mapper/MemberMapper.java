package com.shop.mapper;

import com.shop.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);

	public void memberRegister(MemberVO vo);
}
