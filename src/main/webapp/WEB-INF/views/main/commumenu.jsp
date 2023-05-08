<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://kit.fontawesome.com/e7edc6be1a.js" crossorigin="anonymous"></script>
<style>

a {
	text-decoration-line: none;
	color: inherit;
	font-family: 'NanumSquareNeo-Variable_700';
}

.menu * {
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.menu li {
	display: inline-block;
	list-style: outside none none;
	margin: 0 5em;
	overflow: hidden;
	font-family: 'NanumSquareNeo-Variable_700';
}

.menu a {
	padding: 0.3em 0;
	color: rgb(0, 0, 0);
	position: relative;
	display: inline-block;
	letter-spacing: 5px;
	margin: 0;
	text-decoration: none;
	font-family: 'NanumSquareNeo-Variable_700';
}

.menu a:before, .menu a:after {
	position: absolute;
	-webkit-transition: all 1s ease;
	transition: all 1s ease;
}

/* top left로 글 위치 조절 */
.menu a:after {
	padding: 0.3em 0;
	position: absolute;
	top: 15%;
	left: 100%;
	content: attr(data-hover);
	color: rgb(0, 0, 0);
	white-space: nowrap;
}

.menu li:hover a {
	transform: translateX(-100%);
}

nav ul {
	text-align: center;
	box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
}
</style>
</head>
<body>
	<nav>
		<ul class="menu">
			<li><a href="commuhome.do" data-hover="&nbsp;홈&nbsp;"><i class="fa-solid fa-house" style="font-size: 36px;"></i></a></li>
			<li><a href="commulist.do?category=여행기" data-hover="여행기"><i class="fa-regular fa-map" style="font-size: 36px;">&nbsp;&nbsp;</i></a></li>
			<li><a href="commulist.do?category=여행팁" data-hover="여행팁"><i class="fa-regular fa-thumbs-up" style="font-size: 36px;">&nbsp;</i></a></li>
			<li><a href="commulist.do?category=동행" data-hover="동 행"><i class="fa-solid fa-people-group" style="font-size: 36px;"></i></a></li>
			<li><a href="commulist.do?category=자유게시판" data-hover="자유게시판"><i class="fa-regular fa-comments" style="font-size: 36px;">&nbsp;&nbsp;&nbsp;</i></a></li>
		</ul>
	</nav>
</body>
</html>