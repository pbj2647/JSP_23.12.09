<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");

String inputUsername = request.getParameter("username");
String inputPassword = request.getParameter("password");

boolean isUserValid = false;

try {
    String str_sql = "select * from bbs where username = ? and password = ?";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(str_sql);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
</head>
<body>
<%
    if (rs.next()) {
        isUserValid = true;
    }

    if (isUserValid) {
        String deleteSql = "delete from bbs where number =" + postNum;
        stmt.executeUpdate(deleteSql);
%>
        <script language="javascript">
            alert("글을 삭제했습니다.");
            location.href = "list.jsp";
        </script>
<%
    } else {
%>
        <script language="javascript">
            alert("이름 또는 비밀번호를 잘못 입력했습니다.");
            history.back();
        </script>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (stmt != null) stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
</body>
</html>
