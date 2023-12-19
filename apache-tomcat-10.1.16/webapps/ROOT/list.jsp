<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%

// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection)pageContext.getAttribute("Conn");
String str_sql = "select number,subject,name,writetime,count from bbs;";

%>

<html>
    <head>
        <title> 글목록 </title>
    </head>
    <body>
        <h2 align=center> 게시글 목록 </h2>
        <tr>
            <td width=100% colspan=5>
                <p align=left> <a href='write.html'> [글쓰기] </a> </p>
            </td>
        </tr>
        <table border=1 cellspacing=0 width=730 height=60 bordercolordark=white bodercolorlight=#999999>
            <tr>
                <td width=30 bgcolor=#CCCCCC>
                    <p align=center> no </p>
                </td>
                <td width=490 bgcolor=#CCCCCC>
                    <p align=center> 제목 </p>
                </td>
                <td width=60 bgcolor=#CCCCCC>
                    <p align=center> 작성자 </p>
                </td>
                <td width=80 bgcolor=#CCCCCC>
                    <p align=center> 작성일 </p>
                </td>
                <td width=70 bgcolor=#CCCCCC>
                    <p align=center> 조회수 </p>
                </td>
            </tr>
            <%

            try {
            
                stmt = Conn.createStatement();
                rs = stmt.executeQuery(str_sql);    
            
                while (rs.next()) {
                    int postNum = rs.getInt("number");
                    String postSubject = rs.getString("subject");
                    String postName = rs.getString("name");
                    long unixTimestamp = rs.getLong("writetime");
                    Date date = new Date(unixTimestamp * 1000);
                    SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
                    String finalFormattedDate = sdf.format(date);
                    int postHit = rs.getInt("count");
            
            %>
        <tr>
            <td width=30>
                <p align="center"><%= postNum %></p>
            </td>
            <td width=490>
                <p align="center"><a href='view.jsp?number=<%= postNum %>'><%= postSubject %></a></p>
            </td>
            <td width=60>
                <p align="center"><%= postName %></p>
            </td>
            <td width=80>
                <p align="center"><%= finalFormattedDate %></p>
            </td>
            <td width=70>
                <p align="center"><%= postHit %></p>
            </td>
            </tr>
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
       </table>
    </body>
</html>


