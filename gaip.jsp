<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script language="javascript">
function valid_check(){
	if (document.form1.uid.value==""){
		alert("아이디를 입력하세요");
		document.form1.uid.focus();
		return false;
		}
	if (document.form1.uid.value.length<4){
		alert("아이디 4글자 이상 입력하세요");
		document.form1.uid.focus();
		return false;
		}
	if (document.form1.pw.value==""){
		alert("비밀번호를 입력하세요");
		document.form1.pw.focus();
		return false;
		}
	var exp =/(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[~!@#$%^&*+-=])(?=\S+$).{5,10}/;
	if (!document.form1.pw.value.match(exp)){
		alert("한개의 소문자 대문자 숫자 특수문자를 포함");
		document.form1.pw.focus();
		return false;
	}
	var p = /^(?=.*[0-9]).{2,3}/;
	if (!document.form1.hp.value.match(p)){
		alert("핸드폰번호는 숫자만 입력하세요(3자리)");
		document.form1.ph.focus();
		return false;
	}
	var p1 = /^(?=.*[0-9]).{3,4}/;
	if (!document.form1.hp1.value.match(p1)){
		alert("핸드폰중간 번호는 숫자만 입력하세요(4자리)");
		document.form1.ph1.focus();
		return false;
	}
	if (!document.form1.hp2.value.match(p1)){
		alert("핸드폰 끝 번호는 숫자만 입력하세요(4자리)");
		document.form1.ph2.focus();
		return false;
	}
	var em =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if (!document.form1.em.value.match(em)){
		alert("이메일을 제대로 입력하세요");
		document.form1.em.focus();
		return false;
	}
document.form1.submit();
}
</script>
</head>
<body>
<form method="post" action= "gaipdb_ok.jsp" name="form1">
<center><h2>홈페이지 회원가입</h2></center>
<center>
이름 : <input type="text" name="uname" size=10><br>
ID : <input type="text" name="uid" size=10><br>
Password : <input type="password" name="pw" size=10><br>
주소 : <input type="text" name="ad" size=70><br>
생년월일 : <input type="text" name="bd" size=4>년
		<input type="text" name="cd" size=3>월
		<input type="text" name="dd" size=3>일<br>
이메일 : <input type="text" name="em" size=20> <br>
<%-- 
생년월일 : <SELECT NAME="bd">
<OPTION>----</OPTION>
<OPTION>1990</OPTION>
<OPTION>1991</OPTION>
<OPTION>1992</OPTION>
<OPTION>1993</OPTION>
<OPTION>1994</OPTION>
<OPTION>1995</OPTION>
<OPTION>1996</OPTION>
<OPTION>1997</OPTION>
<OPTION>1998</OPTION>
<OPTION>1999</OPTION>
<OPTION>2000</OPTION>
<OPTION>2001</OPTION>
<OPTION>2002</OPTION>
<OPTION>2003</OPTION>
<OPTION>2004</OPTION>
<OPTION>2005</OPTION>
</SELECT>
<SELECT NAME="cd">
<OPTION>----</OPTION>
<OPTION>1</OPTION>
<OPTION>2</OPTION>
<OPTION>3</OPTION>
<OPTION>4</OPTION>
<OPTION>5</OPTION>
<OPTION>6</OPTION>
<OPTION>7</OPTION>
<OPTION>8</OPTION>
<OPTION>9</OPTION>
<OPTION>10</OPTION>
<OPTION>11</OPTION>
<OPTION>12</OPTION>
</SELECT>
<SELECT NAME="dd">
<OPTION>----</OPTION>
<OPTION>1</OPTION>
<OPTION>2</OPTION>
<OPTION>3</OPTION>
<OPTION>4</OPTION>
<OPTION>5</OPTION>
<OPTION>6</OPTION>
<OPTION>7</OPTION>
<OPTION>8</OPTION>
<OPTION>9</OPTION>
<OPTION>10</OPTION>
<OPTION>11</OPTION>
<OPTION>12</OPTION>
<OPTION>13</OPTION>
<OPTION>14</OPTION>
<OPTION>15</OPTION>
<OPTION>16</OPTION>
<OPTION>17</OPTION>
<OPTION>18</OPTION>
<OPTION>19</OPTION>
<OPTION>20</OPTION>
<OPTION>21</OPTION>
<OPTION>22</OPTION>
<OPTION>23</OPTION>
<OPTION>24</OPTION>
<OPTION>25</OPTION>
<OPTION>26</OPTION>
<OPTION>27</OPTION>
<OPTION>28</OPTION>
<OPTION>29</OPTION>
<OPTION>30</OPTION>
<OPTION>31</OPTION>
</SELECT><br>
--%>
핸드폰번호 : <input type="text" name="hp" size=3>-
		  <input type="text" name="hp1" size=7>-
          <input type="text" name="hp2" size=7><br>
주민등록번호 : <input type="text" name="jm" size=7>-
		   <input type="text" name="ju1" size=7><br>
성별 : <input type="radio" name="sex" value="man" />남자
      <input type="radio" name="sex" value="male" />여자<br>
직업 : <SELECT NAME="job">
<OPTION VALUE="">직업</OPTION>
<OPTION VALUE="1">학생</OPTION>
<OPTION VALUE="2">회사원</OPTION>
<OPTION VALUE="3">군인</OPTION>
<OPTION VALUE="4">주부</OPTION>
<OPTION VALUE="5">무직</OPTION>
<OPTION VALUE="6">기타</OPTION>
</SELECT><br>
<input type="button" value="전송" onclick="valid_check()">
<input type="reset" value="취소"><br>
<a href="gaip_list.jsp">리스트 보기</a>


</center>
</body>
</html>