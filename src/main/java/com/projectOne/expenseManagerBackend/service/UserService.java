package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import com.projectOne.expenseManagerBackend.model.User;

public interface UserService {

	void insert(User user);

	void update(User user);

	void delete(User user);

	User findUser(User user);

	List<User> allUser();

	List<User> allUserPage(int page, int size);
	
}
