<%@page import="mul.cam.a.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.productUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<ProductDto> list = productUtil.getBannerDate("https://www.modetour.com/main/default.aspx", 3);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
  margin: 0;
}

.banner{
	text-align: center;
	padding: 10px;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_500';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 500;
    font-style: normal;
}

html, a {
    font-family: 'NanumSquareNeo-Variable_500';
    text-decoration:none;
}

a:hover{
	text-decoration: underline;

}

body, ul, li, h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_500';
}

.banner:hover {
  background-color: #E9F7FF;
  box-shadow: 0 0 0 2px rgb(144, 212, 246) inset;
}

</style>

</head>

<body>

<div align="center">
	<h4><img src="images/tasks.png" width="30px"><br>[ 실시간 인기 상품 ]</h4>
</div>

<table class="banner">
	<%for(int i=0; i < list.size(); i++){
		ProductDto p = list.get(i);%>
	<tr>
		<td>
			<a href="packagedetail.do?seq=<%=i%>">
				<img src="<%=p.getImgurl() %>" width="90%">
			
				<p class="title"><%=p.getTitle() %></p>
			</a>
		</td>
	</tr> 
	<%} %>
</table>
</body>
</html>