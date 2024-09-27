package com.shop.domain;

import lombok.Data;

@Data
public class OrderDetailVO {

	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
}
	