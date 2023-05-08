<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

body {
  margin: 0;
}

.mypagemenu {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 100%;
  background-color: #EDA98B;
  height: 100%;
  overflow: auto;
}

.mypagemenu > li{
	margin-top: 10px;
	padding: 5px;
	font-family: 'NanumSquareNeo-Variable_700';
	font-size: 20px;
	height: 40px;

}

.mypagemenu > li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

.mypagemenu > li a:hover{
  background-color: #B45111;
  color: white;
}
</style>
</head>
<body>

<ul class="mypagemenu">
	<li><a href="mypage.do">주문/결제내역</a></li>
	<li><a href="mypageinfo.do">나의정보</a></li>
	<li><a href="mypagewant.do">찜리스트</a></li>
	<li><a href="mypagemybbs.do">내가쓴글</a></li>
	<li><a href="mypagescrap.do">스크랩글</a></li>
</ul>

</body>

</html>