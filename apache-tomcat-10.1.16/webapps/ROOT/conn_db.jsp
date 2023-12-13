<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
String drivers = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/itmembers?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
String db_user = "root";
String db_passwd = "root";

Connection Conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName(drivers);
    Conn = DriverManager.getConnection(url, db_user, db_passwd);
    stmt = Conn.createStatement();

    // Connection 객체를 속성으로 저장
    pageContext.setAttribute("Conn", Conn);
} catch (Exception e) {
    e.printStackTrace();
}
%>
