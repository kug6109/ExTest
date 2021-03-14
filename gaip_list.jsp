<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원리스트 보여주기</title>
</head>
<body>
<h3>회원리스트</h3>
<table border=1 width=600>
<tr>
<th>회원이름</th><th>아이디</th><th>생년월일</th><th>주민번호</th><th>성별</th>
</tr>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
ResultSet rs = null;
Statement stmt=con.createStatement();
String sql="select uname, uid, bd, jm, sex from member order by uid";
rs = stmt.executeQuery(sql);
while(rs.next()){
	String uname = rs.getString("uname");
	String uid = rs.getString("uid");
	String bd = rs.getString("bd");
	String jm = rs.getString("jm");
	String sex = rs.getString("sex");
%>
<tr>
<td><%= uname%></td><td><%= uid%></td><td><%= bd%></td><td><%= jm%></td><td><%= sex%></td>
<td>
<form name="from1" method="post" action="gaip_upd.jsp">
<input type = "submit" name= "uid" value = "변경"></form>
<input type="submit" name="uid" value="삭제" onclick="alert('삭제되었습니다.');"/>
</td>
</td>
</tr>
<%
}
stmt.close();
rs.close();
con.close();
%>
</table>
<form name="from1" method="post" action="list_search.jsp">
이름검색 : <input type = "text" name = "uname"> <br>
<input type = "submit" value = "검색">
</form>
검색
</body>
</html>