<!--
�� ��  ��  �� : insert.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.16(��)
�� ���������� : 2003.3.16(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¸� ���� �ҽ��Դϴ�.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%

/******************
* �Է°� �Ѱܹޱ� *
******************/

String s_name=new String(request.getParameter("name").getBytes("8859_1"),"KSC5601"); // �ѱ� ó���� ���� KSC5601 �ڵ�� ��ȯ
String s_password=request.getParameter("password");
String s_email=request.getParameter("email");
String s_homepage=request.getParameter("homepage");
String s_subject=new String(request.getParameter("subject").getBytes("8859_1"),"KSC5601");
String s_memo=new String(request.getParameter("memo").getBytes("8859_1"),"KSC5601");
String s_ip = request.getRemoteAddr();  // Ŭ���̾�Ʈ PC�� IP


try {  // ���� ó��

/***********************************************
* SQL ���� �̿��� DB�� �Է� �� ����(insert)�ϱ�*
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

} // ���� ó���� ���� try ��� ��.

stmt.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ stmt �ݱ�
Conn.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ Conn �ݱ�

%>

<!-----------------------------------------
* �޽��� �����ְ� ����Ʈ �������� �̵��ϱ�*
------------------------------------------->

<html>
<head>
<script language=javascript>
	self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
	location.href="list.jsp";
</script>
</head>
<body>
</body>
</html>