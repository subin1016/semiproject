<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script type="text/javascript">
	function check_pw() {
        var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;

        if(pw.length < 6 || pw.length>16){
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pw').value='';
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        
		if (document.getElementById('pw').value != ''
				&& document.getElementById('pw2').value != '') {
			if (document.getElementById('pw').value == document
					.getElementById('pw2').value) {
				document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
				document.getElementById('check').style.color = 'blue';
			} else {
				document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color = 'red';
			}
		}
	}
</script>

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
  width:100%;
  padding:10px 20px;
  border-radius:25px;
  background:#1161ee;
  display:block;
  color: #fff;
  font-size:15px;
  font-family: 'NanumSquareNeo-Variable_700';
}

.login-form .group .button#idChkBtn{
  border:none;
  width:30%;
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

.login-form .group .input#user{
  width:68%;
  display:inline-block;
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
<form action="regiAf.do" method="post">
  <div class="login-html">
    <div class="login-form">
      <div class="sign-up-htm">
      	<h1 align="center">회원가입</h1>
        <div class="group">
          <label for="user" class="label">아이디</label>
          <input id="user" name="id" type="text" class="input">
          <input type="button" id="idChkBtn" class="button" value="중복확인">
		  <p id="idcheck">
		  	<br>
		  </p>
        </div>
        <div class="group">
          <label for="pass" class="label">비밀번호</label>
          <input id="pw" name="pwd" type="password" class="input" data-type="password" onchange="check_pw()">
        </div>
        <div class="group">
          <label for="pass" class="label">비밀번호 확인</label>
          <input id="pw2" type="password" class="input" data-type="password" onchange="check_pw()">
        </div>
        <p id="check">
        	<br>
        </p>
        <div class="group">
          <label for="pass" class="label">이름</label>
          <input id="pass" name="name" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">생년월일(8자리)</label>
          <input id="pass" name="bdate" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">전화번호(-없이)</label>
          <input id="pass" name="phone" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">이메일</label>
          <input id="pass" name="email" type="email" class="input">
        </div>
        <div class="group">
          <input type="submit" id="regiBtn" class="button" value="회원가입">
        </div>
        <div class="foot-lnk">
          <br><br>
          <a href="login.do">이미 계정이 있으신가요?</a>
        </div>
      </div>
    </div>
  </div>
</form>
</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#idChkBtn").click(function() {
				// id의 빈칸을 조사!
				$.ajax({
					type : "post",
					url : "idcheck.do",
					data : {
						"id" : $("#user").val()
					},
					success : function(msg) {
						if (msg == "YES") {
							$("#idcheck").css("color", "#0000ff");
							$("#idcheck").text("사용할 수 있는 아이디입니다");
						} else {
							$("#idcheck").css("color", "#ff0000");
							$("#idcheck").text("사용 중인 아이디입니다");
							$("#user").val("");
						}
					},
					error : function() {
						alert('error');
					}
				});
			});
		});
		
		// 빈칸 입력 방지

		$(document).ready(function() {
		    $("#regiBtn").click(function() {   
		      if($('input[name="id"]').val().trim() == ''){
		        alert('아이디를 입력해주세요');
		        $('input[name="id"]').val('');
		        $('input[name="id"]').focus();
		        return false;
		      } 
		      else if($('input[name="pwd"]').val().trim() == ''){
		        alert('비밀번호를 입력해주세요');
		        $('input[name="pwd"]').val('');
		        $('input[name="id"]').focus();
		        return false;
		      } 
		      else if($('input[id="pw2"]').val().trim() == ''){
		        alert('비밀번호를 한번 더 입력해주세요');
		        $('input[id="pw2"]').val('');
		        $('input[id="pw2"]').focus();
		        return false;
		      } 
		      else if($('input[name="name"]').val().trim() == ''){
		        alert('이름을 입력해주세요');
		        $('input[name="name"]').val('');
		        $('input[name="name"]').focus();
		        return false;
		      } 
		      else if($('input[name="bdate"]').val().trim() == ''){
		        alert('생년월일을 입력해주세요');
		        $('input[name="bdate"]').val('');
		        $('input[name="bdate"]').focus();
		        return false;
		      } 
		      else if($('input[name="phone"]').val().trim() == ''){
		        alert('전화번호를 입력해주세요');
		        $('input[name="phone"]').val('');
		        $('input[name="phone"]').focus();
		        return false;
		      } 
		      else if($('input[name="email"]').val().trim() == ''){
		        alert('이메일을 입력해주세요');
		        $('input[name="email"]').val('');
		        $('input[name="email"]').focus();
		        return false;
		      } 
		     
		      
		    });
		});
		
		
		
	</script>
</body>
</html>