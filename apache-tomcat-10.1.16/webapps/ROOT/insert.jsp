<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ include file = "conn_db.jsp" %>

<%

/******************
* 입력값 넘겨받기 *
******************/

request.setCharacterEncoding("UTF-8");

String s_name = request.getParameter("name");
String s_password = request.getParameter("password");
String s_email = request.getParameter("email");
String s_homepage = request.getParameter("homepage");
String s_subject = request.getParameter("subject");
String s_memo = request.getParameter("memo");
String s_ip = request.getRemoteAddr();

String DB_URL = "jdbc:mysql://localhost:3306/itmembers?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
String DB_USER = "root";
String DB_PASSWORD = "root";

Connection conn = null;
PreparedStatement pstmt = null;

try {
    /***************
    * DB 연결 부분(conn_db.jsp에서 역할을 대신 하기때문에 주석처리) *
    ***************/
    //Class.forName("com.mysql.cj.jdbc.Driver");
    //conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    /***********************************************
    * SQL문을 이용해 DB에 입력 값 저장(Insert)하기 *
    ***********************************************/

    String str_sql = "INSERT INTO bbs(name, password, email, homepage, subject, memo, ip, count, writetime) VALUES(?,?,?,?,?,?,?,?,UNIX_TIMESTAMP(CURRENT_TIMESTAMP))";
    pstmt = conn.prepareStatement(str_sql);
    pstmt.setString(1, s_name);
    pstmt.setString(2, s_password);
    pstmt.setString(3, s_email);
    pstmt.setString(4, s_homepage);
    pstmt.setString(5, s_subject);
    pstmt.setString(6, s_memo);
    pstmt.setString(7, s_ip);
    pstmt.setInt(8, 0); // count는 0으로 초기화
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

<!-----------------------------------------
* 메시지 보여주고 리스트 페이지로 이동하기*
------------------------------------------->
<html>
<head>
<script language="javascript">
    self.window.alert("입력한 글을 저장하였습니다.");
    location.href = "list.jsp";
</script>
</head>
<body>
</body>
</html>
