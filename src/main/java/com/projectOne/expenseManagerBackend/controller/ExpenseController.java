package com.projectOne.expenseManagerBackend.controller;

import com.projectOne.expenseManagerBackend.model.Expense;
import com.projectOne.expenseManagerBackend.repository.ExpenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api")
public class ExpenseController {

    @Autowired
    ExpenseRepository expenseRepository;

    @GetMapping("/expenses")
    public List<Expense> getAllExpense(){

        return expenseRepository.findAll();
    }

    @GetMapping("/expenses/{id}")
    public Expense getExpense(@PathVariable("id") int id){
        return expenseRepository.findExpenseById(id);
    }
}
