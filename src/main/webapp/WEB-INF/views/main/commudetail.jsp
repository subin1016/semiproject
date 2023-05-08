<%@page import="org.springframework.core.io.Resource"%>
<%@page import="org.springframework.http.ResponseEntity"%>
<%@page import="mul.cam.a.dto.CommuDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
CommuDto dto = (CommuDto) request.getAttribute("bbsdto");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">

pre {
	white-space: pre-wrap;
	font-family: 'NanumSquareNeo-Variable_500';
}

a {
    color:inherit;
    text-decoration:none;
}

h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_700';
}

table#write{
	width: 70%;
	padding: 30px;
	font-family: 'NanumSquareNeo-Variable_500';
	border-radius: 15px;
	border: 1px solid black;
	border-collapse: separate;
	
}

table#write > td{
	padding: 5px;
}

button.sbutton {
    padding: 5px 30px;
    border-radius: 5px;
    font-family: 'NanumSquareNeo-Variable_700';
    text-decoration: none;
    border: 2px solid #121105;
    color: #121105;
    background-color: #BDBDBD;
}

button#del{
	background-color: #E3333E;
}

button#scbtn,
button#rebtn{
	background-color: rgba(0,0,0,0.05);
	border: 2px solid rgba(0,0,0,0.05);
}

button#scbtn:hover,
button#rebtn:hover{
	background-color: white;
	box-shadow: 0 0 0 2px rgba(0,0,0,0.05) inset;
}

table#comment{
	width: 70%;
	padding: 30px;
	font-family: 'NanumSquareNeo-Variable_500';
	border-radius: 15px;
}

textarea{
	border-radius: 5px;
	padding: 10px;
}

button#com{
	width: 15%;
	background-color: white;
	border: none;
}

button#com:hover{
	background-color: rgba(0,0,0,0.1);
}

table#show{
	font-family: 'NanumSquareNeo-Variable_500';
}

#shinfo{
	background-color: rgba(0,0,0,0.1);
	font-family: 'NanumSquareNeo-Variable_300';
}

</style>
</head>
<body>
	<br>
	<div align="center">
		<table id="write">
			<col style="width: 25%" />
			<col style="width: 50%" />
			<col style="width: 25%" />
			<tr height="30px">
				<td style="text-align: center; background-color: rgba(0,0,0,0.1)">작성자: <%=dto.getId()%></td>
				<td style="text-align: center;">작성일: <%=dto.getWdate()%></td>
				<td style="text-align: center; background-color: rgba(0,0,0,0.1)">조회수: <%=dto.getReadcount()%>&nbsp;&nbsp;&nbsp;&nbsp;추천수: <%=dto.getLikecount()%></td>
			</tr>
			<tr height="100px">
				<th colspan="3" style="text-align: left; font-size: 20px;"><%=dto.getTitle()%><hr></th>
			</tr>

			<!-- 게시글 가져오기 -->
			<tr>
				<td colspan="3"><pre style="font-size: 17px; min-height: 300px"><%=dto.getContent()%></pre><hr></td>
			</tr>
			<tr>
				<td><img src="'/download?name='+<%=dto.getNewfilename() %>" style="width:200px; height:207px;"></td>
			</tr>

			<tr>
				<td colspan="2">파일명:<%=dto.getFilename()%>&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-outline-secondary btn-sm" value="다운로드" onclick="filedown(<%=dto.getSeq()%>, '<%=dto.getNewfilename()%>', '<%=dto.getFilename()%>')">
				</td>
				<td>
					<button type="button" onclick="scrapCom(<%=dto.getSeq()%>)" id="scbtn" class="sbutton">
						<img src="images/star.png" width="20px">
					</button>&nbsp;&nbsp;
					<button type="button" onclick="likeCom(<%=dto.getSeq()%>)" id="rebtn" class="sbutton">
						<img src="images/recomm.png" width="20px">
					</button>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<a href="commulist.do?category=<%=dto.getCategory()%>">게시물 목록으로 돌아가기</a>
		<br><br>
		<%
		MemberDto login = (MemberDto) session.getAttribute("login");
		if (dto.getId().equals(login.getId())) {
		%>
		<button type="button" onclick="updateCom(<%=dto.getSeq()%>)" class="btn btn-secondary sbutton">수정</button>&nbsp;&nbsp;
		<button id="del" type="button" onclick="deleteCom(<%=dto.getSeq()%>)" class="btn btn-danger sbutton">삭제</button>
		<%
		}
		%>
		
		<form name="file_down" action="filedownLoad.do" method="post">
			<input type="hidden" name="newfilename"> <input type="hidden" name="filename"> <input type="hidden" name="seq">
		</form>

		<script type="text/javascript">
		

		

// 파일 다운로드
function filedown(seq, newfilename, filename) {
	document.file_down.newfilename.value = newfilename;
	document.file_down.filename.value = filename;
	document.file_down.seq.value = seq;
	document.file_down.submit();
}
// 수정
function updateCom( seq ) {
	location.href = "commuupdate.do?seq=" + seq;
}
// 삭제
function deleteCom( seq ) {
	location.href = "commudelete.do?seq=" + seq;  // update del=1 해줘야함
}
// 스크랩
function scrapCom( seq ) {
	location.href = "commuscrap.do?seq=" + seq;  
}
// 추천
function likeCom( seq ) {
	location.href = "commulike.do?seq=" + seq;  
}
</script>
		<br><br><hr><br>

		<!-- 댓글 작성하기 -->

		<form action="commentWriteAf.do" method="post">
		
			<table id="comment">
				<tr>
					<td>
						<div class="input-group mb-3">
							<textarea rows="2" cols="75%" name="content" placeholder="댓글을 입력하세요."></textarea>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="sbutton" type="submit" id="com">댓글 달기</button>
						</div>
					</td>
				</tr>
			</table>
			<br>
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<!-- 댓글이 달리는 글에 대한 글번호 -->
			<input type="hidden" name="id" value="<%=login.getId()%>">
			<!-- 댓글 달려는 사람(로그인한 사람)의 id -->

			<!-- 작성된 댓글 나타내기 -->
			<table id="show" class="table table-sm" style="max-width: 900px;">
				<col width="250"><col width="100">
				<tbody id="tbody">
				</tbody>
			</table>
		</form>

		<br> <br>


	</div>


	<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:"commentList.do",
		type:"get",
		data:{"seq":<%=dto.getSeq()%>},
		success:function(list){
// 			alert('success');
// 			alert(JSON.stringify(list));
			
			$("#tbody").html("");
			
			$.each(list, function(index, item){
				let str = "<tr id='shinfo'>"
						+	"<td>작성자: " + item.id + "</td>"
						+	"<td>작성일: " + item.wdate + "</td>"
						+ "</tr>"
						+ "<tr>"
						+	"<td colspan='2'>" + item.content + "</td>"
						+ "</tr>";
				$("#tbody").append(str);
			});
		},
		error:function(){
			alert('error');
		}
	});
	
	
});
</script>



</body>
</html>