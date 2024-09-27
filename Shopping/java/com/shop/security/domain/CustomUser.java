package com.shop.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.shop.domain.MemberVO;

public class CustomUser extends User {
	private static final long serialVersionUID = 1L;
	private MemberVO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

	

	public CustomUser(MemberVO vo) {

		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = vo;
	}
}
