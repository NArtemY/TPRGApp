package com.example.storehouse;

import java.util.Random;
import java.util.ArrayList;

public class Admin {
    public static String login = "admin";
    public static String password = "admin";

    public static void addBook(String name, String bookAuthor, String bookPublisher, String bookInfo, String bookNumberCopies, String bookAvailableCopies){
        Book book = new Book(name, bookAuthor, bookPublisher, bookInfo, Integer.parseInt(bookNumberCopies), Integer.parseInt(bookAvailableCopies));
        Database.bookList.add(book);
    }
    public static void removeBook(int id){
        Database.bookList.remove(Database.getBookByID(id));
    }

    public static void addReader(String name, String contact_information){
        Reader reader = new Reader(name, contact_information);
        Database.readerList.add(reader);
    }
    public static void removeReader(int id){
        Database.readerList.remove(Database.getReaderByID(id));
    }

    public static void addHistory(String name, String reader, String date){
        for(int i=0; i<Database.bookList.size(); i++){
            if(new String(Database.bookList.get(i).get_Name()).equals(name)){
                Database.bookList.get(i).setStartDate(date, Integer.parseInt(reader));
                break;
            }
        }
    }

    public static void addHistoryEnd(String name, String reader, String date){
        for(int i=0; i<Database.bookList.size(); i++){
            if(new String(Database.bookList.get(i).get_Name()).equals(name)){
                for(int j=0; j<Database.bookList.get(i).historyList.size(); j++){
                    for(int k=0; k<Database.bookList.get(i).historyList.get(j).size(); k++){
                        if(Database.bookList.get(i).historyList.get(j).get(k).getReader() == Integer.parseInt(reader)){
                            Database.bookList.get(i).historyList.get(j).get(k).setEnd(date);
                            break;
                        }
                    }
                }
            }
        }
    }

    public  static void addBookCopy(String name){
        for(int i=0; i<Database.bookList.size(); i++){
            if(new String(Database.bookList.get(i).get_Name()).equals(name)){
                Database.bookList.get(i).set_Number_of_copies(Database.bookList.get(i).get_Number_of_copies() + 1);
                Database.bookList.get(i).set_Number_of_available_books(Database.bookList.get(i).get_Number_of_available_books() + 1);
                Database.bookList.get(i).historyList.add(new ArrayList<History>());
            }
        }
    }

	public static void addAccount(String login, String password){
        Account account = new Account(login, password);
        Database.accountList.add(account);
   }
}
