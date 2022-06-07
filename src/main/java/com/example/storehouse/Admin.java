package com.example.storehouse;

import java.util.Random;

public class Admin {
    public static String login = "admin";
    public static String password = "admin";
    public static void addMineral(String name, String classification, String condition, String solid, String internalProperties, String chemical, String origin){
        Mineral mineral = new Mineral(name, classification, condition, solid, internalProperties, chemical, origin);
        Database.mineralList.add(mineral);
    }
    public static void removeMineral(int id){
        Database.mineralList.remove(Database.getMineralByID(id));
    }

    public static void addBook(String name, String bookAuthor, String bookPublisher, String bookInfo, String bookNumberCopies, String bookAvailableCopies){
        Book book = new Book(name, bookAuthor, bookPublisher, bookInfo, Integer.parseInt(bookNumberCopies), Integer.parseInt(bookAvailableCopies));
        Database.bookList.add(book);
    }
    public static void removeBook(int id){
        Database.bookList.remove(Database.getBookByID(id));
    }

    public static void addReader(String name, String contact_information, String history){
        Reader reader = new Reader(name, contact_information, history);
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
                            enter = true;
                            break;
                        }
                    }
                }
            }
        }
    }

	public static void addGeolog(String name,String address,String phone,String email){
        Geologist geolog = new Geologist(name, address, phone, email);
        Database.geologList.add(geolog);
    }
	
    public static void removeGeolog(int id){
        Database.geologList.remove(Database.getGeologByID(id));
    }
	
	public static void addSample(Mineral minerals,String origin,String detection,String source){
        Sample sample = new Sample(minerals, origin, detection, source);
        Database.sampleList.add(sample);
    }
	
	public static void removeSample(int id){
        Database.sampleList.remove(Database.getSampleByID(id));
    }
	
	public static void addExpedition(String startDate,String endDate,Geologist geologists,Sample samples,String gatheringPlace){
        Expedition expedition = new Expedition(startDate, endDate, geologists, samples,gatheringPlace);
        Database.expeditionList.add(expedition);
    }
	
	public static void removeExpedition(int id){
        Database.expeditionList.remove(Database.getExpeditionByID(id));
    }
	
	public static void addAccount(String login, String password, Geologist geolog){
        Account account = new Account(login, password, geolog);
        Database.accountList.add(account);
   }
	
/*    public static void addClient(String name, String address, String email, String phone, String role){
        Client client = new Client(name, address, email, phone, role);
        Database.clientList.add(client);
    }
    public static void removeClient(int id){
        Database.clientList.remove(Database.getClientByID(id));
    }
    public static void addOrder(String dateTime, Products product, int quantity, String direction, Client client){
        Order order = new Order(dateTime, product, quantity, direction, client);
        Database.orderList.add(order);
    }
    public static void removeOrder(int id){
        Database.orderList.remove(Database.getOrderByID(id));
    }
    */ 
//    public static void removeAccount(int id){
//        Database.productList.remove(Database.getProductByID(id));
//    }
}
