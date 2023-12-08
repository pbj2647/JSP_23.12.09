<%

String drivers="com.mysql.cj.jdc.Driver";
String url = "jdbc:mysql://localhost/itmembers";
String db_user="root";
String db_passwd="root";

try{
    Class.forName(drivers);
} catch (ClassNotFoundException e) {
    out.println(e.getMessage());
}

Connection Conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
    Conn =
    DriverManager.getConnection(url+"?user="+db_user+"&password="+db_passwd+"&useUnicode=true&characterEncoding=UTF-8");
    stmt = Conn.createStatement();
} catch (Exception e) {
    e.printStackTrace();
}

%>