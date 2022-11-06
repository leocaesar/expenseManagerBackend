package com.projectOne.expenseManagerBackend.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.projectOne.expenseManagerBackend.model.IncomeCategories;


public interface IncomeCategoriesRepository extends JpaRepository<IncomeCategories,Integer> {
	
	IncomeCategories findIncomeCategoriesById(Integer aInteger);
	
	List<IncomeCategories> findAllByOrderByName();
	
	Page<IncomeCategories> findAllByOrderByName(Pageable pageable);

}
