package com.projectOne.expenseManagerBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.projectOne.expenseManagerBackend.config.SecurityConfiguration;
import com.projectOne.expenseManagerBackend.model.User;
import com.projectOne.expenseManagerBackend.repository.UsersRepository;
import com.projectOne.expenseManagerBackend.service.UserService;


@RestController
@RequestMapping("api")
public class UserController {
	@Autowired
	@Qualifier("userServiceJPA")
	private UserService userService;

	@Autowired
	private UsersRepository usersRepository;
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
//	@Autowired
//	private SecurityConfiguration securityConfiguration;

	@GetMapping("/users")
	@ResponseStatus(HttpStatus.OK)
	public List<User> findAll() {
		return usersRepository.findAll();
	}

	@GetMapping("/users/{id}")
	@ResponseStatus(HttpStatus.OK)
	public User findUserById(@PathVariable("id") int id) {
		return usersRepository.findUserById(id);
	}

	@PostMapping("/register")
	@ResponseStatus(HttpStatus.OK)
	public User addUser(@RequestBody User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setEnabled(true);
		user.setRole("user");
		return usersRepository.save(user);
	}

	@PutMapping("/users/{id}")
	@ResponseStatus(HttpStatus.OK)
	public User updateUser(@RequestBody User user,@PathVariable("id") int id) {
		user.setId(id);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setEnabled(true);
		user.setRole("user");
		return usersRepository.save(user);
	}

	@DeleteMapping("/users/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void deleteIncomeCategories(@PathVariable("id") int id) {
		usersRepository.deleteById(id);
	}
}
