<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
String postSubject = request.getParameter("subject");
String postMemo = request.getParameter("memo");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");

try {
    String updateQuery = "UPDATE bbs SET subject='" + postSubject + "', memo='" + postMemo + "' WHERE number=" + postNum;

    stmt = conn.createStatement();
    int rowsUpdated = stmt.executeUpdate(updateQuery);

    if (rowsUpdated > 0) {
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 결과</title>
    <script>
        alert("글을 수정했습니다.");
        location.href = "view.jsp?number=<%= postNum %>";
    </script>
</head>
<body>
</body>
</html>
<%
    } else {
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 실패</title>
    <script>
        alert("글 수정에 실패했습니다.");
        location.href = "modify.jsp?number=<%= postNum %>";
    </script>
</head>
<body>
</body>
</html>
<%
    }

    stmt.close();
} catch (SQLException e) {
    e.printStackTrace();
}
%>