<%@page import="mul.cam.a.dto.PaymentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8"); //파라미터 값에 한글이 들어가는 경우
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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

@keyframes anime_textup { 0% { top: 0; } 20% { top: -0.2rem; } 40% { top: 0 } 60% { top: 0 } 80% { top: 0 } 100% { top: 0 } }
 
.thanks_ani span {
    position: relative;
    animation: anime_textup 1.5s infinite;
}
 
.thanks_ani span:nth-of-type(1) {
    animation-delay: .1s;
}
.thanks_ani span:nth-of-type(2) {
    animation-delay: .2s;
}
.thanks_ani span:nth-of-type(3) {
    animation-delay: .3s;
}
.thanks_ani span:nth-of-type(4) {
    animation-delay: .4s;
}
.thanks_ani span:nth-of-type(5) {
    animation-delay: .5s;
}
.thanks_ani span:nth-of-type(6) {
    animation-delay: .6s;
}
.thanks_ani span:nth-of-type(7) {
    animation-delay: .7s;
}
.thanks_ani span:nth-of-type(8) {
    animation-delay: .8s;
}
.thanks_ani span:nth-of-type(9) {
    animation-delay: .9s;
}

div.thanks_ani span{
	font-size: 30px;
	font-family: 'NanumSquareNeo-Variable_500';
}


.table{
	font-family: 'NanumSquareNeo-Variable_500';
}

.trS{
	margin: 5px;
	background-color: rgba(0,0,0,0.05);
}

button.btn_payment {
    padding: 5px 30px;
    border-radius: 15px;
    text-decoration: none;
    background-color: #2873F6;
    border: 3px solid #2873F6;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

button.btn_payment:hover {
    background-color: white;
    color: #2873F6;
    font-family: 'NanumSquareNeo-Variable_500';
}

</style>

</head>
<body>

<div class="thanks_ani">
    <span>T</span>
    <span>r</span>
    <span>a</span>
    <span>V</span>
    <span>e</span>
    <span>l</span>
    <span>o</span>
    <span>g</span>
    <span>!</span>
</div>

<br/><br/>


<table class="table" style="width:70%; border: 1">
<col width="40%" /><col width="20%" /><col width="15%" /><col width="20%" />
<tr class="trS">
	<th><h2>구매한 상품 정보</h2></th><th style="border-left: 1px solid; border-right: 1px solid"><h2>결제 완료 금액</h2></th><th colspan="2"><h2>주문자 정보</h2></th>
</tr>
<tr>
	<td rowspan="4" style="padding-top: 10px"><div align="center"><input type="image" width="300px" readonly="readonly" src="<%= request.getParameter("pImg") %>"></div></td>
	<td rowspan="6" style="border-left: 1px solid; border-right: 1px solid"><div align="center"><h2><%= request.getParameter("pPrice") %> 원</h2></div></td>
	<td><h4 align="center">구매자 이름</h4></td><td><h5 align="center"><%= request.getParameter("bName") %></h5></td>
</tr>
<tr>
	<td><h4 align="center">구매자 이메일</h4></td><td><h5 align="center"><%= request.getParameter("bEmail") %></h5></td>
</tr>
<tr>
	<td><h4 align="center">구매자 전화번호</h4></td><td><h5 align="center"><%= request.getParameter("bTel") %></h5></td>
</tr>
<tr>
	<td><h4 align="center">구매자 주소</h4></td><td><h5 align="center"><%= request.getParameter("bAddr") %></h5></td>
</tr>
<tr>
	<td rowspan="2" style="padding-top: 10px"><h4 align="center"><%= request.getParameter("pName") %></h4></td>
	<td><h4 align="center">카드 승인번호</h4></td><td><h5 align="center"><%= request.getParameter("approvalNumber") %></h5></td>
</tr>
<tr>
	<td><h4 align="center">상점 거래ID</h4></td><td><h5 align="center"><%= request.getParameter("merchant_uid") %></h5></td>
</tr>
</table>
<br>

<!-- 상품 둘러보기 -->
<button style="width: 300px; height: 50px; font-size: 20px" class="btn_payment" type="button" onclick="location.href='mypage.do'">결제 내역 확인</button>
<br><br>


</body>
</html>