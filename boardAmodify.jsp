<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<script language="javascript">
function submit_modify(){
   document.form1.action="boardAmodify_ok.jsp";
   document.form1.submit();
}
function submit_list(){
   document.form1.action="boardAlist.jsp";
   document.form1.submit();
}
</script>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con=DriverManager.getConnection(cUrl);
PreparedStatement pstmt = null;
ResultSet rs = null;
int num = Integer.parseInt(request.getParameter("num"));
String sql="select writer, title, contents from boardA where num=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1,num);
rs = pstmt.executeQuery();
if (rs.next()==false){
   out.print("등록된 공지사항이 없습니다");
}
else{
   String writer = rs.getString("writer");
   String title = rs.getString("title");
   String contents = rs.getString("contents");
%>
<body>
<h3>공지사항 수정</h3>
<form name=form1 action="boardAmodify_ok.jsp" method="post">
<table border=1 width=500>
<tr>
<td>번호</td><td><%=num %></td>
</tr>
<tr>
<td>작성자</td><td><%=writer %></td>
</tr>
<tr>
<td>제목</td>
<td><input type="text" name="title" value=<%=title %>></td>
</tr>
<tr>
<td>내용</td>
<td><textarea name="contents" rows="5" cols="60">
<%=contents %></textarea></td>
</tr>
<tr>
<td colspan="2"><input type="button" value="수정완료" onclick="submit_modify()">

<input type="button" value="목록으로" onclick="submit_list()">
</td>
</tr>
</table>
<input type="hidden" name="num" value=<%=num %> %>
</form>
</body>
<%
}
%>
</html>