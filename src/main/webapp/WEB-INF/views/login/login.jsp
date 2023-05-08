<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">

*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;
}
.login-html .sign-in-htm,{
  top:0;
  left:0;
  right:0;
  bottom:0;
  position:absolute;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
  display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
  text-transform:uppercase;
}
.login-html .tab{
  font-size:22px;
  margin-right:15px;
  padding-bottom:5px;
  margin:0 15px 10px 0;
  display:inline-block;
  border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
  color:#fff;
  border-color:#1161ee;
}
.login-form{
  min-height:345px;
  position:relative;
  perspective:1000px;
  transform-style:preserve-3d;
}
.login-form .group{
  margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input{
  width:100%;
  color::#000;
  display:block;
}

.login-form .group .button{
  border:none;
  width:100%;
  padding:15px 20px;
  border-radius:25px;
  background:#1161ee;
  display:block;
  color: #fff;
  font-size:15px;
  font-family: 'NanumSquareNeo-Variable_700';
}

.login-form .group input{
  border: 2px solid #aaa;
  padding:15px 20px;
  border-radius:25px;
  background::#000;
  font-family: 'NanumSquareNeo-Variable_700';
}

.login-form .group input[data-type="password"]{
  text-security:circle;
  -webkit-text-security:circle;
}
.login-form .group .label{
  color:#aaa;
  font-size:15px;
}

.login-form .group label .icon{
  width:15px;
  height:15px;
  border-radius:2px;
  border-color: black;
  position:relative;
  display:inline-block;
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
  content:'';
  width:10px;
  height:2px;
  border: 1px black;
  background:#000;
  position:absolute;
  transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
  left:3px;
  width:5px;
  bottom:6px;
  transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
  top:6px;
  right:0;
  transform:scale(0) rotate(0);
}

.login-form .group .check:checked + label{
  color::#000;
}
.login-form .group .check:checked + label .icon{
  background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
  transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
  transform:scale(1) rotate(-45deg);
}


.hr{
  height:2px;
  margin:60px 0 50px 0;
  background::#000;
}
.foot-lnk{
  text-align:center;
}
</style>

</head>
<body>

<div class="login-wrap">
<form action="loginAf.do" method="post" name="loginFm">
  <div class="login-html">
    <div class="login-form">
      <div class="sign-in-htm">
      	<h1 align="center">로그인</h1>
        <div class="group">
          <label for="user" class="label">아이디</label>
          <input id="user" name="id" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">비밀번호</label>
          <input id="pass" name="pwd" type="password" class="input" data-type="password">
        </div>
        <div class="group">
          <input id="check" type="checkbox" class="check" checked="checked">
          <label for="check"><span class="icon"></span> 아이디 저장</label>
        </div>
        <div class="group">
          <input type="button" onclick="blankCheck()" class="button" value="로그인">
        </div>
        <div class="foot-lnk">
          <br><br><br>
          <a href="regi.do">회원가입</a><br><br><br>
          <a href="find.do">아이디/비밀번호를 잊어버리셨나요?</a><br><br><br>
          <img src="images/goback.png" width="20px"><a href="main.do"> 메인화면 돌아가기</a>
        </div>
      </div>
    </div>
  </div>
</form>
</div>

 <script type="text/javascript">

function blankCheck(){
	/* ID, PW 빈칸 여부 체크 */
	 if(loginFm.id.value.trim() == ""){
		 alert("ID를 입력해주세요!");
		 loginFm.id.focus();
		 return false;
	 }
	 
	 if(loginFm.pwd.value.trim() == ""){
		 alert("PassWord를 입력해주세요!");
		 loginFm.pwd.focus();
		 return false;
	 }
	 
	 // 모든 내용 입력 시 - 전송
	 loginFm.submit();
}
 
 
 /* cookie - id check */
 let user_id = $.cookie("user_id");
 
 if(user_id != null){
	 $("#user").val(user_id);
	 $("#check").prop("checked", true);
 }
 
 $("#check").click(function (){
	
	 if($("#check").is(":checked") == true){
		 
		if($("#user").val().trim() == ""){
		 	alert("ID 입력 필요!")
			$("#check").prop("checked", false);
	 	}else{
			// cookie 저장 - id 저장 체크박스 체크시
		 	$.cookie("user_id", $("#user").val().trim(), {expires:7, path:'./'});
	 	}
 	}else{
 		// cookie 삭제 - id 저장 체크박스 해제시
	 	$.removeCookie("user_id", {path:"./"});
 	}
 });
 
 </script>

</body>
</html>