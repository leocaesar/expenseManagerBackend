package com.projectOne.expenseManagerBackend.repository;

import com.projectOne.expenseManagerBackend.model.Expense;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseRepository extends JpaRepository<Expense,Integer> {
    Expense findExpenseById(Integer id);
}
