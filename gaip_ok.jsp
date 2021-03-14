<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 실행</title>
</head>
<body>
<%
String uid = request.getParameter("uid");
String pw = request.getParameter("pw");
String bd = request.getParameter("bd");
String cd = request.getParameter("cd");
String dd = request.getParameter("dd");
String ad = request.getParameter("ad");
String ph = request.getParameter("hp");
String ph1 = request.getParameter("hp1");
String ph2 = request.getParameter("hp2");
String c = request.getParameter("c");
String ja = request.getParameter("job");
String ju = request.getParameter("jm");
String ju1 = request.getParameter("ju1");
String e = request.getParameter("em");
%>
너의 아이디는 <%=uid %>입니다. <br>
너의 비밀번호는 <%=pw %>입니다. <br>
너의 주소는 <%=ad %>입니다. <br>
너의 생년월일 <%=bd %>년 <%=cd %>월 <%=dd %>일 입니다. <br>
너의 번호는 <%=ph %>-<%=ph1 %>-<%=ph2 %>입니다. <br>
너의 성별은 <%=c %>입니다. <br>
너의 주민등록번호는 <%=ju %> - <%=ju1 %>입니다. <br>
너의 직업은 <%=ja %>입니다.
너의 이메일은 <%=e %>입니다.
</body>
</html>