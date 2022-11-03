package com.example.expenseManagerBackend.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Getter
@Setter
@Entity
@Table(name = "expense")
public class Expense {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "date")
    private Timestamp date;

    @Column(name = "description")
    private String description;

    @Column(name = "amount")
    private int amount;

    @ManyToOne
    @JoinColumn(name = "category_expense")
    private ExpenseCategories expenseCategories;

}
