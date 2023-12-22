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
    <title>글 삭제</title>
</head>
<body>
    <form action="delete_ok.jsp" method="post">
        <input type="hidden" name="number" value="<%= postNum %>">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="삭제">
        <button><a href="view.jsp?number=<%= postNum %>">취소</a></button>
    </form>    
</body>
</html>