package com.projectOne.expenseManagerBackend.repository;

import com.projectOne.expenseManagerBackend.model.ExpenseCategories;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseCategoriesRepository extends JpaRepository<ExpenseCategories, Integer> {
    ExpenseCategories findExpenseCategoriesById(Integer id);
}
