package com.projectOne.expenseManagerBackend.controller;

import com.projectOne.expenseManagerBackend.model.ExpenseCategories;
import com.projectOne.expenseManagerBackend.repository.ExpenseCategoriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("api")
public class ExpenseCategoriesController {

    @Autowired
    ExpenseCategoriesRepository expenseCategoriesRepository;

    @GetMapping("/expensecategories")
    @ResponseStatus(HttpStatus.OK)
    public List<ExpenseCategories> getAllExpenseCategories(){
        return expenseCategoriesRepository.findAll();
    }

    @GetMapping("/expensecategories/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ExpenseCategories getExpenseCategories(@PathVariable("id") int id){
        return expenseCategoriesRepository.findExpenseCategoriesById(id);
    }

    @PostMapping("/expensecategories")
    @ResponseStatus(HttpStatus.OK)
    public ExpenseCategories addExpenseCategories(@RequestBody ExpenseCategories expenseCategories) {
        return expenseCategoriesRepository.save(expenseCategories);
    }
    
    @PutMapping("/expensecategories/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ExpenseCategories updateExpenseCategories(@RequestBody ExpenseCategories expenseCategories, @PathVariable("id") int id) {
        return expenseCategoriesRepository.save(expenseCategories);
    }

    @DeleteMapping("/expensecategories/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteExpenseCategories(@PathVariable("id") int id) {
        expenseCategoriesRepository.deleteById(id);
    }

}
