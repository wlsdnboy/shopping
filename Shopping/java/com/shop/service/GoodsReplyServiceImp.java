package com.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.GoodsReply;
import com.shop.mapper.GoodsReplyMapper;

import lombok.Setter;

@Service
public class GoodsReplyServiceImp implements GoodsReplyService {

	@Setter(onMethod_ = @Autowired)
	private GoodsReplyMapper mapper;

	@Override
	public int register(GoodsReply vo) {
		return mapper.insert(vo);
	}

	@Override
	public GoodsReply get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		return mapper.delete(rno);
	}

	@Override
	public int modify(GoodsReply reply) {
		return mapper.update(reply);
	}

}
