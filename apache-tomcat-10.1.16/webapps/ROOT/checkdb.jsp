<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB Connection Test</title>
    </head>
    <body>
        <%
            String DB_URL = "jdbc:mysql://localhost:3306/itmembers?useSSL=false&serverTimezone=UTC";
            String DB_USER = "root";
            String DB_PASSWORD = "root";

            Connection conn = null;
            Statement stmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                stmt = conn.createStatement();

                out.println("DB 연동 성공입니다!!");
            } catch(Exception e) {
                out.println(e.getMessage());
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
    </body>
</html>
