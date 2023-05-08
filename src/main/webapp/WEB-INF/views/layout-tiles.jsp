<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
<table style="width: 90%; height: 800px;">

<!-- header -->
<tr align="center">
	<td colspan="3" style="height: 20%">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<!-- main -->
<tr>
	<td>
		<tiles:insertAttribute name="menu"/>	
	</td>
</tr>
<tr>
	<td >
		<tiles:insertAttribute name="content"/>
	</td>
</tr>

<!-- footer -->
<tr align="center">
	<td colspan="3" style="height: 20%">
		<hr style="margin-bottom: 60px">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

</table>
</div>

</body>
</html>