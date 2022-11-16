package com.projectOne.expenseManagerBackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.projectOne.expenseManagerBackend.model.Total;

public interface TotalRepository extends JpaRepository<Total,Integer>{
	@Query(value = "SELECT id,SUM(amount) as amount FROM income WHERE MONTH(date) = MONTH(CURRENT_DATE())", nativeQuery = true)
	List<Total> getIncomeTotal (); 
	
	@Query(value = "SELECT id,SUM(amount) as amount FROM expense WHERE MONTH(date) = MONTH(CURRENT_DATE())", nativeQuery = true)
	List<Total> getExpenseTotal (); 
}
