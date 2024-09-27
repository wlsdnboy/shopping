package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.MemberVO;
import com.shop.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public void register(MemberVO vo) {
		log.info("member");
		mapper.memberRegister(vo);
	}

	@Override
	public MemberVO read(String userid) {
		return mapper.read(userid);
	}

	@Override
	public void updateMember(MemberVO vo) {
		mapper.updateMember(vo);

	}

	@Override
	public void deleteMember(MemberVO vo) {
		mapper.deleteMember(vo);

	}

	@Override
	public int idCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		int cnt = mapper.idCheck(vo);
		return cnt;
	}

}
