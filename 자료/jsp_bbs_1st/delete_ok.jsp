<!--
�� ��  ��  �� : delete_ok.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.22(��)
�� ���������� : 2003.3.22(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¸� ���� �ҽ��Դϴ�.
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
		s_msg = "�����Ͽ����ϴ�";
	} else {
		s_msg = "��й�ȣ�� Ʋ���ϴ�";
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