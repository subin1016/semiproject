<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.CommuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>


<style type="text/css">

a {
    color:inherit;
    text-decoration:none;
}

h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_700';
}


button#plus {
    padding: 7px 30px;
    border-radius: 10px;
    font-family: 'NanumSquareNeo-Variable_700';
    text-decoration: none;
    border: 2px solid #121105;
    color: #121105;
    background-color: #F2DB62;
}

button#serbtn {
    padding: 3px 15px;
    border-radius: 5px;
    font-family: 'NanumSquareNeo-Variable_500';
    text-decoration: none;
    border: 2px solid #121105;
    color: #121105;
    background-color: #F2DB62;
}

button#plus:hover,
button#serbtn:hover{
	background-color: #DBC659;
}

input#search,
select#choice{
	padding: 3px 10px;
	border-radius: 5px;
	font-family: 'NanumSquareNeo-Variable_500';
}

select#choice{
	padding: 5px 8px;
}

table#bbs{
	font-family: 'NanumSquareNeo-Variable_500';
}

.cen{
	text-align: center;
}

.pagination > li > a
{
    background-color: white;
    color: #333333;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover
{
    color: #2a2a2a;
    background-color: #ddd;
    border-color: #ddd;
}

.pagination > .active > a
{
    color: white;
    background-color: #333333 !Important;
    border: solid 1px #333333 !Important;
}

.pagination > .active > a:hover
{
    background-color: #333333 !Important;
    border: solid 1px #333333;
}

</style>

</head>
<body>

<%
List<CommuDto> list = (List<CommuDto>)request.getAttribute("bbslist"); // 게시판 list 전체
int pageBbs = (Integer)request.getAttribute("pageBbs"); // 총 페이지수
int pageNumber = (Integer)request.getAttribute("pageNumber"); // 현재 페이지
String choice = (String)request.getAttribute("choice"); // 선택한 검색 카테고리
String search = (String)request.getAttribute("search"); // 입력한 검색어
String category = (String)request.getAttribute("category");
String icon = "";

if (category.equals("여행기")){
	icon = "fa-regular fa-map";
} else if(category.equals("여행팁")){
	icon = "fa-regular fa-thumbs-up";
} else if(category.equals("동행")){
	icon = "fa-solid fa-people-group";
} else {
	icon = "fa-regular fa-comments";
}


%>

<div align="center">
<br>
<table style="width: 85%">
	<td>
		<h2 align="left"><i class="<%= icon%>"></i> <%=category %></h2>
	</td>
	<td>
		<div align="right">		
			<button type="button" id="plus" onclick="location.href='commuwrite.do'">글쓰기</button>
		</div>
	</td>
</table>
<br>


<table id="bbs" style="width: 85%" class="table table-striped">
<col width="70"><col width="600"><col width="150"><col width="150"><col width="150"><col width="150">
<tr class="cen">
	<th>번호</th><th>제목</th><th>조회수</th><th>추천수</th><th>스크랩수</th><th>작성자</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="6">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++)
	{
		CommuDto dto = list.get(i);
		%>
		<tr class="cen">
			<th><%=i + 1 + (pageNumber * 10) %></th>
			
			<%
			if(dto.getDel() == 0){
				%>			
				<td>
					<%=Utility.arrow(dto.getDepth()) %>
					<a href="commudetail.do?seq=<%=dto.getSeq()%>">
						<%=dto.getTitle() %>
					</a>
				</td>			
				<%
			}else if(dto.getDel() == 1){
				%>
				<td>
					<%=Utility.arrow(dto.getDepth()) %>
					<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>	
				</td>
				<%
			}	
			%>
			<td><%=dto.getReadcount() %></td> 
			<td><%=dto.getLikecount() %></td> 
			<td><%=dto.getScrapcount() %></td> 
			<td><%=dto.getId() %></td>
		</tr>
		<%
	}
}
%>

</table>

<br>

<!-- 페이징 새로 변경 -->
<div class="container" style="width: 90%">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center"></ul>
    </nav>
</div>


<br><br>
<div class="form-row align-items-center d-flex justify-content-center align-items-center container">
	<select id="choice">
		<option value="">검색</option>
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	&nbsp;&nbsp;
	<div>
		<input type="text" id="search" placeholder="검색어를 입력하세요" value="<%=search %>">
	</div>
	&nbsp;&nbsp;
	<button type="button" onclick="searchBtn()" id="serbtn">검색</button>
</div>

<br>
<a href="commulist.do?category=<%=category%>">게시판 첫 화면</a> <!-- controller로 이동 -->

</div>

<script type="text/javascript">

let search = "<%=search %>";
console.log("search = " + search);
if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
}

// 검색 버튼 눌렀을 때,
function searchBtn() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	let category = "<%=category %>";
	if(choice == ""){
		alert("검색항목을 선택해 주십시오");
		return;
	} 
	
	if(search.trim() == ""){
		alert("검색어를 선택해 주십시오");
		return;
	}
	
	// controller로 값을 넘겨주면서 이동
	location.href = "commulist.do?choice=" + choice + "&search=" + search + "&category=" + category;
}
// 페이지 번호 클릭하여 페이지 이동할 때,
function goPage( pageNumber ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	let category = "<%=category %>";
	
	// controller로 값을 넘겨주면서 이동
	location.href = "commulist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber + "&category=" + category;	
}

// 페이징 새로 변경
$('#pagination').twbsPagination({
    startPage: <%=pageNumber+1 %>,		// 현재 페이지 넘버 pageNumber는 0부터 시작
	totalPages: <%=pageBbs %>,	// 총 페이지 개수
    visiblePages: 10,	// 페이지당 나타나는 글의 개수
    first:'<span srid-hidden="true">«</span>',	// 첫 페이지로
    prev:"이전", 	// 이전 페이지로
    next:"다음",		// 다음 페이지로 
    last:'<span srid-hidden="true">»</span>',	// 마지막 페이지로
   	initiateStartPageClick:false,	// onPageClick이 자동실행되지 않도록
    onPageClick: function (event, page) {
//         alert(page);	// 페이지 넘버가 alert
		let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
		let category = "<%=category %>";
    	location.href = "commulist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page - 1) + "&category=" + category;	
    }
});

</script>
</body>
</html>