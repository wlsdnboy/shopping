package com.shop.service;

import com.shop.domain.GoodsReply;

public interface GoodsReplyService {
	public int register(GoodsReply vo);

	public GoodsReply get(Long rno);

	public int remove(Long rno);

	public int modify(GoodsReply reply);

}
