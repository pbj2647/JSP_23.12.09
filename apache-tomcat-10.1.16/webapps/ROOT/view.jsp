<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection)pageContext.getAttribute("Conn");
String str_sql = "select subject,name,email,homepage,memo,writetime,count from bbs where number="+postNum+";";

try {

    stmt = conn.createStatement();
    rs = stmt.executeQuery(str_sql);  

    while (rs.next()) {
        String postSubject = rs.getString("subject");
        String postName = rs.getString("name");
        String postemail = rs.getString("email");
        String postHomepage = rs.getString("homepage");
        String postMemo = rs.getString("memo");
        long unixTimestamp = rs.getLong("writetime");
        Date date = new Date(unixTimestamp * 1000);
        SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
        String finalFormattedDate = sdf.format(date);
        int postHit = rs.getInt("count");

%>


<html>
    <head>
        <title> <%= postSubject %> </title>
    </head>
    <body>
        <p> 제목 : <%= postSubject %> </p>
        <p> 작성자 : <%= postName %> <small>(email : <%= postemail %>, homepage : <%= postHomepage %>)</small></p>
        <p> 내용 : <%= postMemo %> </p>
        <p><small> 작성일 : <%= finalFormattedDate %> </small></p>
        <br>
        <button align="left"><a href = 'list.jsp'>[글목록]</a></button>
        <button align="right"><a href = 'modify_ok.jsp'>[글 수정]</a></button>
        <button align="right"><a href = 'delete_ok.jsp'>[글 삭제]</a></button>
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
