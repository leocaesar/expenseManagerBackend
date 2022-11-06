package com.projectOne.expenseManagerBackend.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.projectOne.expenseManagerBackend.model.Income;

public interface IncomeRepository extends JpaRepository<Income, Integer> {

	Income findIncomeById(Integer aInteger);

	List<Income> findAllByOrderByDescription();

	Page<Income> findAllByOrderByDescription(Pageable pageable);

}
