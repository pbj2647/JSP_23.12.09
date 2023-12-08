<!--
�� ��  ��  �� : view.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.20(��)
�� ���������� : 2003.3.20(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¸� ���� �ҽ��Դϴ�.
�� java.util.*: StringTokenizer ����� ����
-->

<%@ page language="java" import="java.sql.*,java.util.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%
String s_tablename = "bbs"; // ���̺� �̸�
String s_sql, s_number, s_name="", s_email="", s_homepage="", s_subject="", s_memo="" ;
String s_mail_addr="";
String s_page ;
int i_number, i_count=0, i_page ;

StringTokenizer st = null; // <br> ó���� ���ؼ�
String s_temp = "";

s_number = request.getParameter("number"); // view.jsp?number=10 �� ���� �Ѿ�� �� "10"�� ����.
i_number = Integer.parseInt(s_number);
s_page = request.getParameter("page"); // view.jsp?page=3 �� ���� �Ѿ�� �� "3"�� �Ѱܹ���.
if(s_page==null) s_page="1"; 
i_page = Integer.parseInt(s_page);

try {

	s_sql = "select name,count,email,homepage,subject,memo from "+s_tablename+" where number="+s_number;

	rs = stmt.executeQuery(s_sql); // ������ ���� ��� ���� ���� ��ü

	if(rs.next()) {
		s_name = rs.getString(1);
		i_count = rs.getInt(2);
		s_email = rs.getString(3);
		s_homepage = rs.getString(4);
		s_subject = rs.getString(5);
		s_memo = rs.getString(6);
	}

	if(!s_email.equals("")) {
		s_mail_addr="<a href=mailto:"+s_email+">"+s_email+"</a>";
	} else {
		s_mail_addr=s_email;
	}

	// Enter�� <br>�� ó��
	st = new StringTokenizer(s_memo,"\n");
	while(st.hasMoreTokens()) {
		s_temp = s_temp + st.nextToken()+"<br>";
	}
	s_memo = s_temp;

	s_sql = "update "+s_tablename+" set count = count + 1 where number = "+s_number;

	stmt.executeUpdate(s_sql); 

	stmt.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ stmt �ݱ�
	Conn.close(); // ��Ŭ��� ����(db_conn.jsp)���� ������ Conn �ݱ�

} catch (Exception e) {
		out.println(e);
}

%>

<html> 
<head>
<title>JSP �Խ��� ������Ʈ - ����</title>
<STYLE TYPE="text/css">
BODY,TD,SELECT,input,DIV,form,TEXTAREA,center,option,pre,blockquote {font-family:����;font-size:9pt;color:#555555;}
A:link    {color:black;text-decoration:none;}
A:visited {color:black;text-decoration:none;}
A:active  {color:black;text-decoration:none;}
A:hover  {color:gray;text-decoration:none;}
</STYLE>
</head>
<body bgcolor=white background=./images/body_bg.gif>
<img src=./images/maintitle.gif>
<table border=0 cellspacing=1 cellpadding="3" width=670>
	<tr>
	  <td align=center>
	  <font color=green><b>���� ���� ȭ���Դϴ�.</b></font>
	  </td>
	</tr>
    <tr>
	  <td bgcolor="#EAC3EA">
<table border=0 cellspacing=1 cellpadding=0 width=670 bgcolor="white">
	<tr>
	  <td width="100">
            <p align="right"><b>�̸� &nbsp;</b></p>

	  </td>
	  <td width="400">
                        <p><%= s_name %></p>
	  </td>
	  <td width="100">
                        <p align="right"><b>��ȸ�� &nbsp;</b></p>
	  </td>
	  <td>
                        <p><%= i_count %></p>
	  </td>
	</tr>
                <tr>
	  <td width="100">
                        <p align="right"><b>���ڿ��� &nbsp;</b></p>
	  </td>
	  <td colspan="3">
                        <p><%= s_mail_addr %></p>
	  </td>
                </tr>
                <tr>
	  <td width="100">
                        <p align="right"><b>Ȩ������ &nbsp;</b></p>
	  </td>
	  <td colspan="3">
                        <p><%= s_homepage %></p>
	  </td>
                </tr>
                <tr>
	  <td width="100">
                        <p align="right"><b>���� &nbsp;</b></p>
	  </td>
	  <td colspan="3">
                        <p><%= s_subject %></p>
	  </td>
                </tr>
	<tr>
	  <td width="100">
                        <p align="right"><b>���� &nbsp;</b></p>
	  </td>
	  <td colspan="3">
                        <p><%= s_memo %></p>
	  </td>
	</tr>
</table>
            <p align="center"><a href="list.jsp?page=<%= s_page %>">[���]</a> &nbsp;<a href="write.html">[����]</a> &nbsp;<a href="modify.jsp?number=<%= s_number %>&page=<%= s_page %>">[����]</a> &nbsp;<a href="delete.jsp?number=<%= s_number %>&page=<%= s_page %>">[����]</a></p>
	  </td>
    </tr>
</table>
</body>
</html>