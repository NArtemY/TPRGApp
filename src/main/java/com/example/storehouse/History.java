package com.example.storehouse;

import java.util.Random;

public class History{
	private int reader;
	private String start = "";
	private String end = "";

	private String randomSymbols()
	{
		int leftLimit = 97;
		int rightLimit = 123;
		Random randStr = new Random();
		return randStr.ints(leftLimit, rightLimit)
				.limit(15)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
	}

	public History(int reader, String startDate){
		this.start = startDate;
		this.reader = reader;
	}

	public History(){
		this.start = "";
		this.end = "";
	}

    public void setEnd(String end) {
        this.end = end;
    }

    public String getStart(){
		return start;
	}

	public String getEnd(){
		return end;
	}

	public int getReader(){
		return reader;
	}
}