<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지형 게시판</title>
</head>
<body>
<h3>공지형 게시판</h3>
<form name="form1" action="boardAlist.jsp" method="post">
<table border=1 width="600">
<tr bgcolor="cccccc">
<th width="10%">번호</th>
<th width="*">제목</th>
<th width="15%">작성자</th>
<th width="17%">등록일</th>
<th width="10%">조회수</th>
</tr>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cUrl);
Statement stmt=null;
ResultSet rs = null;
ResultSet rs1 = null;
stmt = con.createStatement();
String sql1 ="select count(*) from boardA";
rs1 = stmt.executeQuery(sql1);
rs1.next();
if (rs1.getInt(1)==0){
%>
<tr>
<td colspan="5">등록된 공지가 없습니다</td>
</tr>
<%
}   
else{
String sql ="select num, title, writer, writedt, readcnt from boardA";
rs = stmt.executeQuery(sql);
while(rs.next()){
   int num=rs.getInt("num");
   String title = rs.getString("title");
   String writer = rs.getString("writer");
   String writedt = rs.getString("writedt");
   int readcnt = rs.getInt("readcnt");
%>
<tr>
<td><a href="boardAview.jsp?num=<%=num%>"><%=num %></a></td>
<td><%=title %></td>
<td><%=writer %></td>
<td><%=writedt %></td>
<td><%=readcnt %></td>
<%
}
}
%>
</table></form>
<form name="form2" action="boardAwrite.jsp" method="post">
<input type="submit" value="새 글쓰기"> 
</form>
</body>
</html>