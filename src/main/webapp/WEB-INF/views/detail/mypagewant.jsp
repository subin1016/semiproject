<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.WantDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	
	List<WantDto> list = (List<WantDto>)request.getAttribute("list");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style type="text/css">


.wantlist > li{
	list-style:none;
	margin-bottom: 30px;
	width: 50%;
    float: left;
}

.list{
	padding: 20px;
	margin-left: 30px;
	margin-right: 30px;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	border-radius: 30px;
	height: 270px;
}

.list:hover{
	background: rgba(0, 0, 0, 0.15);
}

</style>

</head>
<body>

<div align="center">
<ul class="wantlist">
<%for(WantDto w : list){ %>
	<li>
		<div class="list">
			<a href="wantdelete.do?locid=<%=w.getLocid()%>&seq=<%=w.getSeq()%>">
				<img src="images/x.png" width="30px" align="right"><br><br>
			</a>
			<a href="packagedetail.do?locid=<%=w.getLocid()%>&seq=<%=w.getSeq()%>">
				<img src="<%=w.getImgurl() %>" width="200px"><br><br>
				<%=w.getTitle() %>
			</a>
		</div>	
	</li>
<%} %>
</ul>
</div>

</body>
</html>