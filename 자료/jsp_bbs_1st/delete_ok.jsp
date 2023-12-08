<!--
■ 파  일  명 : delete_ok.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.22(일)
■ 최종수정일 : 2003.3.22(일)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%

String s_password=request.getParameter("password");
String s_page=request.getParameter("page");
String s_number=request.getParameter("number");

String s_tablename="bbs";
String s_sql, s_msg="";


try {

	s_sql = "select number from "+s_tablename+" where number="+s_number+" and password='"+s_password+"'";
	rs = stmt.executeQuery(s_sql);

	if (rs.next()) {
		s_sql = "delete from "+s_tablename+" where number="+s_number;
		stmt.executeUpdate(s_sql);
		s_msg = "삭제하였습니다";
	} else {
		s_msg = "비밀번호가 틀립니다";
	}

} catch (Exception e) {
	out.println(e);
}

stmt.close();
Conn.close();

%>

<html><head>
<script name=javascript>
self.window.alert('<%= s_msg %>');
location.href='list.jsp?page=<%= s_page %>';
</script>
</head>
</html>