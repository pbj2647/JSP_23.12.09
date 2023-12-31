<!--
■ 파  일  명 : modify_ok.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.20(일)
■ 최종수정일 : 2003.3.20(목)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%
String s_name=new String(request.getParameter("name").getBytes("8859_1"),"KSC5601"); // 한글 처리를 위해 KSC5601 코드로 변환
String s_password=request.getParameter("password");
String s_email=request.getParameter("email");
String s_homepage=request.getParameter("homepage");
String s_subject=new String(request.getParameter("subject").getBytes("8859_1"),"KSC5601");
String s_memo=new String(request.getParameter("memo").getBytes("8859_1"),"KSC5601");

String s_number = request.getParameter("number");
String s_page = request.getParameter("page");
if(s_page==null) s_page="1"; 

String s_tablename = "bbs"; // 테이블 이름
String s_sql, db_password = "", s_modify ="";

try {

	s_sql = "select password from "+s_tablename+" where number="+s_number;

	rs = stmt.executeQuery(s_sql); // 쿼리문 실행 결과 값을 담을 객체

	if(rs.next()) {
		db_password = rs.getString(1);
	}

	if(db_password.equals(s_password)) { // equals 메소드 대신 == 연산자 사용하면 오류남
		s_modify = "Y" ;
	} else {
		s_modify = "N" ;
	}

} catch (Exception e) {
		out.println(e);
}

if(s_modify == "Y") {

	try {

		s_sql = "update "+s_tablename+" set name='"+s_name+"',email='"+s_email+"',homepage='"+s_homepage+"', subject='"+s_subject+"',memo='"+s_memo+"' where number="+s_number;

		stmt.executeUpdate(s_sql);

	} catch (Exception e) {
		out.println(e);
	}

%>

<html>
<head>
<script name=javascript>
self.window.alert('수정하였습니다.');
location.href='list.jsp?page=<%=s_page%>';
</script>
</head>
</html>

<%

} else {

%>

<html>
<head>
<script name=javascript>
self.window.alert('비밀번호가 틀렸습니다.');
history.go(-1);
</script>
</head>
</html>

<%

}

stmt.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 stmt 닫기
Conn.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 Conn 닫기

%>