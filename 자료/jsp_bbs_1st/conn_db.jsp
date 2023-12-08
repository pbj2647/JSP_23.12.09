<%

/************************************************
■ 파  일  명 : conn_db.jsp
■ 작  성  자 : 손병목 (www.itmembers.net)
■ 최초작성일 : 2003.3.16(일)
■ 최종수정일 : 2003.3.29(토)
■ www.itmembers.net의 JSP 게시판 만들기 강좌용
■ JDBC Driver: Connector J 3.0.6 stable
*************************************************/

String drivers="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost/itmembers";
String db_user="phpbbs";
String db_passwd="phpbbs";

try {
	Class.forName(drivers); // 드라이버를 찾습니다.
} catch (ClassNotFoundException e) {
	out.println(e.getMessage());
}

Connection Conn=null; // DB 연결 정보를 담을 Conn 선언
Statement stmt=null; // Statement형 stmt 선언(일종의 DB '연결 통로' 역할을 함)
ResultSet rs=null; // ResultSet형 rs 선언. 쿼리문 실행 결과 값을 담을 객체

try {
   	Conn = DriverManager.getConnection(url+"?user="+db_user+"&password="+db_passwd+"&useUnicode=true&characterEncoding=euc-kr"); 
	// DB 연결. Conn에 연결 정보 저장. 아래와 같은 뜻.
	// Conn = DriverManager.getConnection("jdbc:mysql://localhost/itmembers?user=phpbbs&password=phpbbs");
	stmt = Conn.createStatement(); // 연결 정보(Conn)를 가지고 연결 통로(stmt) 생성
} catch (Exception e) {
	e.printStackTrace();
}

/* 위 모든 문장을 예외 처리 없이 아래와 같이 표시해도 가능함.
Class.forName("com.mysql.jdbc.Driver"); 
Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost/itmembers?user=phpbbs&password=phpbbs");
Statement stmt = Conn.createStatement();
*/

%>