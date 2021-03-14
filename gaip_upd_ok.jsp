<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String conURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP;user=JSP1;password=1234";
Connection con=DriverManager.getConnection(conURL);
PreparedStatement pstmt = null;
String uname = request.getParameter("uname");
String uid = request.getParameter("uid");
String hp = request.getParameter("hp");
String hp1 = request.getParameter("hp1");
String hp2 = request.getParameter("hp2");
String pw = request.getParameter("pw");
String ad = request.getParameter("ad");
String job = request.getParameter("job");
String sql = "update member set uname =?, pw=?, hp=?, hp1=?, hp2=?, ad=?, job=? where uid=? and pw=? ";
pstmt=con.prepareStatement(sql);
pstmt.setString(1,uname);
pstmt.setString(2,uid);
pstmt.setString(3,pw);
pstmt.setString(4,hp);
pstmt.setString(5,hp1);
pstmt.setString(6,hp2);
pstmt.setString(7,ad);
pstmt.setString(8,job);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>