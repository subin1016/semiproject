<%@page import="mul.cam.a.util.productUtil"%>
<%@page import="mul.cam.a.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String youtube = (String)request.getAttribute("youtube");
	String locid = (String)request.getAttribute("locid");	
	List<ProductDto> list = productUtil.getProductdata("https://www.modetour.com/pkg/?MLoc=01&startlocation=ICN&Theme=THE88&id=" + locid, 5);
%>

<style>

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

.productlist{
	margin-left:auto;
	margin-right:auto;
	margin-top: 10px;
}

li{list-style:none}

.productlist > li {
  width: 20%;
  float: left;
  text-align: center;
  line-height: 40px;
}

.product{
	height: 400px;
	padding: 5px;
	padding-top: 15px;
}

.productlist > li:hover {
  background-color: #E9F7FF;
  box-shadow: 0 0 0 2px rgb(144, 212, 246) inset;
}


button#plus {
    padding: 5px 30px;
    border-radius: 15px;
    font-family: 'NanumSquareNeo-Variable_500';
    text-decoration: none;
    border: 3px solid #2873F6;
    color: #2873F6;
    background-color: white;
}

button#plus:hover {
    background-color: #2873F6;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

</style>

<iframe width="100%" height="500px" src="<%=youtube %>" 
title="YouTube video player" frameborder="0" allow="accelerometer; autoplay;
clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>
</iframe> <br><br>

<table style="width: 100%">
	<td>
		<h2 align="left"><img src="images/recommended.png" width="50px"> 추천 여행지</h2>
	</td>
	<td>
		<div align="right">		
			<button type="button" id="plus" onclick="location.href='packagelist.do?locid=<%=locid%>'">상품 더보기</button>
		</div>
	</td>
</table>

<ul class="productlist">
	<%for(int i=0; i < list.size(); i++){
		ProductDto p = list.get(i);%>
	<li>
		<div class="product">
			<a href="packagedetail.do?locid=<%=locid%>&seq=<%=i%>">
				<img src="<%=p.getImgurl() %>" width=100% height="200px">
			
				<p><%=p.getTitle() %></p>
				<p><%=p.getPrice() %></p>
			</a>
		</div>
	</li>
	<%} %>
</ul>