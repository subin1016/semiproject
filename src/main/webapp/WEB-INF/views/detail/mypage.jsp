<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.PaymentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");

	List<PaymentDto> list = (List<PaymentDto>)request.getAttribute("list");
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.list{
	padding: 10px;
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 30px;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	border-radius: 30px
}

.list:hover{
	background: rgba(0, 0, 0, 0.15);
}

</style>

</head>
<body>

<%for(PaymentDto P : list){ %>
	<div class="list">
	<ul>
		<li>
			<div>
				<table>
					<tr>
						<td>
							<img src="<%=P.getpImg() %>" width="200px">
						</td>
						<td width="70%" align="center">
							<div style="width: 70%; text-align: center;">
							<a href="packagedetail.do?locid=<%=P.getLocid()%>&seq=<%=P.getSeq()%>">
								<%=P.getpName() %>
							</a><br><br>
							<div align="right"><%=P.getpPrice() %> 원</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</li>
	</ul>
	</div>
<%} %>			

</body>
</html>