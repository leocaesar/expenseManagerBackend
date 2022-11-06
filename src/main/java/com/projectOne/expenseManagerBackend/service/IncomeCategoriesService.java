package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import com.projectOne.expenseManagerBackend.model.IncomeCategories;

public interface IncomeCategoriesService {

	void insert(IncomeCategories incomeCategories);

	void update(IncomeCategories incomeCategories);

	void delete(IncomeCategories incomeCategories);

	IncomeCategories findIncomeCategories(IncomeCategories incomeCategories);

	List<IncomeCategories> allIncomeCategories();

	List<IncomeCategories> allIncomeCategoriesPage(int page, int size);
	
}
