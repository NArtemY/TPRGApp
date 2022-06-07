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
    boolean isLoggedIn = false;
    if (!Database.isEnable)Database.Init(10, 10);
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
            String name = request.getParameter("readerName");
            String readerEmail = request.getParameter("readerEmail");
            Admin.addReader(name, readerEmail);
        }
        if (request.getParameter("delete-button") != null) {
            for (int i = Database.readerList.size() - 1; i >= 0; i--) {
                if (request.getParameter("checkbox" + Database.readerList.get(i).getId()) != null) {
                    System.out.println(request.getParameter("checkbox" + Database.readerList.get(i).getId()));
                    Admin.removeReader(Database.readerList.get(i).getId());
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Читатели</title>
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
            <li><a href="books.jsp">Книги</a></li>
            <li><a href="copies.jsp">Экземпляры</a></li>
            <li><a href="report.jsp">Обращение</a></li>
            <%if (cookie != null && cookie.getValue().equals("admin")){
            %>
            <li><a href="readers.jsp">Читатели</a></li>
            <%}%>
            <% if (cookie != null && Database.stat!=false){%>
            <%="<li style=\"color: black\">User: "+cookie.getValue()+"</li>"%>
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
                            <th></th>
                            <th>ID</th>
                            <th>ФИО</th>
                            <th>Email</th>
                            <th>Книга</th>
                            <th>Дата выдачи</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(Reader reader: Database.readerList) {
                                boolean haveBook = false;
                                for(Book book: Database.bookList) {
                                    for (ArrayList<History> history: book.historyList){
                                        for (History historyLine: history){
                                            if(reader.getId() == historyLine.getReader()){
                                                haveBook = true;
                        %>
                                            <tr>
                                                <td><input type="checkbox" name=<%="checkbox"+reader.getId()%> value="<%=reader.getId()%>"></td>
                                                <td><%=reader.getId()%></td>
                                                <td><%=reader.get_Name()%></td>
                                                <td><%=reader.get_Contact_information()%></td>
                                                <td><%=book.get_Name()%></td>
                                                <td><%=historyLine.getStart()%></td>
                                            </tr>
                                          <%}
                                        }
                                    }
                                }
                                if(!haveBook){
                                    %>
                                        <tr>
                                            <td><input type="checkbox" name=<%="checkbox"+reader.getId()%> value="<%=reader.getId()%>"></td>
                                            <td><%=reader.getId()%></td>
                                            <td><%=reader.get_Name()%></td>
                                            <td><%=reader.get_Contact_information()%></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    <%
                                }
                            }%>
                        </tbody>
                    </table>
                    <input class="input-background" type="submit" name="delete-button" value="Удалить">
                </form>
            </div>
            <div class="add-area">
                <form class="add-form" action="" method="post">
                    Добавление читателя<br>
                    ФИО: <input  class="input-background" name="readerName"><br/>
                    Email: <input  class="input-background" name="readerEmail"><br/>
                    <input class="input-background" type="submit" name="add-button" value="Добавить">
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>