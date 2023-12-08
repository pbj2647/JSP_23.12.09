<!--
■ 파  일  명 : delete.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.22(토)
■ 최종수정일 : 2003.3.22(토)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" contentType="text/html;charset=KSC5601" %>

<%

String s_page=request.getParameter("page");
String s_number=request.getParameter("number");

%>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>글 삭제</title>
<STYLE TYPE="text/css">
BODY,TD,SELECT,input,DIV,form,TEXTAREA,center,option,pre,blockquote {font-family:굴림;font-size:9pt;color:#555555;}
A:link    {color:black;text-decoration:none;}
A:visited {color:black;text-decoration:none;}
A:active  {color:black;text-decoration:none;}
A:hover  {color:gray;text-decoration:none;}
</STYLE>

<script language="javascript">

function check_submit() {
	
	if (document.myForm.password.value == "") {
		alert('비밀번호를 입력해야 글을 삭제할 수 있습니다.');
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
            <p align="center">글 삭제 비밀번호</p>
        </td>
    </tr>
    <tr>
        <td align="center">
            <input type="password" name="password" maxlength="12" size="12">
        </td>
    </tr>
</table>

<p align="center">[<a href="javascript:check_submit();">삭제</a>] [<a href="javascript:history.go(-1)">취소</a>]</p>
</form>
</body>

</html>