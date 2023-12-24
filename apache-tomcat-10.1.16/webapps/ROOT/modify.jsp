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
        String postMemo = rs.getString("memo");
%>


<html>
    <head>
        <meta charset="UTF-8">
        <title> 글쓰기</title>
        <script language="javascript">
            function check_submit() {
                 if(document.myForm.subject.value == ""){
                    alert('제목을 공백으로 수정할 수 없습니다.');
                    document.myForm.subject.focus();
                    return;

                }else if(document.myForm.memo.value == ""){
                    alert('내용을 공백으로 수정할 수 없습니다.');
                    document.myForm.memo.focus();
                    return;

                }else {
                    document.myForm.action="insert_modify.jsp";
                    document.myForm.submit();
                }
            }
        </script>
    
    </head>
    <body>
    <h2> 글수정 </h2>
    <form name="myForm" method="post" action="insert_modify.jsp" accept-charset="UTF-8">
        제목 : <input type="text" name="subject" size="50" maxlength="70" value="<%= postSubject %>"> <br>
        내용 : <textarea name="memo" cols="50" rows="20" maxlength="500"><%= postMemo %></textarea><br>
        
        <br>
        <input type="hidden" name="number" value="<%= postNum %>">
        <input type="submit" value="수정하기" onclick="javascript:check_submit();">
        <button><a href="view.jsp?number=<%= postNum %>">취소</a></button>
    </form>
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