package com.shop.domain;

import lombok.Data;

@Data
public class MemberRegisterVO {
	private String userid;
	private String userpw;
	private String userName;
	private String useremail;
	private String useraddress;
	private String userphoneNumber;
}
