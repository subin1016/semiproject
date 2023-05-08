<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable_700';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

html, a {
    font-family: 'NanumSquareNeo-Variable_700';
}

body, ul, li, h1, h2, h3, h4, h5 {
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}


/* 슬라이더 1 시작 */
.slider-1 {
    height:600px;
    position:relative;
}

/* 슬라이더 1 - 페이지 버튼 */
.slider-1 > .page-btns {
    text-align:center;
    position:absolute;
    bottom:20px;
    left:0;
    width:100%;
}

.slider-1 > .page-btns > div {
    width:20px;
    height:20px;
    background-color:rgba(255,255,255,.5);
    border-radius:4px;
    display:inline-block;
    cursor:pointer;
}

.slider-1 > .page-btns > div.active {
    background-color:rgba(255,255,255,1);
}

/* 슬라이더 1 - 슬라이드 */

.slider-1 > .slides > div {
    position:absolute;
    top:0;
    left:0;
    right:0;
    bottom:0;
    opacity:0;
    transition: opacity 0.3s;
    background-position:center;
    background-size:cover;
    background-repeat:no-repeat;
}

.slider-1 > .slides > div.active {
    opacity:1;
}

/* 슬라이더 좌우 버튼 */
.slider-1 > .side-btns > div {
    position:absolute;
    top:0;
    left:0;
    width:25%;
    height:100%;
    cursor:pointer;
}
.slider-1 > .side-btns > div:last-child {
    left:auto;
    right:0;
}
.slider-1 >.side-btns > div > span {
    position:absolute;
    top:50%;
    left:20px;
    transform:translatey(-50%);
    background-color:white;
    opacity:0.5;
    padding:1px 13px;
    border-radius:50px;
    font-size:25px;
}
.slider-1 >.side-btns > div:last-child > span {
    left:auto;
    right:20px;
}

/* 슬라이더 1 끝 */
</style>

</head>
<body>


<div class="slider-1" >
    <div class="slides">
        <div class="active" style="background-image:url(https://img.modetour.com/promotion20/10702/1100_10702.jpg?auto=compress,format);"
        	onclick="location.href='package.do?ID=LOC1910&youtube=https://www.youtube.com/embed/8R6-rmrSG3g';">
        </div><!--일본  -->
        <div style="background-image:url(https://img.modetour.com/promotion20/11552/1100_11552.jpg?auto=compress,format);"
        	onclick="location.href='package.do?ID=LOC3&youtube=https://www.youtube.com/embed/tsqRtPfBu7w';">
        </div><!--동남아  -->
        <div style="background-image:url(https://img.modetour.com/promotion20/12082/1100_12082.jpg?auto=compress,format);"
        	onclick="location.href='package.do?ID=LOC9&youtube=https://www.youtube.com/embed/73R2SqrrODU';">
        </div><!--유럽  -->
        <div style="background-image:url(https://img.modetour.com/promotion20/12030/1100_12030.jpg?auto=compress,format);"
        	onclick="location.href='package.do?ID=LOC7&youtube=https://www.youtube.com/embed/5SJajXTIa0I';">
        </div><!--미국  -->
        <div style="background-image:url(https://img.modetour.com/promotion/8754/1100_8754.jpg?auto=compress,format);"
        	onclick="location.href='package.do?ID=LOC8&youtube=https://www.youtube.com/embed/xOP0pPQmb4Q';">
        </div><!--호주  -->
    </div>
    <div class="page-btns">
        <div class="active"></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
    <div class="side-btns">
        <div>
            <span><i class="fas fa-angle-left"></i></span>
        </div>
        <div>
            <span><i class="fas fa-angle-right"></i></span>
        </div>
    </div>
</div>

<script type="text/javascript">
console.clear();

//기존 버튼형 슬라이더
$('.slider-1 > .page-btns > div').click(function(){
 var $this = $(this);
 var index = $this.index();
 
 $this.addClass('active');
 $this.siblings('.active').removeClass('active');
 
 var $slider = $this.parent().parent();
 
 var $current = $slider.find(' > .slides > div.active');
 
 var $post = $slider.find(' > .slides > div').eq(index);
 
 $current.removeClass('active');
 $post.addClass('active');
});

//좌/우 버튼 추가 슬라이더
$('.slider-1 > .side-btns > div').click(function(){
 var $this = $(this);
 var $slider = $this.closest('.slider-1');
 
 var index = $this.index();
 var isLeft = index == 0;
 
 var $current = $slider.find(' > .page-btns > div.active');
 var $post;
 
 if ( isLeft ){
     $post = $current.prev();
 }
 else {
     $post = $current.next();
 };
 
 if ( $post.length == 0 ){
     if ( isLeft ){
         $post = $slider.find(' > .page-btns > div:last-child');
     }
     else {
         $post = $slider.find(' > .page-btns > div:first-child');
     }
 };
 
 $post.click();
});

setInterval(function(){
 $('.slider-1 > .side-btns > div').eq(1).click();
}, 3000);

</script>

</body>
</html>