package com.projectOne.expenseManagerBackend.controller;

import com.projectOne.expenseManagerBackend.model.Expense;
import com.projectOne.expenseManagerBackend.model.dto.BalancesDto;
import com.projectOne.expenseManagerBackend.model.dto.BalancesMonthDto;
import com.projectOne.expenseManagerBackend.model.dto.BalancesYearDto;
import com.projectOne.expenseManagerBackend.repository.BalancesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("api")
public class BalancesController {

    @Autowired
    BalancesRepository balancesRepository;

    @GetMapping("/balances")
    @ResponseStatus(HttpStatus.OK)
    public List<BalancesDto> getAllBalances() {
        return balancesRepository.getBalancesDto();
    }

    @GetMapping("/balances_month")
    @ResponseStatus(HttpStatus.OK)
    public List<BalancesMonthDto> getAllBalancesMonth() {
        return balancesRepository.getBalancesMonthDto();
    }

    @GetMapping("/balances_year")
    @ResponseStatus(HttpStatus.OK)
    public List<BalancesYearDto> getAllBalancesYear() {
        return balancesRepository.getBalancesYearDto();
    }
}
