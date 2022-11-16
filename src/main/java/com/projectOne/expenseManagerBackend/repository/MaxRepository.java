package com.projectOne.expenseManagerBackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.projectOne.expenseManagerBackend.model.Max;

public interface MaxRepository extends JpaRepository<Max,Integer> {
	@Query(value = "SELECT id,date,description,MAX(amount) as amount FROM income WHERE MONTH(date) = MONTH(CURRENT_DATE())", nativeQuery = true)
	List<Max> getMaxIncome (); 
	
	@Query(value = "SELECT id,date,description,MAX(amount) as amount FROM expense WHERE MONTH(date) = MONTH(CURRENT_DATE())", nativeQuery = true)
	List<Max> getMaxExpense (); 
}
