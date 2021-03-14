<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
            <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8" />
	<title>Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            font-family: '굴림';
            min-width:760px;
        }
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
        }
        img {
            border: 0;
        }
        #main_h {
            width: 1200px;
            line-height:10px;
            padding-left:10px;
            border-bottom:1px solid black;
            margin: 0 auto;
            height: 120px;
            background:white;
            color:white;
        }
            #main_m {
               font-family: '양재샤넬체M';
                width:1200px;
                margin:0 auto;
                overflow: hidden;
                border-bottom: 1px solid black;
                background: #000000;
                padding:10px;
            }
        #main_m > ul {
            overflow: hidden;
            float: left;
        }
            #main_m > ul > li {
                float: left;
            }
        #main_m a {
            display: black;
            padding: 10px 20px;
            border-left: 1px solid #5f6673;
            border-right: 2px solid #242A37;
            color: purple;
            font-weight: bold;
        }
#main_q {
                width:1200px;
                margin:0 auto;
                overflow: hidden;
                border-bottom: 0px;
                background: #000000;
                padding:10px;
            }
#main_q > ul {
            overflow: hidden;
            float: right;
        }
#main_q > ul > li {
                float: right;
                color: white;
                font-family: '휴먼모음T';
            }
        #content {
            width: 1200px;
            margin: 0 auto;
            overflow: hidden;
	height: 900px;
        }
            #content > #main_s {
                width: 1200px;
                float: left;
            }
            #content > #main_a {
                width: 350px;
                float: left;
	    padding: 15px;
	    font-family: 'BOLD';
	  
            }
        #main_f {
            padding: 10px;
            border-top: 3px solid black;
            text-align: center;
        }
        #main_s > article.main_a {
            margin-bottom: 10px;
            padding: 15px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <header id="main_h">
        <a href="E:\2015 과제파일\자바스크립트\홈페이지\home.html"><center><img src="mark.jpg" width="500" height="120" /></center></a>
    </header>
        <nav id="main_m">
        <table >
        <td width = "33%" align = "right">
<%

Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
String cURL="jdbc:sqlserver://localhost:1433;databaseName=JSP_Book;user=JSP;password=1234";
Connection con = DriverManager.getConnection(cURL); 
PreparedStatement pstmt=null;
ResultSet rs=null;

String uid=request.getParameter("uid");
String pw=request.getParameter("pw");
String uname=request.getParameter("uname");

String sql="select uname from member where uid=? and pw=?";
pstmt=con.prepareStatement(sql);




pstmt.setString(1,uid);
pstmt.setString(2,pw);

rs=pstmt.executeQuery();

if(rs.next()==true){
	
	session.setAttribute("G_uid", uid);
	session.setAttribute("G_name",rs.getString("uname"));
	session.setMaxInactiveInterval(60*10); //10분 세션 유지
	out.println("");
	out.println(""); 
	out.print(rs.getString("uname")+"님 로그인 성공!");
	
	%>
	<br> <script language="javascript">
	location.href = 'login.jsp';
	</script>
	
<%
}
else {
	out.println("");%> 
	<script language="javascript">
	alert("로그인 실패!");
	location.href = 'login.jsp';

	</script> 
<% 
}
pstmt.close();
rs.close();
con.close();
%>

        </td>
        </table>
</nav>
        <nav id="main_m">
            <ul>
                <li><a onclick="alert('페이지 준비중.');">Men</a></li>
                <li><a onclick="alert('페이지 준비중.');">Women</a></li>
                <li><a onclick="alert('페이지 준비중.');">Acc</a></li>
                <li><a onclick="alert('페이지 준비중.');">Kids's</a></li>
                <li><a onclick="alert('페이지 준비중.');">My</a></li>
           </ul>
        </nav>
    <div id ="content">
        <section id="main_s">
            <article class="main_a">
                <script>
                    alert(navigator.userAgent);

                    window.onload = function () {  //바디를 실행시킨후 해당함수 실행시키는 것
                        var image = document.getElementById("image");
                        var i = 0;
                        setInterval(function () {
                            i++;
                            i = i % 3;
                            image.src = "a/" + i + ".jpg"
                        }, 3000);
                    }
       </script>
                <img src="a/2.jpg" width="1300" height="800" id="image"/>
            </article>
        </section>
      
    </div>
    <footer id="main_f"> 주소:충북 옥천군 충북도립대학 <br />전화번호:010-2449-2310</footer>
</body>
</html>