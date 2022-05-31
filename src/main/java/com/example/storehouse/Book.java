package com.example.storehouse;

import java.util.Random;

public class Book {

	public static int count = 0;
	private int id_Book;
	private String Name;
	private String Author;
	private String Publisher;
	private String Other_information;
	private int Number_of_copies;
	private int Number_of_available_books;
	private String History_of_delivery;

	public int getId() {
		return id_Book;
	}

	public String get_Name() {
		return Name;
	}

	public String get_Author() {
		return Author;
	}

	public String get_Publisher() {
		return Publisher;
	}

	public String get_Other_information() {
		return Other_information;
	}

	public int get_Number_of_copies() {
		return Number_of_copies;
	}

	public int get_Number_of_available_books() {
		return Number_of_available_books;
	}

	public String get_History() {
		return History_of_delivery;
	}

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

	public Book(String Name, String Author, String Publisher, String Other_information, int Number_of_copies, int Number_of_available_books, String History_of_delivery){
		this.id_Book = ++count;
		this.Name = Name;
		this.Author = Author;
		this.Publisher = Publisher;
		this.Other_information = Other_information;
		this.Number_of_copies = Number_of_copies;
		this.Number_of_available_books = Number_of_available_books;
		this.History_of_delivery = History_of_delivery;
	}

	public Book(){
		id_Book = ++count;
		Name = randomSymbols();
		Author = randomSymbols();
		Publisher = randomSymbols();
		Other_information = randomSymbols();
		Number_of_copies = id_Book / 2 + 1;
		Number_of_available_books = id_Book % 4;
		History_of_delivery = randomSymbols();
	}

	public void set_Other_information(String info) {
		this.Other_information = this.Other_information + info;
	}

	public void set_Number_of_copies(int num) {
		this.Number_of_copies = num;
	}

	public void set_Number_of_available_books(int num) {
		this.Number_of_available_books = num;
	}

	public void set_History(String history) {
		this.History_of_delivery = this.History_of_delivery + history;
	}

}