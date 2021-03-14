<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
</head>
<script language="javascript">
function submit_mod(){
   document.form1.action="boardAmodify.jsp";
   document.form1.submit();
}
function submit_del(){
   document.form1.action="boardAdelete.jsp";
   document.form1.submit();
}
</script>
<%
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cUrl = "jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con=DriverManager.getConnection(cUrl);
PreparedStatement pstmt=null;
ResultSet rs = null;
int num = Integer.parseInt(request.getParameter("num"));
String sql="select writer, title, contents from boardA where num=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1,num);
rs = pstmt.executeQuery();
   if (rs.next()==false){
      out.print("등록된 공지사항이 없습니다.");
   }else
   {
      String title=rs.getString("title");
      String writer=rs.getString("writer");
      String contents=rs.getString("contents");
      %>
<body>
      <h3>공지사항 상세보기</h3>
      <form name=form1 action="boardAmodify.jsp" method="post">
      <table width= 500 border= 1>
      <tr>
<td>번호</td><td><%=num %></td>
</tr>
<tr>
<td>작성자</td><td><%=writer %></td>
</tr>
<tr>
<td>제목</td><td><%=title %></td>
</tr>
<tr>
<td>내용</td><td><%=contents %></td>
</tr>
<tr>
<tr>
<td colspan="2"><input type = "button" value = "수정하기" onclick = "submit_mod();"></td>
<td colspan="2"><input type = "button" value = "삭제하기" onclick = "submit_del();"></td>
</tr>
</table>
<input type="hidden" name="num" value=<%=num %>>
</form>

</body>
      <%
}
%>
</html>