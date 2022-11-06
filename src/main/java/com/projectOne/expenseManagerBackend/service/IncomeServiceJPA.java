package com.projectOne.expenseManagerBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.projectOne.expenseManagerBackend.model.Income;
import com.projectOne.expenseManagerBackend.repository.IncomeRepository;

@Service
public class IncomeServiceJPA implements IncomeService {
	@Autowired
	 IncomeRepository incomeRepository;
	
	@Override
	@Transactional
	public void insert(Income income) {
		// TODO Auto-generated method stub
		incomeRepository.save(income);
	}

	@Override
	public void update(Income income) {
		// TODO Auto-generated method stub
		incomeRepository.save(income);
	}

	@Override
	public void delete(Income income) {
		// TODO Auto-generated method stub
		incomeRepository.deleteById(income.getId());
	}

	@Override
	public Income findIncome(Income income) {
		// TODO Auto-generated method stub
		return incomeRepository.findIncomeById(income.getId());
	}

	@Override
	public List<Income> allIncome() {
		// TODO Auto-generated method stub
		return incomeRepository.findAllByOrderByDescription();
	}

	@Override
	public List<Income> allIncomePage(int page, int size) {
		// TODO Auto-generated method stub
		Pageable pageable = PageRequest.of(page, size);
		return incomeRepository.findAll(pageable).getContent();
	}

}
