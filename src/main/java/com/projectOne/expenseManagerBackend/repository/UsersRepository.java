package com.projectOne.expenseManagerBackend.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.projectOne.expenseManagerBackend.model.User;

public interface UsersRepository extends JpaRepository<User, Integer> {

	User findUserById(Integer aInteger);
	
	User findByUsername(String username); 
	
	Page<User> findAllByOrderByUsername(Pageable pageable);

	List<User> findAllByOrderByUsername();

}
