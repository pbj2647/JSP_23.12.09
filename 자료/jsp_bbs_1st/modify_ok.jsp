<!--
�� ��  ��  �� : modify_ok.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.20(��)
�� ���������� : 2003.3.20(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¸� ���� �ҽ��Դϴ�.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%
String s_name=new String(request.getParameter("name").getBytes("8859_1"),"KSC5601"); // �ѱ� ó���� ���� KSC5601 �ڵ�� ��ȯ
String s_password=request.getParameter("password");
String s_email=request.getParameter("email");
String s_homepage=request.getParameter("homepage");
String s_subject=new String(request.getParameter("subject").getBytes("8859_1"),"KSC5601");
String s_memo=new String(request.getParameter("memo").getBytes("8859_1"),"KSC5601");

String s_number = request.getParameter("number");
String s_page = request.getParameter("page");
if(s_page==null) s_page="1"; 

String s_tablename = "bbs"; // ���̺� �̸�
String s_sql, db_password = "", s_modify ="";

try {

	s_sql = "select password from "+s_tablename+" where number="+s_number;

	rs = stmt.executeQuery(s_sql); // ������ ���� ��� ���� ���� ��ü

	if(rs.next()) {
		db_password = rs.getString(1);
	}

	if(db_password.equals(s_password)) { // equals �޼ҵ� ��� == ������ ����ϸ� ������
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
self.window.alert('�����Ͽ����ϴ�.');
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
self.window.alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');
history.go(-1);
</script>
</head>
</html>

<%

}

stmt.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ stmt �ݱ�
Conn.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ Conn �ݱ�

%>