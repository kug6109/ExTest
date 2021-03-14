<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
//단계 3 객체 생성
PreparedStatement pstmt = null;
//단계 4 입력값을 받아서 변수에 저장
String uname = request.getParameter("uname");
String uid = request.getParameter("uid");
String pw = request.getParameter("pw");
String jm = request.getParameter("jm");
String bd = request.getParameter("bd");
String hp = request.getParameter("hp");
String hp1 = request.getParameter("hp1");
String hp2 = request.getParameter("hp2");
String sex = request.getParameter("sex");
String job = request.getParameter("job");
//단계 5 sql문 생성
String sql = "insert into member(uid,pw,uname,jm,bd,hp,hp1,hp2,sex,job) values(?,?,?,?,?,?,?,?,?,?)";
pstmt = con.prepareStatement(sql);
//단계 6 ?에 값을 설정
pstmt.setString(1,uid);
pstmt.setString(2,pw);
pstmt.setString(3,uname);
pstmt.setString(4,jm);
pstmt.setString(5,bd);
pstmt.setString(6,hp);
pstmt.setString(7,hp1);
pstmt.setString(8,hp2);
pstmt.setString(9,sex);
pstmt.setString(10,job);
//단계 7  실행
pstmt.executeUpdate();
//단계 8  종료
pstmt.close();
con.close();
response.sendRedirect("home.jsp");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>db 연동 예제</title>
</head>
<body>
<a href="gaip_list.jsp">리스트 보기</a>
</body>
</html>