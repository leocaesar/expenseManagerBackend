package com.projectOne.expenseManagerBackend.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "income")
public class Income {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private int id;
	@Column(name = "date")
    private String date;
	@Column(name = "description")
    private String description;
	@Column(name = "amount")
    private Integer amount;
	@Column(name = "category_income")
    private Integer category_income;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getCategory_income() {
		return category_income;
	}
	public void setCategory_income(Integer category_income) {
		this.category_income = category_income;
	}
	
}
