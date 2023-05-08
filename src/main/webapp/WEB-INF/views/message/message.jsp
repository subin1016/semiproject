<%@page import="mul.cam.a.dto.CommuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 회원 가입의 성공 여부를 알려주는 부분
String message = (String)request.getAttribute("message");
if(message != null && !message.equals("")){
	if(message.equals("MEMBER_ADD_YES")){
		%>
		<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("가입되지 않았습니다. 다시 가입해 주십시오");
		location.href = "regi.do";
		</script>
		<%		
	}
}
// 로그인의 성공 여부를 알려주는 부분
String login = (String)request.getAttribute("login");
if(login != null && !login.equals("")){
	if(login.equals("LOGIN_OK")){
		%>
		<script type="text/javascript">
		alert("로그인되었습니다");
		location.href = "main.do"; // 로그인 후 메인 페이지로 이동
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("아이디나 패스워드를 확인해 주십시오");
		location.href = "login.do";
		</script>
		<%
	}	
}

String bbswrite = (String)request.getAttribute("bbswrite");
String category = (String)request.getAttribute("category");
if(bbswrite != null && !bbswrite.equals("")){
	if(bbswrite.equals("BBS_ADD_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 작성되었습니다");
		location.href = "commulist.do?category=<%=category%>";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "commulist.do";
		</script>
		<%
	}
}
%>
<%-- 
String answer = (String)request.getAttribute("answer");
if(answer != null && !answer.equals("")){
	if(answer.equals("BBS_ANSWER_OK")){
		%>
		<script type="text/javascript">
		alert("답글이 성공적으로 작성되었습니다");
		location.href = "bbslist.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("답글을 다시 작성해 주십시오");
		location.href = "bbslist.do";
		</script>
		<%
	}	
}
 --%>
<%
String bbsupdate = (String)request.getAttribute("bbsupdate");
if(bbsupdate != null && !bbsupdate.equals("")){
	if(bbsupdate.equals("BBS_UPDATE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "commuhome.do";
		</script>
		<%
	}
	else{
		int seq = (Integer)request.getAttribute("seq");
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		let seq = "<%=seq %>";		
		location.href = "commuupdate.do?seq=" + seq;
		</script>
		<%
	}	
}


String bbsdelete = (String)request.getAttribute("bbsdelete");
if(bbsdelete != null && !bbsdelete.equals("")){
	if(bbsdelete.equals("BBS_DELETE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 삭제되었습니다");
		location.href = "commuhome.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("삭제되지 않았습니다");		
		location.href = "commuhome.do";
		</script>
		<%
	}	
}

// 정보 수정하기
String updateMember = (String)request.getAttribute("updateMember");
if(updateMember != null && !updateMember.equals("")){
	if(updateMember.equals("MEMBER_UPDATE_YES")){
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "mypageinfo.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("수정되지 않았습니다");		
		location.href = "mypageinfo.do";
		</script>
		<%
	}	
}


String sessionOut = (String)request.getAttribute("sessionOut");
if(sessionOut != null && !sessionOut.equals("")){
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "login.do";
	</script>
	<%
}
%>

