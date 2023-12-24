<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");

try {
    String increaseHitSql = "UPDATE bbs SET count = count + 1 WHERE number=" + postNum;
    stmt = conn.createStatement();
    stmt.executeUpdate(increaseHitSql);     
    stmt.close();
} catch (Exception e) {
    e.printStackTrace();
}

response.sendRedirect("view.jsp?number=" + postNum);
%>