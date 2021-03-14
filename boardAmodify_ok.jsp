<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
PreparedStatement pstmt=null;
String sql="update boardA set title=?, contents=? where num=?";
int num=Integer.parseInt(request.getParameter("num"));
String title=request.getParameter("title");
String contents=request.getParameter("contents");
pstmt=con.prepareStatement(sql);
pstmt.setString(1,title);
pstmt.setString(2,contents);
pstmt.setInt(3,num);
pstmt.executeUpdate();
//response.sendRedirect("boardA.jsp");
%>