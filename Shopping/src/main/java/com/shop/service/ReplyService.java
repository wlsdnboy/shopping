package com.shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.domain.Criteria;
import com.shop.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int remove(Long rno);

	public int modify(ReplyVO reply);

	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);

}
