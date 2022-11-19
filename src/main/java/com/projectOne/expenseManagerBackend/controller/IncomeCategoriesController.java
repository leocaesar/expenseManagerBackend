package com.projectOne.expenseManagerBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.projectOne.expenseManagerBackend.model.IncomeCategories;
import com.projectOne.expenseManagerBackend.repository.IncomeCategoriesRepository;
import com.projectOne.expenseManagerBackend.service.IncomeCategoriesService;

@CrossOrigin
@RestController
@RequestMapping("api")
public class IncomeCategoriesController {

	@Autowired
	@Qualifier("incomeCategoriesServiceJPA")
	private IncomeCategoriesService incomeCategoriesService;

	@Autowired
	private IncomeCategoriesRepository incomeCategoriesRepository;

	@GetMapping("/income-categories")
	@ResponseStatus(HttpStatus.OK)
	public List<IncomeCategories> findAll() {
		return incomeCategoriesRepository.findAll();
	}

	@GetMapping("/income-categories/{id}")
	@ResponseStatus(HttpStatus.OK)
	public IncomeCategories findIncomeCategoriesById(@PathVariable("id") int id) {
		return incomeCategoriesRepository.findIncomeCategoriesById(id);
	}

	@PostMapping("/income-categories")
	@ResponseStatus(HttpStatus.OK)
	public IncomeCategories addIncomeCategories(@RequestBody IncomeCategories incomeCategories) {
		return incomeCategoriesRepository.save(incomeCategories);
	}

	@PutMapping("/income-categories/{id}")
	@ResponseStatus(HttpStatus.OK)
	public IncomeCategories updateIncomeCategories(@RequestBody IncomeCategories incomeCategories,
			@PathVariable("id") int id) {
		incomeCategories.setId(id);
		return incomeCategoriesRepository.save(incomeCategories);
	}

	@DeleteMapping("/income-categories/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void deleteIncomeCategories(@PathVariable("id") int id) {
		incomeCategoriesRepository.deleteById(id);
	}
}
