package com.projectOne.expenseManagerBackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.projectOne.expenseManagerBackend.model.User;

public interface UsersRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username); 

}
