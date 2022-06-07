package com.example.storehouse;

import java.util.ArrayList;

public class Database {
	public static ArrayList<Account> accountList = new ArrayList<>();
    public static ArrayList<Book> bookList = new ArrayList<>();
    public static ArrayList<Reader> readerList = new ArrayList<>();
    public static boolean isEnable = false;
	public static boolean stat=false;

    public static void Init (int bookNum, int readerNum){
        for(int i = 0; i < bookNum; i++){
            Database.bookList.add(new Book());
        }
        for(int i = 0; i < readerNum; i++){
            Database.readerList.add(new Reader());
        }
		isEnable = true;
    }

    public static Book getBookByID(int id){
        for (Book book : bookList) {
            int bookId = book.getId();
            if (id == bookId) {
                return book;
            }
        }
        return null;
    }

    public static Reader getReaderByID(int id){
        for (Reader reader : readerList) {
            int readerId = reader.getId();
            if (id == readerId) {
                return reader;
            }
        }
        return null;
    }

    public static Account getAccountByLogin(String login) {
        for (Account account : accountList) {
            String accountLogin = account.getLogin();
            if (accountLogin.equals(login)) {
                return account;
            }
        }
        return null;
    }
}
