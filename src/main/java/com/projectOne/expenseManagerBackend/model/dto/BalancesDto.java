package com.projectOne.expenseManagerBackend.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

public interface BalancesDto {

    int getId();

    Timestamp getDate();

    String getCr_Db();

    int getNew_Amount();

    int getBalances();

    String getName();

    String getDescription();
}
