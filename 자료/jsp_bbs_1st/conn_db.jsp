<%

/************************************************
�� ��  ��  �� : conn_db.jsp
�� ��  ��  �� : �պ��� (www.itmembers.net)
�� �����ۼ��� : 2003.3.16(��)
�� ���������� : 2003.3.29(��)
�� www.itmembers.net�� JSP �Խ��� ����� ���¿�
�� JDBC Driver: Connector J 3.0.6 stable
*************************************************/

String drivers="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/itmembers";
String db_user="phpbbs";
String db_passwd="phpbbs";

try {
	Class.forName(drivers); // ����̹��� ã���ϴ�.
} catch (ClassNotFoundException e) {
	out.println(e.getMessage());
}

Connection Conn=null; // DB ���� ������ ���� Conn ����
Statement stmt=null; // Statement�� stmt ����(������ DB '���� ���' ������ ��)
ResultSet rs=null; // ResultSet�� rs ����. ������ ���� ��� ���� ���� ��ü

try {
   	Conn = DriverManager.getConnection(url+"?user="+db_user+"&password="+db_passwd+"&useUnicode=true&characterEncoding=euc-kr"); 
	// DB ����. Conn�� ���� ���� ����. �Ʒ��� ���� ��.
	// Conn = DriverManager.getConnection("jdbc:mysql://localhost/itmembers?user=phpbbs&password=phpbbs");
	stmt = Conn.createStatement(); // ���� ����(Conn)�� ������ ���� ���(stmt) ����
} catch (Exception e) {
	e.printStackTrace();
}

/* �� ��� ������ ���� ó�� ���� �Ʒ��� ���� ǥ���ص� ������.
Class.forName("com.mysql.jdbc.Driver"); 
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost/itmembers?user=phpbbs&password=phpbbs");
Statement stmt = Conn.createStatement();
*/

%>