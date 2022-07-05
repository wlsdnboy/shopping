package com.shop.service;

import com.shop.domain.MemberVO;

public interface MemberService {

	public MemberVO read(String userid);

	public void register(MemberVO vo);

	public void updateMember(MemberVO vo);

	public void deleteMember(MemberVO vo);
	
	public int idCheck(MemberVO vo);

}
