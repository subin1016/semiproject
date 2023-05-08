<%@page import="mul.cam.a.dto.CommuDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
CommuDto dto = (CommuDto) request.getAttribute("dto");
System.out.println(dto.toString());
%>

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
<!-- jquery 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 폰트 변경 버튼 스타일 -->
<style>
a {
    color:inherit;
    text-decoration:none;
}

h1, h2, h3, h4, h5 {
    list-style:none;
    font-family: 'NanumSquareNeo-Variable_700';
}

#img-selector {
	display: none;
}

#editor img {
	max-width: 50%;
}

table#write{
	width: 70%;
	padding: 30px;
	font-family: 'NanumSquareNeo-Variable_500';
	border-radius: 15px;
	border: 1px solid black;
	border-collapse: separate;
	
}

input#title,
input#id{
	padding: 3px 10px;
	border-radius: 5px;
}

input#id{
	background-color: rgba(0,0,0,0.1);
}

select#category{
	padding: 5px 8px;
}

button#sbutton {
    padding: 5px 30px;
    border-radius: 5px;
    font-family: 'NanumSquareNeo-Variable_700';
    text-decoration: none;
    border: 2px solid #121105;
    color: #121105;
    background-color: #BDBDBD;
}

button#sbutton:hover {
    background-color: #9C9C9C;
}

</style>

</head>
<body>
	<br>
	<div align="center">
		<div style="width: 70%">
			<h2 align="left"><img src="images/edit.png" width="50px"> 게시글 수정</h2>
		</div>
	</div>
	<br>
	<div align="center">
		<form action="commuupdateAf.do" id="frm" method="get" enctype="multipart/form-data">
			<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
			<table id="write">
				<!-- 작성자 ID 표시 -->
				<tr>
					<th style="text-align: center;">ID</th>
					<td><input type="text" id="id" name="id" value="<%=dto.getId()%>" readonly="readonly"></td>
				</tr>

				<!-- 게시판 카테고리 선택 -->
				<!-- 게시판마다 해당되는 게시물만 나타나도록 카테고리 선택 -->
				<tr>
					<th style="text-align: center;">글 제목</th>
					<td><input type="text" id="title" name="title" value='<%=dto.getTitle()%>'> <select id="category" name="category">
							<option selected>카테고리 선택</option>
							<option value="여행기">여행기</option>
							<option value="여행팁">여행팁</option>
							<option value="동행">동행</option>
							<option value="자유게시판">자유게시판</option>
					</select></td>
				</tr>

				<!-- 글꼴 변경 툴바 -->
				<tr>
					<td colspan="2">
						<div class="editor-menu" style="margin-top: 5px; margin-bottom: 5px;">
							<button type="button" id="btn-bold" class="btn btn-outline-secondary btn-sm" style="margin-left: 10px">
								<b>B</b>
							</button>
							<button type="button" id="btn-italic" class="btn btn-outline-secondary btn-sm">
								<i>I</i>
							</button>
							<button type="button" id="btn-underline" class="btn btn-outline-secondary btn-sm">
								<u>U</u>
							</button>
							<button type="button" id="btn-strike" class="btn btn-outline-secondary btn-sm">
								<s>S</s>
							</button>
							<button type="button" id="btn-ordered-list" class="btn btn-outline-secondary btn-sm">OL</button>
							<button type="button" id="btn-unordered-list" class="btn btn-outline-secondary btn-sm">UL</button>
							<button type="button" id="btn-image" class="btn btn-outline-primary btn-sm" style="margin-left: 10px">IMG</button>

							<!-- img-selector -->
							<input id="img-selector" type="file" accept="image/*" />
						</div> <!-- textarea에는 죽어도 그림을 못넣는다고 하여 div로 비슷하게 만든 부분 -->
						<div id="editor" contentEditable="true" style="overflow-x: auto; width: 100%; height: 500px; padding: 16px 24px; border: 1px solid #D6D6D6; border-radius: 4px"><%=dto.getContent()%></div> <textarea hidden="true" id="content" name="content"></textarea>

					</td>
				</tr>

				<!-- 도구 -->

				<tr>
					<td colspan="2" style="margin: 5px"><input type="file" name="fileload">
						<button type="button" id="sbutton" style="float: right" class="btn btn-secondary btn-sm">글수정 완료</button></td>
						
				</tr>

			</table>
		</form>
	</div>



	<script type="text/javascript">
		// '작성 완료' 버튼 클릭 시 제목, 내용 공란 확인 및 submit
		$(document).ready(function() {

			$("#sbutton").click(function() {

				$("#content").val($("#editor").html());

				if ($("#title").val().trim() == "") {
					alert("제목 입력!");
					return;
				} else if ($("#content").val().trim() == "") {
					alert("내용 입력!");
					return;
				} else if ($("#category").val().trim() == "카테고리 선택") {
					alert("카테고리 선택!");
					return;
				} else {

					$("#frm").submit();
				}

			});
		});

		// 폰트 변경 

		const editor = document.getElementById('editor');
		const btnBold = document.getElementById('btn-bold');
		const btnItalic = document.getElementById('btn-italic');
		const btnUnderline = document.getElementById('btn-underline');
		const btnStrike = document.getElementById('btn-strike');
		const btnOrderedList = document.getElementById('btn-ordered-list');
		const btnUnorderedList = document.getElementById('btn-unordered-list');

		btnBold.addEventListener('click', function() {
			setStyle('bold');
		});

		btnItalic.addEventListener('click', function() {
			setStyle('italic');
		});

		btnUnderline.addEventListener('click', function() {
			setStyle('underline');
		});

		btnStrike.addEventListener('click', function() {
			setStyle('strikeThrough')
		});

		btnOrderedList.addEventListener('click', function() {
			setStyle('insertOrderedList');
		});

		btnUnorderedList.addEventListener('click', function() {
			setStyle('insertUnorderedList');
		});

		function setStyle(style) {
			document.execCommand(style);
			focusEditor();
		}

		// 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
		function focusEditor() {
			editor.focus({
				preventScroll : true
			});
		}

		//이미지 추가 버튼

		const btnImage = document.getElementById('btn-image');
		const imageSelector = document.getElementById('img-selector');

		btnImage.addEventListener('click', function() {
			imageSelector.click();
		});

		imageSelector.addEventListener('change', function(e) {
			const files = e.target.files;
			if (!!files) {
				insertImageData(files[0]);
			}
		});

		function insertImageData(file) {
			const reader = new FileReader();
			reader.addEventListener('load', function() {
				focusEditor();
				//        alert("이미지 삽입 2단계 완료");
				document.execCommand('insertImage', false, reader.result);
				//        alert("이미지 삽입 3단계 완료");
			});

			if (file)
				reader.readAsDataURL(file);
		}

		// 버튼 클릭 시 버튼 색 변경
		editor.addEventListener('keydown', function() {
			checkStyle();
		});

		editor.addEventListener('mousedown', function() {
			checkStyle();
		});

		function setStyle(style) {
			document.execCommand(style);
			focusEditor();
			checkStyle();
		}

		function checkStyle() {
			if (isStyle('bold')) {
				btnBold.classList.add('active');
			} else {
				btnBold.classList.remove('active');
			}
			if (isStyle('italic')) {
				btnItalic.classList.add('active');
			} else {
				btnItalic.classList.remove('active');
			}
			if (isStyle('underline')) {
				btnUnderline.classList.add('active');
			} else {
				btnUnderline.classList.remove('active');
			}
			if (isStyle('strikeThrough')) {
				btnStrike.classList.add('active');
			} else {
				btnStrike.classList.remove('active');
			}
			if (isStyle('insertOrderedList')) {
				btnOrderedList.classList.add('active');
			} else {
				btnOrderedList.classList.remove('active');
			}
			if (isStyle('insertUnorderedList')) {
				btnUnorderedList.classList.add('active');
			} else {
				btnUnorderedList.classList.remove('active');
			}
		}

		function isStyle(style) {
			return document.queryCommandState(style);
		}
	</script>

</body>
</html>