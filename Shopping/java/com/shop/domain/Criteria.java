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
	private String type; // 검색 타입. 내용+제목+작성자
	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		// 검색타입 배열 가져오기

		return type == null ? new String[] {} : type.split("");
		// 검색타입이 널이라면 새로운 문자열 배열을 만들고
		// 그렇지 않다면 검색타입을 한글자씩 잘라서 문자열 배열로 만듦

	}

	

}
