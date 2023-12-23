<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
String postSubject = request.getParameter("subject");
String postName = request.getParameter("name");
String postPassword = request.getParameter("password");
String postEmail = request.getParameter("email");
String postHomepage = request.getParameter("homepage");
String postMemo = request.getParameter("memo");

// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");
String str_sql = "UPDATE bbs SET subject=?, name=?, password=?, email=?, homepage=?, memo=? WHERE number=?";

try {
    PreparedStatement pstmt = conn.prepareStatement(str_sql);
    pstmt.setString(1, postSubject);
    pstmt.setString(2, postName);
    pstmt.setString(3, postPassword);
    pstmt.setString(4, postEmail);
    pstmt.setString(5, postHomepage);
    pstmt.setString(6, postMemo);
    pstmt.setString(7, postNum);

    int result = pstmt.executeUpdate();

    if (result > 0) {
%>
<html>
<head>
    <title>글 수정 완료</title>
</head>
<body>
    <h2>글 수정 완료</h2>
    <p>글이 성공적으로 수정되었습니다.</p>
    <button><a href='view.jsp?number=<%= postNum %>'>수정된 글 보기</a></button>
</body>
</html>
<%
    } else {
%>
<html>
<head>
    <title>글 수정 실패</title>
</head>
<body>
    <h2>글 수정 실패</h2>
    <p>글 수정에 실패하였습니다. 다시 시도해 주세요.</p>
    <button><a href='view.jsp?number=<%= postNum %>'>돌아가기</a></button>
</body>
</html>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
