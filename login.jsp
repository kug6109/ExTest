<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="utf-8" />
    <title>김윤기 홈페이지</title>
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
<input type="hidden" name="hid" value="yes"><br>
    <header id="main_h">
        <a href="E:\2015 과제파일\자바스크립트\홈페이지\home.html"><center><img src="mark.jpg" width="500" height="120" /></center></a>
    </header>
    <%if(session.getAttribute("G_uid")==null){%>
    <nav id="main_q">
<ul>
<li><form method="post" action="gaip_ssesion.jsp" name="form1">
아이디 : <input type="text" name="uid" size=10>
패스워드 : <input type="password" name="pw" size=10>
<input type="submit" value="로그인" onclick="valid_check()"> 
<input type="reset" value="취소">
<input type="submit" value="회원가입" onclick="valid_check()">
</form></li>
</ul>
</nav>
<%
} else {
%>
<div id="hi">
환영합니다!
<form method = "post" action ="logout.jsp" name="form1">
<input type = "submit" value="로그아웃" onclick="valid_check()" style = "float:left">
</form>
<form method = "post" action ="gaip_upd_ssesion.jsp" name="form1">
<input type = "submit" value="정보 수정" onclick="valid_check()" style = "position:absolute; top:91px; left:990px;">
</form>
</div>
<%} %>
        <nav id="main_m">
            <ul>
                <li><a href="#">Men</a></li>
                <li><a href="#">Women</a></li>
                <li><a href="#">Acc</a></li>
                <li><a href="#">Kids's</a></li>
                <li><a href="#">My</a></li>
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