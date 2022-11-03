package com.example.expenseManagerBackend.repository;

import com.example.expenseManagerBackend.model.Expense;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpenseRepository extends JpaRepository<Expense,Integer> {
    Expense findExpenseById(Integer id);
}
