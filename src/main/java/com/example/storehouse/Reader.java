package com.example.storehouse;

import java.util.Random;
import java.lang.String;

public class Reader {

	private static int count = 0;
	private String Name;
	private int Number_of_library_card;
	private String Contact_information;

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

	public Reader(String name, String contact_information)
	{
		this.Number_of_library_card = ++count;
		this.Name = name;
		this.Contact_information = contact_information;
	}

	public Reader()
	{
		Number_of_library_card = ++count;
		Name = randomSymbols();
		Contact_information = randomSymbols()+"@mail.ru";
	}

	public int getId() {
		return Number_of_library_card;
	}

	public String get_Name() {
		return Name;
	}

	public String get_Contact_information() {
		return Contact_information;
	}

	public void set_Name(String name) {
		this.Name = name;
	}

	public void set_Contact_information(String contact_information) {
		this.Contact_information = contact_information;
	}

}