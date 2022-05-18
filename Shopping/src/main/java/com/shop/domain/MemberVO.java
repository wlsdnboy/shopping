package com.shop.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String useremail;
	private String useraddress;
	private String userphoneNumber;
	private boolean enable;
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
}
