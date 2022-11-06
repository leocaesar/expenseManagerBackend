package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import com.projectOne.expenseManagerBackend.model.Income;

public interface IncomeService {

	void insert(Income income);

	void update(Income income);

	void delete(Income income);

	Income findIncome(Income income);

	List<Income> allIncome();

	List<Income> allIncomePage(int page, int size);
	
}
