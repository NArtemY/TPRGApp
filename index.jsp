<%@ page import="com.example.storehouse.*" %> //Используемые библиотеки
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
 if (!Database.isEnable)Database.Init(10, 10, 10,10); //Генерация локальной базы данных
 Cookie[] cookies = request.getCookies();
 String cookieName = "status";
 Cookie cookie = null;
 if(cookies != null) {
 for(Cookie c: cookies) {
 if(cookieName.equals(c.getName())) {
 cookie = c;
 break;
 }
8
 }
 }
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Главная</title>
		<link rel='stylesheet' type='text/css' href='style/style.css' /> //Подключение стилей
	</head>
	<body>
	</body>
</html>