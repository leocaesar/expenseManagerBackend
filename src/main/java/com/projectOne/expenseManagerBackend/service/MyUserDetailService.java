package com.projectOne.expenseManagerBackend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.projectOne.expenseManagerBackend.model.MyUserDetail;
import com.projectOne.expenseManagerBackend.model.User;
import com.projectOne.expenseManagerBackend.repository.UsersRepository;

public class MyUserDetailService implements UserDetailsService {

	@Autowired
	private UsersRepository usersRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = usersRepository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("No user found!");
		}
		return new MyUserDetail(user);
	}
	
}
