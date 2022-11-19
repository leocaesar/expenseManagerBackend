package com.projectOne.expenseManagerBackend.controller;

import com.projectOne.expenseManagerBackend.model.Expense;
import com.projectOne.expenseManagerBackend.repository.ExpenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("api")
public class ExpenseController {

    @Autowired
    ExpenseRepository expenseRepository;

    @GetMapping("/expenses")
    @ResponseStatus(HttpStatus.OK)
    public List<Expense> getAllExpense(){

        return expenseRepository.findAll();
    }

    @GetMapping("/expenses/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Expense getExpense(@PathVariable("id") int id){
        return expenseRepository.findExpenseById(id);
    }

    @PostMapping("/expenses")
    @ResponseStatus(HttpStatus.OK)
    public Expense addExpense(@RequestBody Expense expense) {
        return expenseRepository.save(expense);
    }
    
    @PutMapping("/expenses/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Expense updateExpense(@RequestBody Expense expense, @PathVariable("id") int id) {
        return expenseRepository.save(expense);
    }
    
    @DeleteMapping("/expenses/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteExpense(@PathVariable("id") int id) {
        expenseRepository.deleteById(id);
    }

}
