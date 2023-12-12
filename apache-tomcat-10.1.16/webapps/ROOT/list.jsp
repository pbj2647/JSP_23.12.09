<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file = "conn_db.jsp" %>

<%

try {
    String str_sql = "select number,subject,name,writetime,count from bbs;";
    stmt = conn.createStatement(str_sql);
    stmt.setString(number, s_number);
    stmt.setString(subject, s_subject);
    stmt.setString(name, s_name);
    stmt.setString(writetime, s_writetime);
    stmt.setString(count, s_count);
        stmt.executeUpdate();
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
<head>
    <title>JSP 게시판 - 글목록보기</title>
</head>
<body>
    <table border="1" cellspacing="0" width="680" bordercolordark="white" bordercolorlight="#999999">
        <tr>
            <td width="30" bgcolor="#CCCCCC">
                <p align="center">no</p>
            </td>
            <td bgcolor="#CCCCCC" width="490">
                <p align="center">subject</p>
            </td>
            <td width="60" bgcolor="#CCCCCC">
                <p align="center">name</p>
            </td>
            <td width="70" bgcolor="#CCCCCC">
                <p align="center">date</p>
            </td>
            <td width="30" bgcolor="#CCCCCC">
                <p align="center">hit</p>
            </td>
        </tr>
        <tr>
            <td width="30">
                <p align="center">s_number</p>
            </td>
            <td width="490">
                s_title
            </td>
            <td width="60">
                <p align="center">s_name</p>
            </td>
            <td width="70">
                <p align="center">s_writetime</p>
            </td>
            <td width="30">
                <p align="center">s_count</p>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="5">
                <p align="center">
                    [처음] [10개 앞] [이전] [1] [2] [3] [4] [5] <b><font color="green">6</font></b> [7] [8] [9] [10] [다음] [10개 뒤] [마지막]
                </p>
            </td>
        </tr>
        <tr>
            <td width="100%" colspan="5">
                <p align="center">
                    <a href="write.html">[글쓰기]</a>
                </p>
            </td>
        </tr>
    </table>
</body>
</html>
