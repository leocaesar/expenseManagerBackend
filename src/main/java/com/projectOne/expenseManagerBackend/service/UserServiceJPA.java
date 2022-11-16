package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projectOne.expenseManagerBackend.model.User;
import com.projectOne.expenseManagerBackend.repository.UsersRepository;

@Service
public class UserServiceJPA implements UserService {
	@Autowired
	UsersRepository usersRepository;
	
	@Override
	@Transactional
	public void insert(User user) {
		// TODO Auto-generated method stub
		usersRepository.save(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		usersRepository.save(user);
		
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		usersRepository.deleteById(user.getId());
		
	}

	@Override
	public User findUser(User user) {
		// TODO Auto-generated method stub
		return usersRepository.findUserById(user.getId());
	}

	@Override
	public List<User> allUser() {
		// TODO Auto-generated method stub
		return usersRepository.findAllByOrderByUsername();
	}

	@Override
	public List<User> allUserPage(int page, int size) {
		// TODO Auto-generated method stub
		Pageable pageable = PageRequest.of(page, size);
		return usersRepository.findAll(pageable).getContent();
	}

}
