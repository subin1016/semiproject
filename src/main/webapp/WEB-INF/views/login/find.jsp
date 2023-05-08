<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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
  min-height:850px;
  position:relative;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:50px 70px 50px 70px;
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
  width:40%;
  padding:10px 20px;
  border-radius:25px;
  background:#1161ee;
  display:inline-block;
  color: #fff;
  font-size:15px;
  font-family: 'NanumSquareNeo-Variable_700';
}

.login-form .group input{
  border: 2px solid #aaa;
  padding:15px 20px;
  border-radius:25px;
  background::#000;
  height: 40px;
  font-family: 'NanumSquareNeo-Variable_700';
}

.login-form .group input#findId,
.login-form .group input#findPwd{
	width: 58%;
	display:inline-block;
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
  <div class="login-html">
    <div class="login-form">
      <div class="sign-up-htm">
      	<div>
	      	<h1 align="center">아이디 찾기</h1>
	        <div class="group">
	          <label for="user" class="label">이름</label>
	          <input id="name" name="name" type="text" class="input">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">이메일</label>
	          <input id="id_email" name="idemail" type="text" class="input" >
	        </div>
	        <div class="group">
	          <label for="pass" class="label">전화번호(-없이)</label>
	          <input id="id_phone" name="idphone" type="text" class="input" >
	        </div>
	        <div class="group">
	          <input id="id_button" type="button" class="button" value="찾기">
	          <input id="findId" name="findId" placeholder="아이디" type="text" class="input">
	        </div>
       </div>
       <hr>
       <div>
	      	<h1 align="center">비밀번호 찾기</h1>
	        <div class="group">
	          <label for="user" class="label">아이디</label>
	          <input id="id" name="pwdid" type="text" class="input">
	        </div>
	        <div class="group">
	          <label for="pass" class="label">이메일</label>
	          <input id="pwd_email" name="pwdemail" type="text" class="input" >
	        </div>
	        <div class="group">
	          <label for="pass" class="label">전화번호(-없이)</label>
	          <input id="pwd_phone" name="pwdphone" type="text" class="input" >
	        </div>
	        <div class="group">
	          <input id="pwd_button" type="button" class="button" value="찾기">
	          <input id="findPwd" name="findPwd" placeholder="비밀번호" type="text" class="input">
	        </div>
       </div>
       <div class="foot-lnk">
	       	<br><br>
	       	<a href="login.do">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="regi.do">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="main.do">메인화면</a>
       </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
// id 찾기
$(document).ready(function(){
	$("#id_button").click(function(){
		
		$.ajax({
			type: "post",
			url: "findId.do",
			data: {
				"name" : $("#name").val(),
				"email" : $("#id_email").val(),
				"phone" : $("#id_phone").val()
			},
			success: function(json){
				$("#findId").val(json.id);
			},
			error: function(){
				alert('error');
			}
			
		});
		
	});
	
});

// pwd 찾기
$(document).ready(function(){
	$("#pwd_button").click(function(){
		
		$.ajax({
			type: "post",
			url: "findPwd.do",
			data: {
				"id" : $("#id").val(),
				"email" : $("#pwd_email").val(),
				"phone" : $("#pwd_phone").val()
			},
			success: function(data){
				$("#findPwd").val(data.pwd);
			},
			error: function(){
				alert('error');
			}
			
		});
		
	});
	
});

</script>

<script type="text/javascript">

// 빈칸 입력 방지(id 찾기)

$(document).ready(function() {
    $("#id_button").click(function() {   
      if($('input[name="name"]').val().trim() == ''){
        alert('이름을 입력해주세요');
        $('input[name="name"]').val('');
        $('input[name="name"]').focus('');
        return false;
      } 
      else if($('input[id="id_email"]').val().trim() == ''){
        alert('이메일을 입력해주세요');
        $('input[id="id_email"]').val('');
        $('input[id="id_email"]').focus('');
        return false;
      } 
      else if($('input[id="id_phone"]').val().trim() == ''){
        alert('전화번호를 입력해주세요');
        $('input[id="id_phone"]').val('');
        $('input[id="id_phone"]').focus('');
        return false;
      } 
      
    });
});

//빈칸 입력 방지(pw 찾기)

$(document).ready(function() {
    $("#pwd_button").click(function() {   
      if($('input[id="id"]').val().trim() == ''){
        alert('아이디를 입력해주세요');
        $('input[id="id"]').val('');
        $('input[id="id"]').focus('');
        return false;
      } 
      else if($('input[id="pwd_email"]').val().trim() == ''){
        alert('이메일을 입력해주세요');
        $('input[id="pwd_email"]').val('');
        $('input[id="pwd_email"]').focus('');
        return false;
      } 
      else if($('input[id="pwd_phone"]').val().trim() == ''){
        alert('전화번호를 입력해주세요');
        $('input[id="pwd_phone"]').val('');
        $('input[id="pwd_phone"]').focus('');
        return false;
      } 
      
    });
});


</script>



</body>
</html>