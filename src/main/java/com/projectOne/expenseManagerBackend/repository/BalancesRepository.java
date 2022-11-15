package com.projectOne.expenseManagerBackend.repository;

import com.projectOne.expenseManagerBackend.model.User;
import com.projectOne.expenseManagerBackend.model.dto.BalancesDto;
import com.projectOne.expenseManagerBackend.model.dto.BalancesMonthDto;
import com.projectOne.expenseManagerBackend.model.dto.BalancesYearDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BalancesRepository extends JpaRepository<User,Integer> {

    @Query( nativeQuery = true,
            value = "select * from balances"
    )
     List<BalancesDto> getBalancesDto();

    @Query( nativeQuery = true,
            value = "select * from balances_month"
    )
     List<BalancesMonthDto> getBalancesMonthDto();

    @Query( nativeQuery = true,
            value = "select * from balances_year"
    )
     List<BalancesYearDto> getBalancesYearDto();


}
