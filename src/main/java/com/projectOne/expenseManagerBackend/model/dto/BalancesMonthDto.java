package com.projectOne.expenseManagerBackend.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

public interface BalancesMonthDto {

    int getId();

    Date getLast_date();

    String getCr_Db();

    int getNew_Amount();

    int getBalances();
}
