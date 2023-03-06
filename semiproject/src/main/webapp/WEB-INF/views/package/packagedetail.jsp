<%@page import="movie.MovieChart"%>
<%@page import="dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String travel = (String)request.getAttribute("travel");
%>

<%
	List<MovieDto> list = MovieChart.getCGVdata();

	String jsonStr = "";
	
	for(MovieDto m : list){
		jsonStr += "{ name:'" + m.getTitle() + "', y:" + m.getPercent() + "}, ";
	}
	
	jsonStr = jsonStr.substring(0, jsonStr.lastIndexOf(","));
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1><%=travel %></h1>

</body>
</html>