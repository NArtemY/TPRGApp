<%@ page import="com.example.storehouse.*" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10, 10,10);
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Главная</title>
        <link rel='stylesheet' type='text/css' href='style/styl.css'/>
        <style>

        </style>
    </head>
    <body>
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
            <div class="main-area">
                <div class="content-area">
                    <div class="img-area">
                        <img class="logoSmall" src="images/library.jpg" alt="">
                    </div>
                    <div class="text-area">
                    <span>
                        Добро пжаловать на сайт библиотеки. <br>
                        Данный сайт разработан в рамках курса "Технологии программирования".<br>
                        Всем пользователям данного сайта предоставлена возможность просматривать список книг и экземпляров.<br>
                        Авторизованным пользователям даны привилегии просматривать список читателей, добавлять/удалять книги.<br>
                        <br>
                    </span>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>