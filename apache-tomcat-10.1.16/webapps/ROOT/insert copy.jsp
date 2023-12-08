<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%@ include file="conn_db.jsp" %>

<%

/******************
* 입력값 넘겨받기 *
******************/

String s_name=new String(request.getParameter("name").getBytes("8859_1"),"utf-8");
String s_password=request.getParameter("password");
String s_email=request.getParameter("email");
String s_homepage=request.getParameter("homepage");
String s_subject=new String(request.getParameter("subject").getBytes("8859_1"),"utf-8");
String s_memo=new String(request.getParameter("memo").getBytes("8859_1"),"utf-8");
String s_ip = request.getRemoteAddr(); 


try { 

/***************
* DB 연결 부분(conn_db.jsp에서 역할을 대신 하기때문에 주석처리) *
***************/
	//Class.forName("com.mysql.cj.jdbc.Driver"); 
   	//Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost/itmembers?user=root&password=root&useUnicode=true&characterEncoding=utf-8"); 

/***********************************************
* SQL문을 이용해 DB에 입력 값 저장(Insert)하기 *
***********************************************/

	String str_sql = "INSERT INTO bbs(name,password,email,homepage,subject,memo,ip,writetime) VALUES(?,?,?,?,?,?,?,UNIX_TIMESTAMP(CURRENT_TIMESTAMP))";
	PreparedStatement pstmt = Conn.prepareStatement(str_sql);
	pstmt.setString(1,s_name);
	pstmt.setString(2,s_password);
	pstmt.setString(3,s_email);
	pstmt.setString(4,s_homepage);
	pstmt.setString(5,s_subject);
	pstmt.setString(6,s_memo);
	pstmt.setString(7,s_ip);
	pstmt.executeUpdate();
	pstmt.close(); 

	} catch (Exception e) {
		out.println(e);

} 



%>

<!-----------------------------------------
* 메시지 보여주고 리스트 페이지로 이동하기*
------------------------------------------->

<html>
<head>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
</script>
</head>
<body>
</body>
</html>