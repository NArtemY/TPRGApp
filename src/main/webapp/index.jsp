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
        <link rel='stylesheet' type='text/css' href='style/style.css' />
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                background-color: #8ca9cf;
            }

            li, a, button {
                font-family: 'Montserrat', sans-serif;
                font-weight: 300;
                font-size: 16px;
                color: #8ca9cf;
                text-decoration: none;
            }

            header {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                padding: 30px 10%;
            }

            .logoSmall{
                margin-top:-220px;
            }

            .logo {
                cursor: pointer;
                margin-top: 60px;
                margin-right: auto;
            }

            .nav-links {
                list-style: none;
            }

            .nav-links li {
                display: inline-block;
                padding: 0 20px;
            }

            .nav-links li a {
                font-size: 22px;
                transition: all 0.3s ease 0s;
            }

            .nav-links li a:hover {
                color: #0088a9;
            }

            button {
                margin-left: 20px;
                padding: 9px 25px;
                background-color: #000000;
                border: none;
                border-radius: 50px;
                cursor: pointer;
                transition: all 0.3s ease 0s;
            }

            button:hover {
                background-color: rgba(0, 136, 169, 0.8);
            }
            .main-area {
                font-family: 'Montserrat', monospace ;
                font-weight: 300;
                font-size: 14px;
                margin: 30px;
                padding: 20px;
                color: #ffffff;
            }
            .content-area {
                display: flex;
                margin: auto;
                padding: 0 10%;
            }
            .img-area {
                padding: 20px 0;
                margin: 100px auto;
            }
            .img-area img {
                width: 600px;
            }
            .text-area {
                /*display: inline-block;*/
                /*margin-left: 50%;*/
                font-size: 16px;
                padding: 2px 1em 0 200px;
                margin: 190px auto;
            }
            .input-background {
                background-color: #000000;
                color: #edf0d1;
                margin: 7px 0;
                padding: 2px 10px;
                border: none;
                border-radius: 10px;
            }
            .product-table {
                width: 100%;
                margin-bottom: 20px;
                border: 5px solid #fff;
                border-top: 5px solid #fff;
                border-bottom: 3px solid #fff;
                border-collapse: collapse;
                outline: 3px solid #ffd300;
                font-size: 15px;
                background: #fff!important;
            }
            .product-table thead th {
                font-weight: bold;
                padding: 7px;
                background: #ffd300;
                border: none;
                text-align: left;
                font-size: 15px;
                border-top: 3px solid #fff;
                border-bottom: 3px solid #ffd300;
            }
            .product-table td {
                padding: 7px;
                border: none;
                border-top: 3px solid #fff;
                border-bottom: 3px solid #fff;
                font-size: 15px;
            }
            .product-table tbody tr:nth-child(even){
                background: #f8f8f8!important;
            }

            .flex-box {
                display: flex;
            }
            .add-area {
                margin-left: auto;
                margin-right: auto;
            }
            .add-form {
                margin: 40px;
            }
            .content-area {
                display: flex;
            }
            .login-area {
                margin: 100px auto;
                width: 300px;
            }
            .quantity-area {
                margin: 20px 0;
            }
            .quantity-area p {
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
        <header>
            <img class="logo" src="images/temp.png" alt="logo pic">
            <nav>
                <ul class="nav-links">
                    <li><a href="index.jsp">Главная</a></li>
                    <li><a href="minerals.jsp">Книги</a></li>
                    <li><a href="samples.jsp">Читатели</a></li>
                    <li><a href="expeditions.jsp">Авторы</a></li>
					<li><a href="report.jsp">Обращение</a></li>
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
            <div class="main-area">
                <div class="content-area">
                    <div class="img-area">
                        <img class="logoSmall" src="images/warehouse.jpg" alt="">
                    </div>
                    <div class="text-area">
                    <span>
                        Добро пжаловать на сайт коллекции минералов. <br>
                        Данный сайт разработан в рамках курса "Технологии программирования".<br>
                        Всем пользователям данного сайта предоставлена возможность просматривать различные минералы, образцы и экспедиции, а также
                        получить данные о совершённых экспедициях в указанный период времени.<br>
                        Авторизованным пользователям даны привилегии добавления/удаления минералов, образцов и экспедиций.<br>
                        <br>
                    </span>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>