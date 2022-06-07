<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //    String dateTime= LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-dd-MM")).toString();
//    System.out.println(dateTime);
    boolean enter = false;
    boolean isLoggedIn = false;
    if (!Database.isEnable)Database.Init(10, 10, 10, 10);
    Cookie[] cookies = request.getCookies();
    String cookieName = "status";
    Cookie cookie = null;
    if(cookies != null) {
        for(Cookie c: cookies) {
            if(cookieName.equals(c.getName())) {
                cookie = c;
                break;
            }
        }
    }
    if (cookie != null && cookie.getValue().equals("admin")) {
        isLoggedIn = true;
        if (request.getParameter("add-button") != null) {
            String name = request.getParameter("inputBookSample");
            String reader = request.getParameter("inputReaderSample");
            String type = request.getParameter("inputTypeSample");
            String date = request.getParameter("DateSample");
            if(new String("put").equals(type)){
                Admin.addHistory(name, reader, date);
            }else{
                //Admin.addHistoryEnd(name, reader, date);

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
        }
        if (request.getParameter("delete-button") != null) {
            for (int i = Database.bookList.size() - 1; i >= 0; i--) {
                if (request.getParameter("checkbox" + Database.bookList.get(i).getId()) != null) {
                    System.out.println(request.getParameter("checkbox" + Database.bookList.get(i).getId()));
                    Admin.removeBook(Database.bookList.get(i).getId());
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Минералы</title>
    <link rel='stylesheet' type='text/css' href='style/styl.css' />
    <script>
        function tableSearch() {
            var phrase = document.getElementById('search-text');
            var table = document.getElementById('table-id');
            var regPhrase = new RegExp(phrase.value, 'i');
            var flag = false;
            for (var i = 1; i < table.rows.length; i++) {
                flag = false;
                for (var j = table.rows[i].cells.length - 1; j >= 0; j--) {
                    flag = regPhrase.test(table.rows[i].cells[j].innerHTML);
                    if (flag) break;
                }
                if (flag) {
                    table.rows[i].style.display = "";
                } else {
                    table.rows[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
<%if (!isLoggedIn){
    if(request.getParameter("delete-button")!=null){%>
<%="<script>alert(\"Вы не являетесь администратором! Для удаления записей требуются права администратора.\")</script>"%>
<%}}%>
<header>
    <img class="logo" src="images/books.png" alt="logo pic">
    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="minerals.jsp">Минералы</a></li>
            <li><a href="samples.jsp">Образцы</a></li>
            <li><a href="expeditions.jsp">Экспедиции</a></li>
            <%if (cookie != null && cookie.getValue().equals("admin")){
            %>
            <li><a href="geologs.jsp">Геологи</a></li>
            <%}%>
            <% if (cookie != null && Database.stat!=false){%>
            <%="<li style=\"color: aquamarine\">User: "+cookie.getValue()+"</li>"%>
            <%}%>
            <% if (cookie != null && Database.stat!=false){
            %>
            <li><a class="cta" href="authorization.jsp">Выйти</a></li>
            <%}else{%>
            <li><a class="cta" href="authorization.jsp">Войти</a></li>
            <%}%>
        </ul>
    </nav>
</header>
<main>
    <%if(enter){
    %>
    <script>
        alert("!!!");
    </script>
    <%
    }%>
    <div class="main-area" style="padding-left: 10%">
        <div style="margin-bottom: 30px ">
            <h3 >Поиск</h3>
            <input class="input-background" type="text" placeholder="Поиск" id="search-text" onkeyup="tableSearch()">
        </div>
        <div class="flex-box">
            <div class="table-form">
                <h3>Книги</h3>
                <form action="" method="post">
                    <table id="table-id" class="product-table">
                        <thead>
                        <tr>
                            <th>Названиие книги</th>
                            <th>Номер экземпляра</th>
                            <th>Дата выдачи</th>
                            <th>Дата приема</th>
                            <th>Номер читателя</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                            for(Book book: Database.bookList) {
                                int counter = 0;
                                for (ArrayList<History> history: book.historyList){
                                    counter++;
                                    for (History historyLine: history){
                                %>
                                <tr>
                                    <td><%=book.get_Name()%></td>
                                    <td><%=counter%></td>
                                    <td><%=historyLine.getStart()%></td>
                                    <td><%=historyLine.getEnd()%></td>
                                    <td><%=historyLine.getReader()%></td>
                                </tr>
                                <%}
                                }
                            }%>
                        </tbody>
                    </table>
                    <input class="input-background" type="submit" name="delete-button" value="Удалить">
                </form>
            </div>
            <div class="add-area">
                <form class="add-form" action="" method="post">
                    Добавление записи<br>
                    Название книги:
                    <select required name="inputBookSample" class="input-background">
                        <option value=""></option>
                        <%
                            for (Book book : Database.bookList) {
                        %>
                        <option value="<%=book.get_Name()%>"><%=book.get_Name()%></option>
                        <%}%>
                    </select><br/>
                    Читатель:
                    <select required name="inputReaderSample" class="input-background">
                        <option value=""></option>
                        <%
                            for (Reader reader : Database.readerList) {
                        %>
                        <option value="<%=reader.getId()%>"><%=reader.getId()%></option>
                        <%}%>
                    </select><br/>
                    <select required name="inputTypeSample" class="input-background">
                        <option value="put">Взял</option>
                        <option value="push">Отдал</option>
                    </select><br/>
                    Дата: <input  class="input-background" name="DateSample"><br/>
                    <input class="input-background" type="submit" name="add-button" value="Добавить">
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>