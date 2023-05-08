<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.mypageheader{
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
	text-align: center;
}

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
    font-family: 'NanumSquareNeo-Variable_1000';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 1000;
    font-style: normal;
}

p{
	font-family: 'NanumSquareNeo-Variable_500';
}

a {
    color:inherit;
    text-decoration:none;
}

a.main_menu {
    font-family: 'NanumSquareNeo-Variable_300';
    font-size: 25px;
    color:inherit;
    text-decoration:none;
}

a.main_menu:hover{
  color: black;
  font-family: 'NanumSquareNeo-Variable_1000';
  text-decoration: none;
}

</style>

</head>
<body>


<table class="mypageheader" >
<tr>
<td width="20%">
	<img src="images/travelogLogo.jpg" height="200px">
</td>
<td valign="bottom">
	<p><strong><%=login.getId() %></strong>&nbsp;님의 마이페이지</p>
</td>
<td width="20%">
	<a class="main_menu" href="main.do">패키지</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a class="main_menu" href="commuhome.do">커뮤니티</a>
</td>
</tr>
</table>

</body>
</html>