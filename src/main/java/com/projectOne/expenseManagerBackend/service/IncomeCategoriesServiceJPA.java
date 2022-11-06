package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projectOne.expenseManagerBackend.model.IncomeCategories;
import com.projectOne.expenseManagerBackend.repository.IncomeCategoriesRepository;


@Service
public class IncomeCategoriesServiceJPA implements IncomeCategoriesService {
	@Autowired
	 IncomeCategoriesRepository incomeCategoriesRepository;
	
	@Override
	@Transactional
	public void insert(IncomeCategories incomeCategories) {
		// TODO Auto-generated method stub
		incomeCategoriesRepository.save(incomeCategories);
	}

	@Override
	public void update(IncomeCategories incomeCategories) {
		// TODO Auto-generated method stub
		incomeCategoriesRepository.save(incomeCategories);
		
	}

	@Override
	public void delete(IncomeCategories incomeCategories) {
		// TODO Auto-generated method stub
		incomeCategoriesRepository.deleteById(incomeCategories.getId());
		
	}

	@Override
	public IncomeCategories findIncomeCategories(IncomeCategories incomeCategories) {
		// TODO Auto-generated method stub
		return incomeCategoriesRepository.findIncomeCategoriesById(incomeCategories.getId());
	}

	@Override
	public List<IncomeCategories> allIncomeCategories() {
		// TODO Auto-generated method stub
		return incomeCategoriesRepository.findAllByOrderByName();
	}

	@Override
	public List<IncomeCategories> allIncomeCategoriesPage(int page, int size) {
		// TODO Auto-generated method stub
		Pageable pageable = PageRequest.of(page, size);
		return incomeCategoriesRepository.findAll(pageable).getContent();
	}
	
	
}
