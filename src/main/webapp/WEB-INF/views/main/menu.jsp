<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
ul{padding:0;margin:0}
li{list-style:none}
.menu > li {
  width: 14.285%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  background-color: rgb(144, 212, 246);
}

.menu > li:hover{
  background-color: #2873F6;
  color: white;
}

.menu > li a:hover{
  color: white;
}

</style>

<ul class="menu">
	<li>
    	<a href="main.do">홈</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC3&youtube=https://www.youtube.com/embed/tsqRtPfBu7w">동남아</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC9&youtube=https://www.youtube.com/embed/73R2SqrrODU">유럽</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC7&youtube=https://www.youtube.com/embed/5SJajXTIa0I">미주/남미</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC1910&youtube=https://www.youtube.com/embed/8R6-rmrSG3g">일본/아시아</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC8&youtube=https://www.youtube.com/embed/xOP0pPQmb4Q">호주/태평양</a>
    </li>
    <li>
    	<a href="package.do?locid=LOC985&youtube=https://www.youtube.com/embed/hwg4_om_wTk">제주/국내</a>
    </li>
</ul>