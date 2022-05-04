package com.shop.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	// 페이지당 게시물 수와 현재 선택한 페이지 번호를 저장할 Criteria 구현

	private int pageNum; // 현재 페이지 번호
	private int amount; // 페이지당 게시물수

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
