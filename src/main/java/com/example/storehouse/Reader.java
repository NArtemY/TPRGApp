package com.example.storehouse;

import java.util.Random;
import java.lang.String;

public class Reader {

	private static int count = 0;
	private String Name;
	private int Number_of_library_card;
	private String Contact_information;
	private String History_of_books;

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

	public Reader(String name, String contact_information, String history)
	{
		this.Number_of_library_card = ++count;
		this.Name = name;
		this.Contact_information = contact_information;
		this.History_of_books = history;
	}

	public Reader()
	{
		Number_of_library_card = ++count;
		Name = randomSymbols();
		email=randomSymbols();
		Contact_information = randomSymbols()+"@mail.ru";
		History_of_books = randomSymbols();
	}

	public String get_History() {
		return History_of_books;
	}

	public String get_Name() {
		return Name;
	}

	public String get_Contact_information() {
		return Contact_information;
	}

	public void set_Name(string name) {
		this.Name = name;
	}

	public void set_Contact_information(string contact_information) {
		this.Contact_information = contact_information
	}

	public void set_History_of_books(string newBook) {
		this.History_of_books = this.History_of_books + newBook;
	}

}