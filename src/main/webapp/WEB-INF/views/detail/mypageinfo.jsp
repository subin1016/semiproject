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

li{
	list-style: none;
}

.list{
	padding: 30px;
	margin-left: 30px;
	margin-right: 30px;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	border-radius: 30px;
}

button#btn {
    padding: 10px 30px;
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

</head>
<body>

<div class="list">
	<ul>
		<li><img src="images/user.png" width="30px"> &nbsp;&nbsp;<%=login.getName() %>  ( <%=login.getBdate() %> )</li><hr>
		<li><img src="images/email.png" width="30px"> &nbsp;&nbsp;<%=login.getEmail() %></li><hr>
		<li><img src="images/phone.png" width="30px"> &nbsp;&nbsp;<%=login.getPhone() %></li><hr>
		<li><img src="images/pwd.png" width="30px"> &nbsp;&nbsp;<%=login.getPwd() %></li><hr>
	</ul><br>
	
	<div align="right">
		<button type="button" id="btn" onclick="location.href='infoupdate.do'">비밀번호 변경 / 내 정보 수정</button>
	</div>
</div>

</body>
</html>