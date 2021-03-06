<%@ page import="com.example.storehouse.*" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.example.storehouse.Database" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (!Database.isEnable)Database.Init(10, 10);
    String registerMessage = null;
    boolean isDouble = false;
    if (request.getParameter("register-button") != null) {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        for (Account account: Database.accountList){
            if (account.getLogin().equals(login)) {
                registerMessage = "Аккаунт с таким логином уже существует";
                isDouble = true;
                break;
            }
        }
        if (!isDouble){
            Admin.addAccount(login, password);
            response.sendRedirect("authorization.jsp");
        }
    }
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
    <title>Регистрация</title>
    <link rel='stylesheet' type='text/css' href='style/styl.css' />
</head>
<body>
<header>
    <img class="logo" src="images/books.png" alt="logo pic">
    <nav>
        <ul class="nav-links">
            <li><a href="index.jsp">Главная</a></li>
            <li><a href="books.jsp">Книги</a></li>
            <li><a href="copies.jsp">Экземпляры</a></li>
<%--            <li><a href="report.jsp">Обращение</a></li>--%>
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
        <div class="login-area">
            <form action="" method="post">
                Логин: <input style="width: 192px;" class="input-background" required type="text" name="login"><br>
                Пароль: <input class="input-background" required type="password" name="password"><br>
                <input style="width: 150px; margin-left: 17%; text-align: center" class="input-background" type="submit" name="register-button" value="Зарегистрироваться">
            </form>
			<script type="text/javascript">
  function setCursorPosition(pos, e) {
    e.focus();
    if (e.setSelectionRange) e.setSelectionRange(pos, pos);
    else if (e.createTextRange) {
      var range = e.createTextRange();
      range.collapse(true);
      range.moveEnd("character", pos);
      range.moveStart("character", pos);
      range.select()
    }
  }

  function mask(e) {
    var matrix = this.placeholder,// .defaultValue
        i = 0,
        def = matrix.replace(/\D/g, ""),
        val = this.value.replace(/\D/g, "");
    def.length >= val.length && (val = def);
    matrix = matrix.replace(/[_\d]/g, function(a) {
      return val.charAt(i++) || "_"
    });
    this.value = matrix;
    i = matrix.lastIndexOf(val.substr(-1));
    i < matrix.length && matrix != this.placeholder ? i++ : i = matrix.indexOf("_");
    setCursorPosition(i, this)
  }
  window.addEventListener("DOMContentLoaded", function() {
    var input = document.querySelector("#online_phone");
    input.addEventListener("input", mask, false);
    input.focus();
    setCursorPosition(3, input);
  });
</script>
            <p><%if(registerMessage != null)%><%=registerMessage%></p>
        </div>
    </div>
</main>
</body>
</html>