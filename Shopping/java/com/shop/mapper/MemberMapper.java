package com.shop.mapper;

import com.shop.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String userid);

	public void memberRegister(MemberVO vo);

	public void updateMember(MemberVO vo);

	public void deleteMember(MemberVO vo);

	public int idCheck(MemberVO vo);
}
