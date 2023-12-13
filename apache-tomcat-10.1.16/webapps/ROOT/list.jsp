<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection)pageContext.getAttribute("Conn");
String str_sql = "select number,subject,name,writetime,count from bbs;";

try {

    stmt = conn.createStatement();
    rs = stmt.executeQuery(str_sql);    

    while (rs.next()) {
        int postNum = rs.getInt("number");
        String postSubject = rs.getString("subject");
        String postName = rs.getString("name");
        String postWritetime = rs.getString("writetime");
        int postHit = rs.getInt("count");
%>
<html>
    <head>
        <title> JSP 게시판 - 글목록보기</title>
    </head>
    <body>
        <table border=1 cellspacing=0 width=680 bordercolordark=white bodercolorlight=#999999>
            <tr>
                <td width=30 bgcolor=#CCCCCC>
                    <p align=center> no </p>
                </td>
                <td width=490 bgcolor=#CCCCCC>
                    <p align=center> subject </p>
                </td>
                <td width=60 bgcolor=#CCCCCC>
                    <p align=center> name </p>
                </td>
                <td width=70 bgcolor=#CCCCCC>
                    <p align=center> date </p>
                </td>
                <td width=30 bgcolor=#CCCCCC>
                    <p align=center> hit </p>
                </td>
            </tr>
        <tr>
            <td width="30">
                <p align="center"><%= postNum %></p>
            </td>
            <td width="490">
                <p align="center"><%= postSubject %></p>
            </td>
            <td width="60">
                <p align="center"><%= postName %></p>
            </td>
            <td width="70">
                <p align="center"><%= postWritetime %></p>
            </td>
            <td width="30">
                <p align="center"><%= postHit %></p>
            </td>
        </tr>
        <tr>
            <td width=100% colspan=5>
                <p align=center> <a href='write.html'> [글쓰기] </a> </p>
            </td>
        </tr>
        </table>
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
