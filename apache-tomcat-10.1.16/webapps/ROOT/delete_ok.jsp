<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
String name = request.getParameter("name");
String password = request.getParameter("password");
String redirectURL = "list.jsp";
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");
String alertMessage = null;

try {
    String query = "select name, password from bbs where number=" + postNum;
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);

    if (rs.next()) {
        String storedName = rs.getString("name");
        String storedPassword = rs.getString("password");

        if (name.equals(storedName) && password.equals(storedPassword)) {
            // 이름과 비밀번호 일치하면 글 삭제
            query = "DELETE FROM bbs WHERE number=" + postNum;
            int rowsAffected = stmt.executeUpdate(query);
            if (rowsAffected > 0) {
                alertMessage = "글을 삭제했습니다.";
            } else {
                alertMessage = "글 삭제에 실패했습니다.";
                redirectURL = "delete.jsp?number=" + postNum;
            }
        } else {
            alertMessage = "이름 또는 비밀번호를 잘못 입력했습니다.";
            redirectURL = "delete.jsp?number=" + postNum;
        }
    } else {
        alertMessage = "글 삭제에 실패했습니다.";
        redirectURL = "delete.jsp?number=" + postNum;
    }
} catch (SQLException e) {
    e.printStackTrace();
    alertMessage = "글 삭제 중 오류가 발생했습니다.";
    redirectURL = "delete.jsp?number=" + postNum;
}

// JavaScript를 사용하여 알림창 띄우고 페이지 이동
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 삭제 결과</title>
    <script>
        alert("<%= alertMessage %>");
        location.href = "<%= redirectURL %>";
    </script>
</head>
<body>
</body>
</html>