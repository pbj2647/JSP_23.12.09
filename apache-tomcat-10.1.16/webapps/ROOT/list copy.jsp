<%@ page language="java" import="java.sql.*" contentType="text/html;charset=UTF-8" %>
<%@ include file="conn_db.jsp" %>

<%
String s_mail_addr;
String s_subject, s_name, s_email, s_sql;
int i_number, i_count;

int i_cur_num=0, i_total_no=0, i_total_page=0;
int i_page_num = 10;
int i_list_num = 10;
int i_total_block, i_block;
int i_first, i_last, i_block_prev, i_block_next, i_page_link;
int i_page, i_prev, i_next;
String s_page, s_writetime;

s_page = request.getParameter("page");
if(s_page==null) s_page="1";
i_page = Integer.parseInt(s_page);

int i_offset = i_list_num*(i_page-1);

try {
    rs = stmt.executeQuery("select count(number) from bbs");
    if(rs.next()) {
        i_total_no = rs.getInt(1);
    }

    if(i_total_no%i_list_num==0) {
        i_total_page = i_total_no/i_list_num;
    } else {
        i_total_page = (i_total_no/i_list_num)+1;
    }

    i_cur_num = i_total_no - i_list_num*(i_page-1);

    s_sql = "select number,subject,name,from_unixtime(writetime,'%Y/%m/%d'),count,email from bbs order by number desc limit "+i_offset+","+i_list_num;

    rs = stmt.executeQuery(s_sql);

    while(rs.next()) {
        i_number = rs.getInt(1);
        s_subject = rs.getString(2);
        s_name = rs.getString(3);
        s_writetime = rs.getString(4);
        i_count = rs.getInt(5);
        s_email = rs.getString(6);

        if(!s_email.equals("")) {
            s_mail_addr = "<a href=mailto:"+s_email+">"+s_name+"</a>";
        } else {
            s_mail_addr = s_name;
        }
%>
    <tr>
        <td width="30">
            <p align="center"><%=i_cur_num %></p>
        </td>
        <td width="490">
            <a href="view.jsp?page=<%= i_page %>&number=<%= i_number %>"><%=s_subject %></a>
        </td>
        <td width="60">
            <p align="center"><%=s_mail_addr %></p>
        </td>
        <td width="70">
            <p align="center"><%=s_writetime %></p>
        </td>
        <td width="30">
            <p align="center"><%=i_count %></p>
        </td>
    </tr>
<%
        i_cur_num--;
    }

    stmt.close();
    Conn.close();

} catch (Exception e) {
    out.println(e);
}
%>
    <tr>
        <td width="100%" colspan="5">
<%
if (i_total_page%i_page_num==0) {
    i_total_block = i_total_page/i_page_num;
} else {
    i_total_block = (i_total_page/i_page_num)+1;
}

if (i_page%i_page_num==0) {
    i_block = i_page/i_page_num;
} else {
    i_block = (i_page/i_page_num)+1;
}

i_first = (i_block-1)*i_page_num;
i_last = i_block*i_page_num;

if(i_block >= i_total_block) {
    i_last = i_total_page;
}

out.println("<p align=center>");

if(i_block > 1) {
    i_block_prev = i_first -1;
    out.println("<a href='list.jsp?page=1'>[처음]</a> ");
    out.println("<a href='list.jsp?page="+i_block_prev+"'>["+i_page_num+"개 앞]</a>");
}

if(i_page > 1) {
    i_prev = i_page-1;
    out.println("<a href='list.jsp?page="+i_prev+"'>[이전]</a>         ");
}

for (i_page_link=i_first+1; i_page_link<=i_last; i_page_link++) {
    if(i_page_link==i_page) {
        out.println("<font color=green><b>"+i_page_link+"</b></font>");
    } else {
        out.println("<a href='list.jsp?page="+i_page_link+"'>["+i_page_link+"]</a>");
    }
}

if (i_total_page > i_page) {
    i_next = i_page+1;
    out.println(" <a href='list.jsp?page="+i_next+"'>[다음]</a>");
}

if (i_block < i_total_block) {
    i_block_next = i_last + 1;
    out.println("<a href='list.jsp?page="+i_block_next+"'>["+i_page_num+"개 뒤]</a> ");
    out.println("<a href='list.jsp?page="+i_total_page+"'>[마지막]</a> ");
}
%>
        </td>
    </tr>
    <tr>
        <td width="100%" colspan="5">
            <p align="center"><a href='write.html'>[글쓰기]</a></p>
        </td>
    </tr>
</table>
</body>
</html>
