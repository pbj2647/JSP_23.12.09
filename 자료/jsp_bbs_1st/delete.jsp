<!--
�� ��  ��  �� : delete.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.22(��)
�� ���������� : 2003.3.22(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¸� ���� �ҽ��Դϴ�.
-->

<%@ page language="java" contentType="text/html;charset=KSC5601" %>

<%

String s_page=request.getParameter("page");
String s_number=request.getParameter("number");

%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>�� ����</title>
<STYLE TYPE="text/css">
BODY,TD,SELECT,input,DIV,form,TEXTAREA,center,option,pre,blockquote {font-family:����;font-size:9pt;color:#555555;}
A:link    {color:black;text-decoration:none;}
A:visited {color:black;text-decoration:none;}
A:active  {color:black;text-decoration:none;}
A:hover  {color:gray;text-decoration:none;}
</STYLE>

<script language="javascript">

function check_submit() {
	
	if (document.myForm.password.value == "") {
		alert('��й�ȣ�� �Է��ؾ� ���� ������ �� �ֽ��ϴ�.');
		document.myForm.password.focus();
		return;
		
	} else {
		document.myForm.action = "delete_ok.jsp";
		document.myForm.submit();
	}
	
}

</script>

</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<form name="myForm" method="post">
<input type="hidden" name="page" value="<%= s_page %>">
<input type="hidden" name="number" value="<%= s_number %>">

<table align="center" border="1" cellspacing="0" width="200" bordercolordark="white" bordercolorlight="#CCCCCC">
    <tr>
        <td>
            <p align="center">�� ���� ��й�ȣ</p>
        </td>
    </tr>
    <tr>
        <td align="center">
            <input type="password" name="password" maxlength="12" size="12">
        </td>
    </tr>
</table>

<p align="center">[<a href="javascript:check_submit();">����</a>] [<a href="javascript:history.go(-1)">���</a>]</p>
</form>
</body>

</html>