<!--
■ 파  일  명 : modify.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.20(일)
■ 최종수정일 : 2003.3.20(목)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%
String s_tablename = "bbs"; // 테이블 이름
String s_sql, s_number, s_name="", s_email="", s_homepage="", s_subject="", s_memo="", s_password="" ;
String s_page ;

s_number = request.getParameter("number"); // view.jsp?s_number=10 과 같이 넘어온 값 "10"을 받음.
s_page = request.getParameter("page"); // view.jsp?s_page=3 과 같이 넘어온 값 "3"을 넘겨받음.
if(s_page==null) s_page="1"; 

try {

	s_sql = "select name,email,homepage,subject,memo from "+s_tablename+" where number="+s_number;

	rs = stmt.executeQuery(s_sql); // 쿼리문 실행 결과 값을 담을 객체

	if(rs.next()) {
		s_name = rs.getString(1);
		s_email = rs.getString(2);
		s_homepage = rs.getString(3);
		s_subject = rs.getString(4);
		s_memo = rs.getString(5);
	}

	stmt.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 stmt 닫기
	Conn.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 Conn 닫기

} catch (Exception e) {
		out.println(e);
}

%>

<html> 
<head>
<title>JSP 게시판 프로젝트 - 수정</title>

<STYLE TYPE="text/css">
BODY,TD,SELECT,input,DIV,form,TEXTAREA,center,option,pre,blockquote {font-family:굴림;font-size:9pt;color:#555555;}
A:link    {color:black;text-decoration:none;}
A:visited {color:black;text-decoration:none;}
A:active  {color:black;text-decoration:none;}
A:hover  {color:gray;text-decoration:none;}
</STYLE>


<script language="javascript">

function check_submit() {
	
	if (document.myForm.name.value == "") {
		alert('이름을 입력하세요');
		document.myForm.name.focus();
		return;
		
	} else if (document.myForm.password.value == "") {
		alert('비밀번호를 입력해야 글을 수정하거나 삭제할 수 있습니다.');
		document.myForm.password.focus();
		return;
		
	} else if (document.myForm.subject.value == "") {
		alert('제목을 입력하세요');
		document.myForm.subject.focus();
		return;
		
	} else if (document.myForm.memo.value == "") {
		alert('내용을 입력하세요');
		document.myForm.memo.focus();
		return;
		
	} else {
		document.myForm.action = "modify_ok.jsp";
		document.myForm.submit();
	}
	
}

</script>

</head>

<body bgcolor=white background=./images/body_bg.gif>

<img src=./images/maintitle.gif>

<br>

<form name='myForm' method='post' >

<input type=hidden name=page value='<%= s_page %>'>
<input type=hidden name=number value='<%= s_number %>'>

<table border=0 cellspacing=1 cellpadding=0 width=670>
	<tr>
	  <td align=center>
	  <font color=green><b>글 수정 화면입니다.</b></font>
	  </td>
	</tr>
</table>

<table border=0 bgcolor=#CCCCF><tr><td>

<table border=0 width=670 cellspacing=0 cellpadding=0 bgcolor=#F0F0F0>

	<col width=100></col><col width=></col>

	<tr>
  	<td colspan=2>
	     <table border=0 cellspacing=0 cellpadding=0 width=100%>
  	  	 <tr>
    	  	  <td width=100 align=right><b>이름&nbsp;</b></td>
      	  	<td><input type=text name=name size=20  maxlength=20 value= '<%= s_name %>'></td>      	  	
	      	  <td width=100 align=right><b>비밀번호&nbsp;</b></td>
  	      	<td><input type=password name=password  size=20  maxlength=20 value=''></td>
	    	 </tr>
			</table>
	  </td>
	</tr>

	<tr><td bgcolor=white height=1 colspan=2></td></tr>
	
	<tr>
	  <td align=right><b>전자우편&nbsp;</b></td>
	  <td> <input type=text name=email size=40  maxlength=200 value='<%= s_email %>'> </td>
	</tr>
	
	<tr><td bgcolor=white height=1 colspan=2></td></tr>

	<tr>
	  <td align=right><b>홈페이지&nbsp;</b></td>
	  <td> <input type=text name=homepage size=40  maxlength=200 value='<%= s_homepage %>'> </td>
	</tr>

	<tr><td bgcolor=white height=1 colspan=2></td></tr>

	<tr>
	  <td align=right><b>제목&nbsp;</b></td>
	  <td> <input type=text name=subject size=87  maxlength=200 value='<%= s_subject %>'> </td>
	</tr>

	<tr><td bgcolor=white height=1 colspan=2></td></tr>

	<tr>
	  <td align=right><b>내용&nbsp;</b></td>
	  <td valign=top>
	  <textarea name=memo cols=85 rows=20><%= s_memo %></textarea>
	  </td>
	</tr>

</table>
 
<br>

<table border=0 width=670>
<tr><td>
<center>
<a href="javascript:check_submit();"><img src='./images/write.gif' border=0></a> &nbsp;&nbsp;
<a href="list.jsp?page=<%= s_page %>"><img src=./images/list.gif border=0></a>
</center>
</td></tr>
</table>
</td></tr></table>

</form>

</body>
</html>