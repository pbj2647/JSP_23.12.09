/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.16
 * Generated at: 2023-12-20 14:41:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
import java.text.*;
import java.sql.*;
import java.io.*;

public final class delete_005fok_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/conn_db.jsp", Long.valueOf(1702990231348L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");

String postNum = request.getParameter("number");
// conn_db.jsp에서 생성한 Connection 객체를 가져옴
Connection conn = (Connection) pageContext.getAttribute("Conn");

String inputUsername = request.getParameter("username");
String inputPassword = request.getParameter("password");

try {
    String str_sql = "SELECT * FROM users WHERE username=' + inputUsername' AND password=' + inputPassword'";
    stmt = conn.createStatement();
    rs = stmt.executeQuery(str_sql);

    if (rs.next()) {
        String deleteSql = "DELETE FROM bbs WHERE number = " + postNum;
        stmt.executeUpdate(deleteSql);

      out.write("\r\n");
      out.write("        <script language=\"javascript\">\r\n");
      out.write("            alert(\"글을 삭제했습니다.\");\r\n");
      out.write("            location.href = \"list.jsp\";\r\n");
      out.write("        </script>\r\n");

    } else {

      out.write("\r\n");
      out.write("        <script language=\"javascript\">\r\n");
      out.write("            alert(\"이름 또는 비밀번호를 잘못 입력했습니다.\");\r\n");
      out.write("            location.href = \"delete.jsp?number=");
      out.print( postNum );
      out.write("\";\r\n");
      out.write("        </script>\r\n");

    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (stmt != null) stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
