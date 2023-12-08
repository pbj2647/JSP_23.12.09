<!--
■ 파  일  명 : insert.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.16(일)
■ 최종수정일 : 2003.3.16(일)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%

/******************
* 입력값 넘겨받기 *
******************/

String s_name=new String(request.getParameter("name").getBytes("8859_1"),"KSC5601"); // 한글 처리를 위해 KSC5601 코드로 변환
String s_password=request.getParameter("password");
String s_email=request.getParameter("email");
String s_homepage=request.getParameter("homepage");
String s_subject=new String(request.getParameter("subject").getBytes("8859_1"),"KSC5601");
String s_memo=new String(request.getParameter("memo").getBytes("8859_1"),"KSC5601");
String s_ip = request.getRemoteAddr();  // 클라이언트 PC의 IP


try {  // 예외 처리

/***********************************************
* SQL 문을 이용해 DB에 입력 값 저장(insert)하기*
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

} // 예외 처리를 위한 try 블록 끝.

stmt.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 stmt 닫기
Conn.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 Conn 닫기

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