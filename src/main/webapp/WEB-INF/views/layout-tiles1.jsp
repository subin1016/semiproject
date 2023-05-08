<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- spring tiles -->    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="vertical-align: top; margin-top: 10px" align="center">

<table style="width: 90%; height: 800px;" >

<!-- main -->
<tr>
	<td style="width: 20%;" valign="middle">
		<tiles:insertAttribute name="banner_1"/>
	</td>
	<td style="height: 700px" valign="middle">
		<tiles:insertAttribute name="content"/>
	</td>
	<td style="width: 20%; background-color: rgba(0, 0, 0, 0.05)">
		<tiles:insertAttribute name="banner_2"/>
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