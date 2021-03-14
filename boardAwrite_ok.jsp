<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
PreparedStatement pstmt=null;
try{
    String writer=request.getParameter("writer");
    String title=request.getParameter("title");
    String contents=request.getParameter("contents");
    String sql ="insert into boardA (title, writer, contents) values(?,?,?)";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1,title);
    pstmt.setString(2,writer);
    pstmt.setString(3,contents);
    pstmt.executeUpdate();    
}
catch(SQLException e){
   out.print(e.getMessage());
}
finally{
   if (pstmt != null) pstmt.close();
   if (con != null) con.close();
}
response.sendRedirect("boardAlist.jsp");
%>