<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
PreparedStatement pstmt=null;
int num=Integer.parseInt(request.getParameter("num"));
String sql="delete from boardA where num=?";
pstmt=con.prepareStatement(sql);
pstmt.setInt(1,num);
pstmt.executeUpdate();
response.sendRedirect("boardAlist.jsp");
%>