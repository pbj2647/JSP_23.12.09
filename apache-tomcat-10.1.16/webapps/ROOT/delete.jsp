<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection)pageContext.getAttribute("Conn");
String str_sql = "select * from users where username='" + inputUsername + "' and password='" + inputPassword + "';";
String inputUsername = request.getParameter("username");
String inputPassword = request.getParameter("password");

try {   
    stmt = Conn.createStatement();
    rs = stmt.executeQuery(str_sql);

    if (rs.next()) {
        String deleteSql = "DELETE FROM bbs WHERE number =" + postNum;
        stmt.executeUpdate(deleteSql);
        out.println("게시글이 삭제되었습니다.");
        response.sendRedirect("list.jsp");
    } else {
        out.println("이름 또는 비밀번호를 잘못 입력했습니다.");
        response.sendRedirect("delete.jsp?number=" + postNum);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>









<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
</head>
    <body>
        <form method="post" action="delete.jsp">
            <label for="username">아이디:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="삭제">
        </form>
    </body>
</html>