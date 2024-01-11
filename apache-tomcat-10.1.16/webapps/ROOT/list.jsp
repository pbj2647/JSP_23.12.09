<%@ page language="java" import="java.sql.*,java.io.*, java.text.SimpleDateFormat, java.util.Date" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file="conn_db.jsp" %>

<%

// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection)pageContext.getAttribute("Conn");
String query = request.getParameter("query");
if (query == null) {
    query = "";
}

String keyword = request.getParameter("keyword");
if (keyword == null) {
    keyword = "1"; // 기본값 설정
}

String str_sql = "select number, subject, memo, name, writetime, count from bbs";
if (!query.isEmpty()) {
    if (keyword.equals("1")) {
        str_sql += " where subject like '%" + query + "%' or memo like '%" + query + "%' or name like '%" + query + "%'";    
    } else if (keyword.equals("2")) {
        str_sql += " where subject like '%" + query + "%'";
    } else if (keyword.equals("3")) {
        str_sql += " where memo like '%" + query + "%'";
    } else if (keyword.equals("4")) {
        str_sql += " where name like '%" + query + "%'";
    }
}

str_sql += ";";
%>

<html>
    <head>
        <title> 글목록 </title>
    </head>
    <body>
        <h2 align=left> <a href="list.jsp"> 게시글 목록 </a></h2>
        <p align=left> <a href='write.html'> [글쓰기] </a> </p>  
        <form action="list.jsp" method="get">
            <select class="form-select" aria-label="keyword" name="keyword">
                <option value="1" <% if (keyword.equals("1")) { %>selected<% } %>>전체</option>
                <option value="2" <% if (keyword.equals("2")) { %>selected<% } %>>제목</option>
                <option value="3" <% if (keyword.equals("3")) { %>selected<% } %>>내용</option>
                <option value="4" <% if (keyword.equals("4")) { %>selected<% } %>>작성자</option>
            </select>
            <input type="text" name="query" width=500 placeholder="검색어를 입력하세요" value="<%= query %>">
            <input type="submit" value="검색">
        </form>
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
                <p align="center">
                    <a href='increaseHit.jsp?number=<%= postNum %>&count=<%= postHit %>'><%= postSubject %></a>
                </p>
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
} 
%>
       </table>
    </body>
</html>