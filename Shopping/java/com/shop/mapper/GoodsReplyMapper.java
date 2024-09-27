package com.shop.mapper;

import com.shop.domain.GoodsReply;

public interface GoodsReplyMapper {

	public int insert(GoodsReply vo);

	public GoodsReply read(Long rno);

	public int delete(Long rno);

	public int update(GoodsReply reply);

}
