package com.projectOne.expenseManagerBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.projectOne.expenseManagerBackend.model.Max;
import com.projectOne.expenseManagerBackend.model.Total;
import com.projectOne.expenseManagerBackend.repository.MaxRepository;
import com.projectOne.expenseManagerBackend.repository.TotalRepository;

@RestController
@RequestMapping("api")
public class DashboardController {

	@Autowired
	private TotalRepository totalRepository;
	
	@Autowired
	private MaxRepository maxRepository;
	
	@GetMapping("/total_income")
	public List<Total> getTotalIncome() {
		return totalRepository.getIncomeTotal(); 
		
	}
	
	@GetMapping("/total_expense")
	public List<Total> getTotalExpense() {
		return totalRepository.getExpenseTotal(); 
		
	}
	
	@GetMapping("/max_income")
	public List<Max> maxIncome() {
		return maxRepository.getMaxIncome(); 
		
	}
	
	@GetMapping("/max_expense")
	public List<Max> maxExpense() {
		return maxRepository.getMaxExpense(); 
		
	}
}
