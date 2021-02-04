package com.capstone.service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.capstone.dao.AdminDAO;
import com.capstone.model.Admin;

@Service
public class JwtUserDetailsService implements UserDetailsService {

	@Autowired
	private PasswordEncoder bCrypt;
	@Autowired
	private AdminDAO adminDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<Admin> adminOpt = adminDao.findOneByUsername(username);
		if (adminOpt.isPresent()) {
			Admin admin = adminOpt.get();
			Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
			return new org.springframework.security.core.userdetails.User(admin.getUsername(), bCrypt.encode(admin.getPassword()),
					grantedAuthorities);
		} else {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}
	}
}
