<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경</title>
</head>
<%
//단계 1 JDBC 드라이버 로드
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//단계 2 연결 설정 : db 연결
String conURL = "jdbc:sqlserver://localhost:1433;databaseName=JSP;user=JSP1;password=1234";
Connection con=DriverManager.getConnection(conURL);
//단계 3 객체 생성
PreparedStatement pstmt = null;
ResultSet rs = null;
String userid = (String)session.getAttribute("G_uid");
out.print(userid);
String sql = "select * from member where uid=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1,userid);
rs = pstmt.executeQuery();
if (rs.next()==false)
	out.print("등록되지 않은 회원입니다.");
else
{
	String uname = rs.getString("uname");
	String pw = rs.getString("pw");
	String hp = rs.getString("hp");
	String hp1 = rs.getString("hp1");
	String hp2 = rs.getString("hp2");
	String ad = rs.getString("ad");
	String job = rs.getString("job");
%>
<body>
<h3>회원정보 변경</h3>
<from method = "post" action = "gaip_upd_ok.jsp" name = "form1">
<input type = "hidden" name = "wp" value = "<%=pw%> ">
<table width = 500 border=1>
<tr>
<td width= "40%">아이디</td>
<td>
<input type = "text" name = "uid" value = "<%=userid %>">
</td>
</tr>
<tr>
<td width= "40%">패스워드</td>
<td>
<input type = "text" name = "pw" value = "<%=pw %>">
</td>
</tr>
<tr>
<td width= "40%">이름</td>
<td>
<input type = "text" name = "uname" value = "<%=uname %>">
</td>
</tr>
<tr>
<td width= "40%">핸드폰 번호</td>
<td>
<input type = "text" name = "hp" value = "<%=hp %>">-
<input type = "text" name = "hp1" value = "<%=hp1 %>">-
<input type = "text" name = "hp2" value = "<%=hp2 %>">
</td>
</tr>
<tr>
<td width= "40%">주소</td>
<td>
<input type = "text" name = "af" value = "<%=ad %>">
</td>
</tr>
<tr>
<td width= "40%">직업</td>
<td>
<select name= "job">
<OPTION VALUE="">직업</OPTION>
<OPTION VALUE="1" <%if(job.equals("1")) out.print("selected"); %>>학생</OPTION>
<OPTION VALUE="2" <%if(job.equals("2")) out.print("selected"); %>>회사원</OPTION>
<OPTION VALUE="3" <%if(job.equals("3")) out.print("selected"); %>>군인</OPTION>
<OPTION VALUE="4" <%if(job.equals("4")) out.print("selected"); %>>주부</OPTION>
<OPTION VALUE="5" <%if(job.equals("5")) out.print("selected"); %>>무직</OPTION>
<OPTION VALUE="6" <%if(job.equals("6")) out.print("selected"); %>>기타</OPTION>
</select>
</td>
</tr>
<tr>
<td colspan="2">
<form name="from1" method="post" action="gaipdb_ok.jsp">
<input type = "submit" value = "변경" onclick="alert('변경되었습니다.');">
</form>
</td>
</tr>
</table>


</body>
<%
}
%>
</html>