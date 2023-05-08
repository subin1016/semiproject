<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDto login = (MemberDto)session.getAttribute("login");

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 추가 -->
<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable_300';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 300;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_500';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 500;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable_1000';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 1000;
    font-style: normal;
}

table#pay{
	width: 80%;
	border: 2px;
	border-radius: 10px;
	border-collapse: collapse;
	font-family: 'NanumSquareNeo-Variable_500';
	
}

table#pay tr td:hover{
	background-color: rgba(0,0,0,0.05);
}


/* tr 부분에 줄 넣기 */
.trS{
	border-bottom: 1px solid;
	border-top: 1px solid;
	margin: 5px;
}

/* 상품 td */
.tdP{
	margin: 5px;
	padding: 5px;
}

/* 이미지 클릭 막음 */
#not { 
	pointer-events: none; 
}


button.btn_payment {
    padding: 10px 30px;
    border-radius: 15px;
    text-decoration: none;
    background-color: #2873F6;
    border: 3px solid #2873F6;
    color: white;
    font-family: 'NanumSquareNeo-Variable_500';
}

button.btn_payment:hover {
    background-color: white;
    color: #2873F6;
    font-family: 'NanumSquareNeo-Variable_500';
}

.orderP{

	margin: auto;
	padding: 5px 30px;
	width: 300px;
	vertical-align: middle;
	border: none; 
	align-content: center;
	pointer-events: none; 
	
}

input#bAddr{
	border-radius: 5px;
	font-family: 'NanumSquareNeo-Variable_500';
	padding: 7px;
}


</style>

<!-- jquery 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 아임포트(결제) 사용 -->
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>

<!-- 결제 양식에 등록한 데이터를 아래 '아임포트' 양식에 넣어 결제정보 입력 (*PostMapping)-->
<!-- 합치실 때 상품 정보 긁어오신거 아래 input 값에 넣어주시면 됩니다! -->

<form action="paymentAf.do" id="frm" method="post">
	<input type="hidden" name="bid" value="<%=login.getId() %>">

<table style="width=70%; border-radius: 20px" id="pay">
<col width="30%"/><col width="30%"/><col width="30%"/>

<!-- 주문 상품 확인 row -->
<tr class="trS">
	<th><h2>주문 상품</h2></th><th>상품명</th><th>상품 금액</th>
</tr>
<tr height="100px">
	<td class="tdP">
		<div align="center"><input type="image" id="not" name="pImg1" width="100px" readonly="readonly" src="<%=request.getParameter("pImg") %>"></div>
		<input type="hidden" id="pImg" name="pImg" readonly="readonly" value="<%=request.getParameter("pImg") %>">
	</td>
	<td class="tdP">
		<input class="orderP" type="hidden" id="pName" name="pName" readonly="readonly" value="<%=request.getParameter("payName") %>">
		<div align="center"><p><%=request.getParameter("payName") %></p></div>
	</td>	
	<td class="tdP">	
		<input type="hidden" id="pPrice" name="pPrice" readonly="readonly" value="<%=request.getParameter("payPrice") %>">
		<div align="center"><p><%=request.getParameter("payPrice") %></p></div>
	</td>
</tr>

<tr class="trS">
	<th colspan="2"><h2>주문자 정보</h2></th><th style="border-left: 1px solid"><h2>결제 금액</h2></th>
</tr>

<tr>
	<td>
		<div align="center"><h3>주문자</h3></div>
	</td>
	<td>
		<input type="hidden" class="orderP" id="bName" name="bName" value="<%=login.getName()%>">
		<div align="center"><p><%=login.getName()%></p></div>
	</td>
	<td rowspan="4" style="border-left: 1px solid">
		<div align="center"><h2>￦<%=request.getParameter("payPrice") %></h2></div><br>
		<div align="center"><button class="btn_payment" type="button" onclick="requestPay()">결제하기</button></div>
	</td>
</tr>
<tr>
	<td>
		<div align="center"><h3>이메일</h3></div>
	</td>
	<td>
		<input type="hidden" id="bEmail" name="bEmail" value="<%=login.getEmail()%>">
		<div align="center"><p><%=login.getEmail()%></p></div>
	</td>
</tr>
<tr>
	<td>
		<div align="center"><h3>전화번호</h3></div>
	</td>
	<td>
		<input type="hidden" id="bTel" name="bTel" value="<%=login.getPhone()%>">
		<div align="center"><p><%=login.getPhone()%></p></div>
	</td>
</tr>
<tr>
	<td>
		<div align="center"><h3>주소(선택사항)</h3></div>
	</td>
	<td>
		<div align="center"><input type="text" id="bAddr" name="bAddr" placeholder="주소(선택사항)"></div>
	</td>
</tr>


</table>
	<!-- paymentAf 화면에서 보여줄 카드 승인번호 세팅 + 고유id, 상점 거래 id -->
	<!-- 결제 완료되면 알아서 들어갑니다! -->
	<input type="text" id="approvalNumber" name="approvalNumber" hidden="true">
	<input type="text" id="imp_uid" name="imp_uid" hidden="true">
	<input type="text" id="merchant_uid" name="merchant_uid" hidden="true">
	<input type="hidden" id="locid" name="locid" value="<%=request.getParameter("locid") %>">
	<input type="hidden" id="seq" name="seq" value="<%=request.getParameter("seq") %>">

<br/>
<br/>
<br/>
<!-- <button class="btn_payment" type="button" onclick="requestPay()">결제하기</button> -->
</form>


<script type="text/javascript">
function requestPay(){
	// 가맹점 식별코드 (회원가입 후 발급 -> 사용)
	IMP.init('imp42401502');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),    // 거래 id     - 거래 시간을 가지고 임의 생성
	    name : $("#pName").val() ,                            // 상품명       - 결제창에 보여지는 상품명       
	    amount : $("#pPrice").val() ,                         // 상품 가격     - 결제되는 금액             
	    buyer_email : $("#bEmail").val() ,                    // 구매자 email - 말 그대로...
	    buyer_name : $("#bName").val() ,                      // 구매자 이름    - 말 그대로...
	    buyer_tel : $("#bTel").val() ,                        // 구매자 전화번호  - 말 그대로...
	    buyer_addr : $("#bAddr").val() ,                      // 구매자 주소    - 말 그대로...       
	   }, function(rsp) {
		console.log(rsp);
		// 결제 성공  
	    if ( rsp.success ) {
	    	// 결제 성공 메시지 (결제 완료 메시지만 띄우고 아래 정보들을 '결제 이후 페이지'에 명세서 형식으로 넣는 것도 괜찮을듯...? -> 완료)
	    	var msg = '결제가 완료되었습니다!';

	    	// paymentAf 화면에서 보여줄 카드 승인번호 세팅, 고유 ID/ 상점 거래ID 세팅
	        document.getElementById('approvalNumber').setAttribute( 'value', rsp.apply_num );
	        document.getElementById('imp_uid').setAttribute( 'value', rsp.imp_uid );
	        document.getElementById('merchant_uid').setAttribute( 'value', rsp.merchant_uid );

	    // 결제 실패
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
        
        // 결제 이후 페이지로 이동 (위에서 말한대로 결제 정보를 짐싸서 가져가면 명세서를 만들 수 있을지도 모르겠다... -> 완료)
	    $("#frm").submit();
	    
	});
}
</script>

</body>
</html>