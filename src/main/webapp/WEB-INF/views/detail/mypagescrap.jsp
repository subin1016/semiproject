<%@page import="mul.cam.a.dto.CommuDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<CommuDto> list = (List<CommuDto>)request.getAttribute("scraplist");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

#list{
	padding: 30px;
	margin-left: 30px;
	margin-right: 30px;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	border-radius: 30px;
	text-align: center;
}

tr#scraptr{
	height: 40px;
}

tr#scraptr:hover{
	background: rgba(0, 0, 0, 0.1);
}

</style>

</head>
<body>

</head>
<body>

<div id="list">
<table style="width: 100%">
<tr height="40px" bgcolor="#B0B0B0">
	<th>번호</th><th>제목</th><th>조회수</th><th>추천수</th><th>스크랩수</th><th>작성자</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="6">스크랩 한 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++)
	{
		CommuDto dto = list.get(i);
		%>
		<tr id="scraptr">
			<th><%=i + 1%></th>
		  	<td>
				<a href="commudetail.do?seq=<%=dto.getSeq()%>">
					<%=dto.getTitle() %>
				</a>
			</td>			
			<td><%=dto.getReadcount() %></td> 
			<td><%=dto.getLikecount() %></td> 
			<td><%=dto.getScrapcount() %></td> 
			<td><%=dto.getId() %></td>
			<td>
				<a href="scrapdelete.do?seq=<%=dto.getSeq()%>">
					<img src="images/x.png" width="25px">
				</a>
		 	</td>
		</tr>
		<%
	}
}
%>

</table>
</div>

</body>
</html>