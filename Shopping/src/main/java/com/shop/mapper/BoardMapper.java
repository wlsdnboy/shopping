package com.shop.mapper;

import java.util.List;

import com.shop.domain.BoardVO;
import com.shop.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();

	public void insert(BoardVO board);

	// bno 는 시퀀스 자동 생성으로 나머지 값만 입력.
	public void insertSelectKey(BoardVO board);

	// 생성되는 시퀀스 값을 확인하고 나머지 값 입력.
	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public List<BoardVO> getListWithPaging(Criteria cri);

}
