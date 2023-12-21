<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
</head>
<body>
    <form method="post" action="delete_ok.jsp?number=<%= postNum %>">
        이름 : <input type="text" name="username" size=20 maxlength=20> <br>
        비밀번호 : <input type="password" name="password" size=20 maxlength=20> <br>
        <input type="hidden" name="number" value="<%= postNum %>">
        <input type="submit" value="삭제">
    </form>
</body>
</html>