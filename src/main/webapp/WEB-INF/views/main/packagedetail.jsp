<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mul.cam.a.util.productUtil"%>
<%@page import="mul.cam.a.dto.ProductDto"%>
<%@page import="mul.cam.a.util.CalendarUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = (Integer)request.getAttribute("seq");
	String locid = (String)request.getAttribute("locid");
	List<ProductDto> list = new ArrayList<ProductDto>();
	if (locid == null || locid.equals("null")){
		list = productUtil.getBannerDate("https://www.modetour.com/main/default.aspx", seq+1);
	}else{
		list = productUtil.getProductdata("https://www.modetour.com/pkg/?MLoc=01&startlocation=ICN&Theme=THE88&id=" + locid, seq+1);	
	}
	
	ProductDto p = list.get(seq);
	int price = Integer.parseInt(p.getPrice().substring(0, p.getPrice().length()-2).replace(",", ""));
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


html, a {
    font-family: 'NanumSquareNeo-Variable_700';
}

body, ul, li, h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_700';
}

a {
    color:inherit;
    text-decoration:none;
}

td.select:hover{
	background-color: rgb(144, 212, 246);
}

button.bt_want {
    padding: 5px 30px;
    border-radius: 15px;
    font-family: 'NanumSquareNeo-Variable_500';
    text-decoration: none;
    border: 3px solid #2873F6;
    color: #2873F6;
    background-color: white;
}

button.bt_want:hover {
    background-color: #2873F6;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

button.bt_buy {
    padding: 5px 30px;
    border-radius: 15px;
    text-decoration: none;
    background-color: #2873F6;
    border: 3px solid #2873F6;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

button.bt_buy:hover {
    background-color: #2873F6;
    font-family: 'NanumSquareNeo-Variable_500';
}

</style>
</head>
<body>

<%
	Calendar cal = Calendar.getInstance();
	
	String syear = request.getParameter("year");
	String smonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR);
	if(CalendarUtil.nvl(syear) == false){	// 넘어온 파라미터가 있다.
		year = Integer.parseInt(syear);
	}

	int month = cal.get(Calendar.MONTH) + 1;
	if(CalendarUtil.nvl(smonth) == false){
		month = Integer.parseInt(smonth);
	}
	
	int day = cal.get(Calendar.DATE);
	
	if(month < 1){
		month = 12;
		year--;
	}
	if(month > 12){
		month = 1;
		year++;
	}
	
	cal.set(year, month-1, 1);
	
	// 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	/*
	// > month+
	String n = String.format("<a href='calendar.jsp?year=%d&month=%d'>"
			 + "<img src='images/next.gif' width='20px' height='20px'></a>",
				year, month+1);
	*/
	
%>
<br>
<form name="frm" action="wantaddAf.do" method="post">
	<input type="hidden" name="locid" value="<%=locid %>">
	<input type="hidden" name="seq" value="<%=seq %>">
	<input type="hidden" name="title" value="<%=p.getTitle() %>">
	<input type="hidden" name="imgurl" value="<%=p.getImgurl() %>">

<table style="width: 97%">
	<td align="left">
		<h1>&nbsp;&nbsp;&nbsp;<img src="images/travel.png" width="50px">&nbsp;상품 정보</h1>
	</td>
	<td align="right">
		<a href="packagelist.do?locid=<%=locid%>"><img src="images/goback.png" width="20px">&nbsp;상품 리스트로 돌아가기</a>
	</td>
</table>
<table style="width: 100%">
<col width="40%"><col width="60%">
<tr>

<td align="center" valign="top" background="#EEEEEE">
	<div>
		<br>
		<img src="<%=p.getImgurl() %>" width="70%"><br><br>
		<h5><%=p.getTitle() %></h5><br>
		<div align="center">
			<span id="selectPrice"></span><span>원</span>
			&nbsp;&nbsp;
			<button class="bt_buy" type="button" onclick="payment()">결제</button>
			<button class="bt_want" type="button" onclick="wantList()">찜하기</button>
		</div>
	</div>
</td>

<td align="center">
	<table id="cal" border="1">
	<col width="100"><col width="100"><col width="100"><col width="100">
	<col width="100"><col width="100"><col width="100">
	
	<tr>
		<td colspan="7" align="center">
			<font color="black" style="font-size: 30px;">
				<%=String.format("%2d월", month) %>
			</font>
			&nbsp;&nbsp;&nbsp;&nbsp;<%--n --%>
		</td>
	</tr>
	<tr height="30" align="center" style="color: black;">
		<td>일</td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td>토</td>
	</tr>
	<tr height="70" align="left" valign="top">
	<%
	// 윗쪽 빈칸
	for(int i = 1; i < dayOfWeek; i++){
		%>
		<td style="background-color: #E0E0E0">&nbsp;</td>
		<%
	}
	// 날짜
	int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	for(int i = 1; i <= day; i++){
		int randomPrice = price + (int)(Math.random()*100)*2000;
		
		%>
		<td style="background-color:#E0E0E0">
			&nbsp;<span><%=i %></span><br><br>
		</td>
		<%
		if((i+dayOfWeek-1) % 7 == 0 && i != lastday){
			%>
			</tr><tr height="70" align="left" valign="top">
			<%
		}
	}
	for(int i = day+1; i <= lastday; i++){
		int randomPrice = price + (int)(Math.random()*100)*2000;
		%>
		<td class="select" onclick="selectDate(<%=randomPrice%>)">
			&nbsp;<span><%=i %></span><br><br>
			&nbsp;<span style="font-size: 15px"><%=randomPrice %></span><span>원</span>
		</td>
		<%
		if((i+dayOfWeek-1) % 7 == 0 && i != lastday){
			%>
			</tr><tr height="70" align="left" valign="top">
			<%
		}
	}
	// 아래쪽 빈칸
	cal.set(Calendar.DATE, lastday);
	int weekday = cal.get(Calendar.DAY_OF_WEEK);
	for(int i = 0; i < 7 - weekday; i++){
		%>
		<td style="background-color: #E0E0E0">&nbsp;</td>
		<%
	}
	%>
	</tr>
	</table>
</td>

</tr>
</table>
</form>

<!-- 결제 내역을 위한 form -->
<form action="payment.do" id="payFrm" method="post">

	<input type="hidden" id="locid" name="locid" value="<%=locid %>">
	<input type="hidden" id="seq" name="seq" value="<%=seq %>">
	<input type="text" hidden="true" id="payName" name="payName" value="<%=p.getTitle() %>">
	<input type="text" hidden="true" id="payPrice" name="payPrice"> 
	<input type="text" hidden="true" id="pImg" name="pImg" value="<%=p.getImgurl() %>">
	
</form>

<script type="text/javascript">

function selectDate(price) {
	 document.getElementById('selectPrice').innerHTML = price;
}

function wantList() {
	<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	if(login == null) {%>
		location.href = "sessionOut.do";
	<%} else{%>
		var form = document.frm;
		form.submit();
	<%}%>
}

function payment(){
	
	<%
	MemberDto login2 = (MemberDto)session.getAttribute("login");
	if(login2 == null) {%>
		location.href = "sessionOut.do";
	<%} else {%>
		$("#payPrice").val(document.getElementById('selectPrice').innerText);
			
		$("#payFrm").submit();
	<%}%>
}

</script>


</body>
</html>