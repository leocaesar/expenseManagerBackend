package com.projectOne.expenseManagerBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.projectOne.expenseManagerBackend.model.Income;
import com.projectOne.expenseManagerBackend.repository.IncomeRepository;
import com.projectOne.expenseManagerBackend.service.IncomeService;


@RestController
@RequestMapping("api")
public class IncomeController {

	@Autowired
	@Qualifier("incomeServiceJPA")
	private IncomeService incomeService;

	@Autowired
	private IncomeRepository incomeRepository;

	@GetMapping("/income")
	@ResponseStatus(HttpStatus.OK)
	public List<Income> findAll() {
		return incomeRepository.findAll();
	}

	@GetMapping("/income/{id}")
	@ResponseStatus(HttpStatus.OK)
	public Income findIncomeById(@PathVariable("id") int id) {
		return incomeRepository.findIncomeById(id);
	}

	@PostMapping("/income")
	@ResponseStatus(HttpStatus.OK)
	public Income addIncome(@RequestBody Income income) {
		return incomeRepository.save(income);
	}

	@PutMapping("/income/{id}")
	@ResponseStatus(HttpStatus.OK)
	public Income updateIncome(@RequestBody Income income,
			@PathVariable("id") int id) {
		income.setId(id);
		return incomeRepository.save(income);
	}

	@DeleteMapping("/income/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void deleteIncomeCategories(@PathVariable("id") int id) {
		incomeRepository.deleteById(id);
	}
	
}
