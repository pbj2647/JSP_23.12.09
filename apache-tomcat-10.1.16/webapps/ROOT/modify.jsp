<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");
String str_sql = "select subject,name,password,email,homepage,memo from bbs where number=" + postNum + ";";

try {
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(str_sql);

    if (rs.next()) {
        String postSubject = rs.getString("subject");
        String postName = rs.getString("name");
        String postPassword = rs.getString("password");
        String postEmail = rs.getString("email");
        String postHomepage = rs.getString("homepage");
        String postMemo = rs.getString("memo");

%>
<html>
<head>
    <title>글 수정</title>
</head>
<body>
    <h2>글 수정</h2>
    <form action="insert_modify.jsp" method="post">
        <input type="hidden" name="number" value="<%= postNum %>">
        <table>
            <tr>
                <td>제목:</td>
                <td><input type="text" name="subject" value="<%= postSubject %>" required></td>
            </tr>
            <tr>
                <td>작성자:</td>
                <td><input type="text" name="name" value="<%= postName %>" required></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>전자우편:</td>
                <td><input type="text" name="email" value="<%= postEmail %>"></td>
            </tr>
            <tr>
                <td>홈페이지:</td>
                <td><input type="text" name="homepage" value="<%= postHomepage %>"></td>
            </tr>
            <tr>
                <td>내용:</td>
                <td><textarea name="memo" rows="5" cols="50" required><%= postMemo %></textarea></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="수정">
    </form>
    <br>
    <button><a href='view.jsp?number=<%= postNum %>'>취소</a></button>
</body>
</html>
<%
    }
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
%>
