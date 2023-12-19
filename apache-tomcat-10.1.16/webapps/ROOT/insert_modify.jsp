<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String s_name = request.getParameter("name");
String s_password = request.getParameter("password");
String s_email = request.getParameter("email");
String s_homepage = request.getParameter("homepage");
String s_subject = request.getParameter("subject");
String s_memo = request.getParameter("memo");
String s_ip = request.getRemoteAddr();

Connection conn = (Connection)pageContext.getAttribute("Conn");
PreparedStatement pstmt = null;

try {
    String str_sql = "INSERT INTO bbs(name, password, email, homepage, subject, memo, ip, count, writetime) VALUES(?,?,?,?,?,?,?,?,UNIX_TIMESTAMP(CURRENT_TIMESTAMP))";
    pstmt = conn.prepareStatement(str_sql);
    pstmt.setString(1, s_name);
    pstmt.setString(2, s_password);
    pstmt.setString(3, s_email);
    pstmt.setString(4, s_homepage);
    pstmt.setString(5, s_subject);
    pstmt.setString(6, s_memo);
    pstmt.setString(7, s_ip);
    pstmt.setInt(8, 0);
    pstmt.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <script language="javascript">
        alert("글을 수정하였습니다.");
        location.href = "list.jsp";
    </script>
</head>
<body>
</body>
</html>
