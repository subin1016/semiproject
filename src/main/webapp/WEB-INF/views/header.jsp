<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
%>  
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>

@font-face {
    font-family: 'NanumSquareNeo-Variable_300';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 300;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_500';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 500;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_1000';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 1000;
    font-style: normal;
}

a.main_menu {
    font-family: 'NanumSquareNeo-Variable_300';
    font-size: 30px;
}

a.login, p {
    font-family: 'NanumSquareNeo-Variable_500';
}

a.main_menu:hover{
  color: black;
  font-family: 'NanumSquareNeo-Variable_1000';
  text-decoration: none;
}

div.absolute {
    position: absolute;
    top: 20px;
    left: 43%
}

button#btn {
    padding: 5px 30px;
    border-radius: 15px;
    font-family: 'NanumSquareNeo-Variable_500';
    text-decoration: none;
    border: 3px solid #EDA98B;
    color: #EDA98B;
    background-color: white;
}

button#btn:hover {
    background-color: #EDA98B;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

</style>

<div align="left">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="https://www.0404.go.kr/dev/newest_list.mofa" target="_blank">
		<img src="images/warning.png" width="20px">
		해외입국안전정보
	</a>
</div>

<div class="absolute">
	<img src="images/travelogLogo.jpg" width="200px">
</div>



<br><br><br><br><br><br><br>
<table style="width: 100%;">
<tr height="100px">
	<td align="left" style="width: 20%">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="main_menu" href="main.do">패키지</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a class="main_menu" href="commuhome.do">커뮤니티</a>
	</td>
	<td style="height: 30px"></td>
	<td align="right" style="width: 30%">
		<%if(login == null){ %>
			<a class="login" href="login.do">로그인</a>
			&nbsp;&nbsp;
		<%} else{ %>
			<p>안녕하세요, <strong><%=login.getId() %>&nbsp;</strong>님</p>
			<a class="login" href="logout.do">로그아웃</a>
			&nbsp;&nbsp;
		<%} %>
		<button type="button" id="btn" onclick="location.href='mypage.do'">MyPage</button>&nbsp;
	</td>
</tr>
</table>