<%@page import="mul.cam.a.util.productUtil"%>
<%@page import="mul.cam.a.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<%
	String locid = (String)request.getAttribute("locid");	
	List<ProductDto> list = productUtil.getProductdata("https://www.modetour.com/pkg/?MLoc=01&startlocation=ICN&Theme=THE88&id=" + locid, 16);
%>

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


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
}

li{list-style:none}

.productlist > li {
  width: 25%;
  float: left;
  text-align: center;
  line-height: 40px;
}

.product{
	height: 400px;
	padding: 20px;
	margin: 10px;
}

.scrollToTop{
	width:40px;
	height: 40px;
	position:fixed;
	right:30px;
	bottom:30px;
}

.productlist > li:hover {
  background-color: #E9F7FF;
  box-shadow: 0 0 0 2px rgb(144, 212, 246) inset;
}

</style>
</head>

<body>
<br>
<h1>&nbsp;&nbsp;&nbsp;<img src="images/list.png" width="50px">&nbsp;상품 리스트</h1>

<ul class="productlist">
	<%for(int i=0; i < list.size(); i++){
		ProductDto p = list.get(i);%>
	<li>
		<div class="product">
			<a href="packagedetail.do?locid=<%=locid%>&seq=<%=i%>">
				<img src="<%=p.getImgurl() %>" width=100% height="200px">
			
				<p class="title"><%=p.getTitle() %></p>
				<p class="price"><%=p.getPrice() %></p>
			</a>
		</div>
	</li>
	<%} %>
</ul>

<a href="#" class="scrollToTop"><img src="images/back-to-top-button.png" width="50px"></a>
</body>

<script>
	$(document).ready(function(){
	//Check to see if the window is top if not then display button
		$(window).scroll(function(){
			if ($(this).scrollTop() > 100) {
				$('.scrollToTop').fadeIn();
			} else {
				$('.scrollToTop').fadeOut();
			}
		});
	
		//Click event to scroll to top
		$('.scrollToTop').click(function(){
			$('html, body').animate({scrollTop : 0},800);
			return false;
		});
	});
</script>