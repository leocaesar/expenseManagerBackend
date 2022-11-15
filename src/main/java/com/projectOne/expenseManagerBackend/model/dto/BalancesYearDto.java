package com.projectOne.expenseManagerBackend.model.dto;

import java.sql.Date;

public interface BalancesYearDto {

    int getId();

    String getYear();

    String getCr_Db();

    int getNew_Amount();

    int getBalances();

}
