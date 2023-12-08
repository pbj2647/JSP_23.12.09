<!--
■ 파  일  명 : list.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.16(일)
■ 최종수정일 : 2003.3.20(목)
■ www.itmembers.net의 JSP 게시판 만들기 강좌를 위한 소스입니다.
-->

<%@ page language="java" import="java.sql.*" contentType="text/html;charset=KSC5601" %>
<%@ include file="conn_db.jsp" %>

<%

String s_mail_addr; // 메일 주소가 있을 경우 작성자 이름에 메일 주소를 링크할 때 사용
String s_subject, s_name, s_email, s_sql;
int i_number, i_count;

int i_cur_num=0, i_total_no=0, i_total_page=0; // 가상 글 번호
int i_page_num = 10; // 한 화면에 보여줄 페이지 링크 갯수 -> 블록
int i_list_num = 10 ; // 한 페이지에 보여줄 게시물의 수
int i_total_block, i_block;
int i_first, i_last, i_block_prev, i_block_next, i_page_link;
int i_page, i_prev, i_next;
String s_page, s_writetime ;

s_page = request.getParameter("page"); // list.jsp?page=3 과 같이 넘어온 값 "3"을 넘겨받음.
if(s_page==null) s_page="1"; // 그냥 list.jsp로 했을 경우
i_page = Integer.parseInt(s_page);

int i_offset = i_list_num*(i_page-1); //한 페이지의 시작 글 번호(i_listnum 수만큼 나누었을 때 시작하는 글의 번호)

%>


<html>
<head>
<meta http-equiv=content-type content=text/html; charset=euc-kr>
<title>JSP 게시판 - 글목록보기</title>
<STYLE TYPE=text/css>
BODY,TD,SELECT,input,DIV,form,TEXTAREA,center,option,pre,i_blockquote {font-family:굴림;font-size:9pt;color:#555555;}
A:link    {color:black;text-decoration:none;}
A:visited {color:black;text-decoration:none;}
A:active  {color:black;text-decoration:none;}
A:hover   {color:gray; text-decoration:none;}
</STYLE>
</head>
<body background=./images/body_bg.gif>
<img src=./images/maintitle.gif>
<table border=1 cellspacing=0 width=680 bordercolordark=white bordercolorlight=#999999>
    <tr>
        <td width=30 bgcolor=#CCCCCC>
            <p align=center>no</p>
        </td>
        <td bgcolor=#CCCCCC width=490>
            <p align=center>subject</p>
        </td>
        <td width=60 bgcolor=#CCCCCC>
            <p align=center>name</p>
        </td>
        <td width=70 bgcolor=#CCCCCC>
            <p align=center>date</p>
        </td>
        <td width=30 bgcolor=#CCCCCC>
            <p align=center>hit</p>
        </td>
    </tr>

<%

try {

	rs=stmt.executeQuery("select count(number) from bbs");
	if(rs.next()) {
		i_total_no=rs.getInt(1);  //총 글수
	}

	if(i_total_no%i_list_num==0) { // 전체 글 수를 페이지당 글 수로 나눈 값의 올림 값 = 전체 페이지 수를 구합니다.
		i_total_page = i_total_no/i_list_num;
	} else {
		i_total_page = (i_total_no/i_list_num)+1; // 올림 수 구하기
	}

	i_cur_num = i_total_no - i_list_num*(i_page-1); // 현재 글의 가상 번호(실제 테이블의 number 값과는 다릅니다.)

	s_sql = "select number,subject,name,from_unixtime(writetime,'%Y/%m/%d'),count,email from bbs order by number desc limit "+i_offset+","+i_list_num;  
	// 목록 조회를 위한 SQL 문

	rs = stmt.executeQuery(s_sql); // 쿼리문 실행 결과 값을 담을 객체

	while(rs.next()) {
		i_number = rs.getInt(1);
		s_subject = rs.getString(2);
		s_name = rs.getString(3);
		s_writetime = rs.getString(4);
		i_count = rs.getInt(5);
		s_email = rs.getString(6);

		if(!s_email.equals("")) {
			s_mail_addr="<a href=mailto:"+s_email+">"+s_name+"</a>";
		} else {
			s_mail_addr=s_name;
		}

%>

    <tr>
        <td width=30>
            <p align=center><%=i_cur_num %></p>
        </td>
        <td width=490>
            <a href="view.jsp?page=<%= i_page %>&number=<%= i_number %>"><%=s_subject %></a>
        </td>
        <td width=60>
            <p align=center><%=s_mail_addr %></p>
        </td>
        <td width=70>
            <p align=center><%=s_writetime %></p>
        </td>
        <td width=30>
            <p align=center><%=i_count %></p>
        </td>
    </tr>

<%

		i_cur_num --;

	} //while문 닫음

	stmt.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 stmt 닫기
	Conn.close(); // 인클루드 파일(db_conn.jsp)에서 생성한 Conn 닫기

} catch (Exception e) {
		out.println(e);
}

%>

    <tr>
        <td width=100% colspan=5>


<%
/*************************************
*페이지 링크
**************************************/

if (i_total_page%i_page_num==0) { // 전체 블록의 수 : 전체 페이지 수를 한 화면에 보이는 페이지 수로 나눔
	i_total_block = i_total_page/i_page_num; 
} else {
	i_total_block = (i_total_page/i_page_num)+1; 
}

if (i_page%i_page_num==0) {
	i_block = i_page/i_page_num; // 현재 블록의 번호 : 
}
	else {
	i_block = (i_page/i_page_num)+1;
}

i_first = (i_block-1)*i_page_num; // 현재 블록이 시작하는 첫 페이지
i_last = i_block*i_page_num; // 현재 블록의 끝 페이지

if(i_block >= i_total_block) {
	i_last = i_total_page;
}

out.println("<p align=center>");

if(i_block >1) {
	i_block_prev = i_first -1;
	out.println("<a href='list.jsp?page=1'>[처음]</a>&nbsp;");
	out.println("<a href='list.jsp?page="+i_block_prev+"'>["+i_page_num+"개 앞]</a>");
}

if(i_page>1) {
	i_prev = i_page-1;
	out.println("<a href='list.jsp?page="+i_prev+"'>[이전]</a>&nbsp;	");
}

for (i_page_link=i_first+1;i_page_link<=i_last;i_page_link++) {
	if(i_page_link==i_page) {
		out.println("<font color=green><b>"+i_page_link+"</b></font>");
	} else {
		out.println("<a href='list.jsp?page="+i_page_link+"'>["+i_page_link+"]</a>");
	}
}

if (i_total_page > i_page) {
	i_next = i_page+1;
	out.println("&nbsp;<a href='list.jsp?page="+i_next+"'>[다음]</a>");
}

if (i_block < i_total_block) {
	i_block_next = i_last + 1;
	out.println("<a href='list.jsp?page="+i_block_next+"'>["+i_page_num+"개 뒤]</a>&nbsp;");
	out.println("<a href='list.jsp?page="+i_total_page+"'>[마지막]</a>&nbsp;");
}


%>
        </td>
    </tr>
    <tr>
        <td width=100% colspan=5>
            <p align=center><a href='write.html'>[글쓰기]</a></p>
        </td>
    </tr>
</table>
</body>
</html>