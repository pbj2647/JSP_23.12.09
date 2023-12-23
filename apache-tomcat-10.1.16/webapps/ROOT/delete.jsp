<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conn_db.jsp" %>
<%
String postNum = request.getParameter("number");
Connection conn = (Connection)pageContext.getAttribute("Conn");
String str_sql = "DELETE FROM bbs WHERE number=" + postNum + ";";

try {
    Statement stmt = conn.createStatement();
    int rowsAffected = stmt.executeUpdate(str_sql);

    if (rowsAffected > 0) {
        response.sendRedirect("list.jsp");
    } else {
        out.println("게시글 삭제에 실패했습니다.");
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
