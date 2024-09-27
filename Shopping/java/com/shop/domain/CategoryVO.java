package com.shop.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class CategoryVO {

	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private int level;
}
