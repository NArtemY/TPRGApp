package com.example.storehouse;

import java.util.Random;

public class History{
	private String startDate;
	private String endDate;
	private String reader;
	private String history;
	
	public History(String startDate,String endDate,String reader){
		this.startDate = startDate;
		this.endDate=endDate;
		this.reader=reader;
		this.history = this.history + startDate + reader + endDate;
	}
	
	public History(){
		startDate = "";
		endDate= "";
		reader= "";
		history= "";
	}

	public void setStartDate(String date, String name){
		this.startDate = date;
		this.history = this.history + date + name;
	}

	public void setEndDate(String date, String name){
		this.endDate = date;
		this.history = this.history + date + name;
	}

	public String getHistory(){
		return history;
	}

}