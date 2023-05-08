<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@container (min-width: 600px) {
	
}

.cards {
	display: grid;
	gap: 1em;
	grid-template-columns: repeat(auto-fit, minmax(10em, 1fr));
}

.card-wrapper {
	container-type: inline-size;
}

.card {
	display: grid;
	grid-template: "image description"/1fr 1fr;
	align-content: start;
	gap: 2em;
	padding: 1em;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
}

/* card 형식 추가했습니다 */
.recommend-card {
	display: grid;
	grid-template: "image description"/1fr;
	align-content: start;
	gap: 2em;
	padding: 1em;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	text-align: center;
}

/* card 형식 추가했습니다 */
.recent-card {
	display: grid;
	grid-template: "image description"/1fr;
	align-content: start;
	gap: 2em;
	padding: 1em;
	border: 1px solid #ccc;
	background: rgba(0, 0, 0, 0.05);
	text-align: center;
}

.card-image {
	grid-area: image;
	text-align: center;
}

.card-description {
	grid-area: description;
	text-align: left;
}

main {
	font-weight: 300;
	max-width: 80rem;
	margin: 0 auto;
}

h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_700';
}

.cardtable > thead{
	height: 40px;
}

.cardtable > tbody > tr{
	height: 30px;
}


.cardtable > tbody > tr:hover{
	background-color: rgba(0, 0, 0, 0.05);
}

.cardtable{
	font-family: 'NanumSquareNeo-Variable_500';
}

</style>
</head>
<body>
	<main>
		<br>
		<h2 align="left"><img src="images/best.png" width="50px"> 베스트 게시글</h2>
		<div class="card-wrapper">
			<div class="recommend-card">
				<table class="cardtable">
					<colgroup>
					<col width="300px"/><col width="300px"/><col width="300px"/>
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>카테고리</th>
							<th>추천수</th>
							<th>작성자</th>
						</tr>
					</thead>
					<c:forEach items="${recommendList}" var="recList">
						<tbody>
							<tr align="center">
								<td><a href="commudetail.do?seq=${recList.seq}">${recList.title}</a></td>
								<td>${recList.category}</td>
								<td>${recList.likecount}</td>
								<td>${recList.id}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				
			</div>
		</div>
		<br>
		
		<br>
		<h2 align="left"><img src="images/tasks.png" width="50px"> 실시간 게시글</h2>
		<div class="card-wrapper">
			<div class="recent-card">
				<table class="cardtable">
					<colgroup>
					<col width="300px"/><col width="300px"/><col width="300px"/>
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>카테고리</th>
							<th>작성일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<c:forEach items="${recentList}" var="recentList">
						<tbody>
							<tr align="center">
								<td><a href="commudetail.do?seq=${recentList.seq}">${recentList.title}</a></td>
								<td>${recentList.category}</td>
								<td>${recentList.wdate}</td>
								<td>${recentList.id}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
</body>