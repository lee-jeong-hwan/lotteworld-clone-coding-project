<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 방법선택 < 아이디찾기 < L.POINT</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var eamil = null;
		var e = null;
		var name =null;
		  $(".ui-input").change(function() {
			if($(this).find("input").val() == ''){
				$(this).removeClass("active");
			} else {
				$(this).addClass("active");
			}
		});  
		
		$('.row').hover(function(){  
	     	$(this).find(".col-md >label").css('color','black');    
		},function() {    
			$(this).find(".col-md >label").css('color','#8a8a8a');  
		});
		
		document.querySelector('[id=find-way-hp]').setAttribute('checked', 'checked');
		
		$("#section-find-hp").show();
		$("#section-find-emailid").hide();
		$("#section-find-ctfinfo").hide();
		
		$(".1").click(function(){
			$("#section-find-hp").show();
			$("#section-find-emailid").hide();
			$("#section-find-ctfinfo").hide();
		});
		
		$(".2").click(function(){
			$("#section-find-hp").hide();
			$("#section-find-emailid").show();
			$("#section-find-ctfinfo").hide();
		});
		

		
		//footer
		$("#first").click(function (){
			$(".one").show();	
			$(".two").hide();
		});
		$("#second").click(function (){
			$(".two").show();		
			$(".one").hide();
		});
		
		$('html').click(function(e) {   
			if(!$(e.target).hasClass("")) {
				$(".one").hide();
				$(".two").hide();
			}
		}); 
		//
		$("#checkBtn").click(function () {
			if($(".1").find("input[type='radio']").prop("checked")){
				if($("#find-hp-user-name").val()==''){
					alert("이름을 입력해주세요.");
				}else if(!$('#find-hp-user-hp-0 > option:selected').val()) {
					alert("휴대전화번호 첫번째 자리를 입력해주세요.");
				}else if($("#find-hp-user-hp-1").val()==""){
					alert("휴대전화번호 두번째 자리를 입력해주세요.");
				}else if($("#find-hp-user-hp-2").val()==""){
					alert("휴대전화번호 세번째 자리를 입력해주세요.");
				}else{
					name =$("#find-hp-user-name").val();
					var phone0 =$('#find-hp-user-hp-0').val();
					var phone1 =$("#find-hp-user-hp-1").val();
					var phone2 =$("#find-hp-user-hp-2").val();
					var phone = phone0+"-"+phone1+"-"+phone2;
					
					$.ajax({
						type: "get",
						url: "IDfind_phone",
						data: {"name":name , "phone":phone},
						datatype: "json",
						success : function(data){//얘가 서블렛에서 보내주는 값
							 e = data.result;
							
							function send_post(path, command, e) {
							       var form = document.createElement("form");
							       form.setAttribute("method", "post");
							       form.setAttribute("action", path);
							
							       var hiddenField = document.createElement("input");
							       hiddenField.setAttribute("type", "hidden");
							       hiddenField.setAttribute("name", "command");
							       hiddenField.setAttribute("value", command);
							       form.appendChild(hiddenField);
							
							       hiddenField = document.createElement("input");
							       hiddenField.setAttribute("type", "hidden");
							       hiddenField.setAttribute("name", "e");
							       hiddenField.setAttribute("value", e);
							       form.appendChild(hiddenField);
							
							       document.body.appendChild(form);
							       form.submit();
							   }
								send_post("LotteController", "IDfind", e);
						
						},
						error : function(r,s,e){
							location.href = "LotteController?command=IDnotfind";
						}
					});
					
				}
				
			}else if($(".2").find("input[type='radio']").prop("checked")){
				email = $("#find-email-user-email").val();
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				
				if($("#find-email-user-name").val()==''){
					alert("이름을 입력해주세요.");
				}else if($("#find-email-user-email").val()==''){
					alert("이메일주소를 입력해주세요.");
				}else if(exptext.test(email)==false){
						//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
						alert("이메일형식이 올바르지 않습니다.");
						return false;
				}else{
					name =$("#find-email-user-name").val();
					email = $("#find-email-user-email").val();
					$.ajax({
						type: "get",
						url: "IDfind_email",
						data: {"name":name , "email":email},
						datatype: "json",
						success : function(data){//얘가 서블렛에서 보내주는 값
							e = data.result;
							function send_post(path, command, e) {
							       var form = document.createElement("form");
							       form.setAttribute("method", "post");
							       form.setAttribute("action", path);
							
							       var hiddenField = document.createElement("input");
							       hiddenField.setAttribute("type", "hidden");
							       hiddenField.setAttribute("name", "command");
							       hiddenField.setAttribute("value", command);
							       form.appendChild(hiddenField);
							
							       hiddenField = document.createElement("input");
							       hiddenField.setAttribute("type", "hidden");
							       hiddenField.setAttribute("name", "e");
							       hiddenField.setAttribute("value", e);
							       form.appendChild(hiddenField);
							
							       document.body.appendChild(form);
							       form.submit();
							   }
								send_post("LotteController", "IDfind", e);
						},
						error : function(r,s,e){
							location.href = "LotteController?command=IDnotfind";
						}
					});
				}
			}
		});
	});
</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap" rel="stylesheet">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

@font-face {
	font-family: "NotoSans-Light";
	src: url(font/NotoSansKR-Light.otf);
}

@font-face {
	font-family: "NotoSans-Bold";
	src: url(font/NotoSansKR-Bold.otf);
}

@font-face {
	font-family: "NotoSans-Medium";
	src: url(font/NotoSansKR-Medium.otf);
}

@font-face {
	font-family: "NotoSans-Regular";
	src: url(font/NotoSansKR-Regular.otf);
}

@font-face {
	font-family: "NotoSans-Black";
	src: url(font/NotoSansKR-Black.otf);
}

@font-face {
	font-family: "NotoSans-Thin";
	src: url(font/NotoSansKR-Thin.otf);
}
@font-face {
	font-family: "NotoSans-Light";
	src: url(font/NotoSansKR-Light.otf);
}

@font-face {
	font-family: "NotoSans-Bold";
	src: url(font/NotoSansKR-Bold.otf);
}

@font-face {
	font-family: "NotoSans-Medium";
	src: url(font/NotoSansKR-Medium.otf);
}

@font-face {
	font-family: "NotoSans-Regular";
	src: url(font/NotoSansKR-Regular.otf);
}

@font-face {
	font-family: "NotoSans-Black";
	src: url(font/NotoSansKR-Black.otf);
}

@font-face {
	font-family: "NotoSans-Thin";
	src: url(font/NotoSansKR-Thin.otf);
}
#KOR{
    font-family: 'Noto Sans KR','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo',AppleGothic,Dotum,'돋움',sans-serif;
}

body {
	font-weight: 400;
	font-size: 15px;
	letter-spacing: -0.05em;
	word-break: keep-all;
	text-size-adjust: none;
	-webkit-text-size-adjust: none;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	font-style: normal;
	font-weight: inherit;
	border: 0;
	vertical-align: baseline;
}

input, button, select, textarea {
	margin: 0;
	padding: 0;
	font: inherit;
	border: 0;
	appearance: none;
	-moz-appearance: none;
	-webkit-appearance: none;
	border-radius: 0;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
}

button {
	margin: 0;
	padding: 0;
	border: none;
	background: none;
	cursor: pointer;
}

* {
	box-sizing: border-box;
}

:root { -
	-swiper-navigation-size: 44px;
}

#mast-head {
	height: 80px;
	border-bottom: 1px solid #ebebeb;
}

#mast-head .container {
	position: relative;
}

#mast-head>.container, #mast-foot>.container {
	margin: 0 auto;
	max-width: 1100px;
}

#mast-head .bi {
	font-size: 16px;
	height: 80px;
	line-height: 80px;
	background: url(Img/ico-with.png) no-repeat 90px 53%;
}

#mast-head .bi a {
	float: left;
}

a {
	color: #555;
	text-decoration: none;
}

#mast-head .bi a:first-child img {
	height: 18px;
}

#mast-head .bi a img {
	max-height: 50px;
	width: auto;
}

#mast-head .bi img {
	vertical-align: middle;
}

img {
	border: 0;
	vertical-align: top;
}

#mast-head .bi>a:nth-child(2) {
	margin-left: 38px;
}

#mast-head .bi a {
	float: left;
}

#mast-head .bi:after {
	content: '';
	display: block;
	clear: both;
}

#mast-body .container {
	margin: 0 auto;
	padding: 40px 0 100px 0;
	max-width: 1100px;
}

#mast-body .toparea {
	margin-bottom: 65px;
}

.title {
	margin-bottom: 38px;
	padding: 8px 0;
	font-weight: 100;
	font-size: 28px;
	line-height: 32px;
	color: #000;
	word-break: break-all;
	font-family: "NotoSans-Thin";
}
.headline {
    margin: 0 0 10px;
    font-weight: 100;
    font-size: 42px;
    line-height: 54px;
    color: #000;
    letter-spacing: -0.05em;
    word-break: break-all;
}
.__half {
    margin: 0 0 70px !important;
}
.subject.__underline {
    border-bottom: 1px solid #000;
}

.subject {
    font-size: 17px;
    color: #000;
    padding-bottom: 5px;
}
.section > .row {
    padding: 20px 0;
    border-bottom: 1px solid #d0d0d0;
}
.row {
    display: table;
    width: 100%;
    table-layout: fixed;
}
.section.__find > .row > .col-md {
    display: block;
    width: 100%;
    color: #000;
}

.section > .row > .col-md:first-child {
    width: 160px;
    color: #8a8a8a;
}
.section > .row > .col-md, .section > .row .col-md .row > .col-md {
    color: #8a8a8a;
}
.row .col-md, .row .col-md-1, .row .col-md-2, .row .col-md-3, .row .col-md-4, .row .col-md-5, .row .col-md-6, .row .col-md-7, .row .col-md-8, .row .col-md-9, .row .col-md-10, .row .col-md-11, .row .col-md-12 {
    display: table-cell;
    vertical-align: top;
}
.ui-radio {
    position: relative;
    display: inline-block;
    margin: 0 20px 0 0;
}
.ui-radio > input {
    position: absolute;
    left: 1px;
    top: 1px;
    width: 14px;
    height: 14px;
}

.ui-radio > label {
    display: inline-block;
    padding: 0 0 0 25px;
    min-height: 18px;
    line-height: 18px;
    font-size: inherit;
    vertical-align: top;
    cursor: pointer;
}
.ui-radio > input:checked + label:before {
    background-position: -46px 0;
}

.ui-radio > label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    background: #fff url(Img/ui-input.png) no-repeat 0 0;
    background-size: 90px 18px;
    overflow: hidden;
}
.section.__find .inner-content.active {
    margin: 20px 0 -20px;
}


.section.__find .inner-content {
    display: none;
    margin: 20px 0;
    padding: 25px;
    border-top: 1px solid #eee;
    background-color: #fafafa;
}
.ui-radio-accodion .inner-content {
    display: none;
}
..section.__find .inner-content > .row {
    padding: 20px 0;
}
.section.__find .inner-content .col-md:first-child {
    width: 160px;
}
..form-wrap.__normal .ui-input {
    margin: 0 6px 0 0;
    max-width: 462px;
    width: 100%;
}

.ui-input {
    position: relative;
    display: inline-block;
    vertical-align: top;
    background-color: #f0f0f0;
}
.ui-input.active > input {
    opacity: 1;
    background: none;
}
.ui-input > input {
    position: relative;
    padding: 0 10px;
    width: 100%;
    height: 34px;
    font-size: 14px;
    line-height: 34px;
    border: 0;
    background-color: #fff;
    opacity: 0;
    z-index: 1;
}
.ui-input > .placeholder {
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    padding: 0 10px;
    font-size: 13.125px;
    line-height: 34px;
    color: #8a8a8a;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.ui-input > input:focus + .placeholder, .ui-input > input.__focus + .placeholder, .ui-input.active > .placeholder {
    display: none;
}
.ui-input > input:focus, .ui-input > input.__focus, .ui-select:focus, .ui-select.__focus, .ui-radio > input:focus + label, .ui-check > input:focus + label{
	outline: 1px solid #0092fa;
	background-color : #fff;
	opacity: 1;
}
.section.__find .inner-content > .row {
    padding: 20px 0;
}

.row {
    display: table;
    width: 100%;
    table-layout: fixed;
}
.section.__find .inner-content .col-md:first-child {
    width: 160px;
}

.section > .row > .col-md, .section > .row .col-md .row > .col-md {
    color: #8a8a8a;
}
.row .col-md, .row .col-md-1, .row .col-md-2, .row .col-md-3, .row .col-md-4, .row .col-md-5, .row .col-md-6, .row .col-md-7, .row .col-md-8, .row .col-md-9, .row .col-md-10, .row .col-md-11, .row .col-md-12 {
    display: table-cell;
    vertical-align: top;
}
.form-wrap.__phone .ui-select {
    width: 108px;
}

.ui-select {
    position: relative;
    padding: 0 5px;
    height: 34px;
    line-height: 32px;
    font-size: 13.905px;
    color: #000;
    border: 1px solid #f0f0f0;
    border-radius: 0;
    background-color: #f0f0f0;
}
select {
    background: url(Img/ui-select.png) no-repeat 100% center;
    background-size: 30px 30px;
}
.form-wrap.__phone .ui-input, .form-wrap.__phone .ui-input > input {
    text-align: center;
}

.form-wrap.__phone .ui-input {
    margin: 0 0 0 7px;
}
.form-wrap.__phone .ui-input {
    width: 108px;
    text-align: center;
}
.form-wrap.__phone .ui-input:before {
    content: '-';
    position: absolute;
    left: -10px;
    width: 10px;
    line-height: 32px;
    color: #8a8a8a;
    text-align: center;
}
.form-wrap.__normal .ui-input {
    margin: 0 6px 0 0;
    max-width: 462px;
    width: 100%;
}
.section.__find .inner-content.active {
    margin: 20px 0 -20px;
}
.section.__find > .row > .col-md {
    display: block;
     width: 100%; 
    color: #000;
}
#section-certify-way .item-wrap > li.el .brand {
    margin-top: 8px;
    color: #333;
    margin-left : 10px;
}
#section-certify-way .item-wrap {
    width: 100%;
    overflow: hidden;
    padding: 0 0 10px 0;
    border-bottom: 1px solid #d0d0d0;
}
.description > p:first-child {
    margin: 0;
}

.description > p {
    position: relative;
    margin: 10px 0 0;
    padding: 0 0 0 10px;
}
.description {
    font-size: 15px;
    line-height: 1.2;
    color: #8a8a8a;
    word-break: break-all;
    padding: 10px 0 0 0;
}
.description > p:before {
    position: absolute;
    left: 0;
    top: 0;
    content: '- ';
}
.__center {
    text-align: center;
}
.ui-button.__black {
    color: #fff;
    background-color: #333;
}

.ui-button.__square-large {
    padding: 0 10px;
    min-width: 9.375em;
    height: 40px;
    line-height: 40px;
}
.ui-button {
    display: inline-block;
    font-weight: inherit;
    font-size: inherit;
    text-align: center;
    vertical-align: top;
    border: none;
    border-radius: 2px;
    background: transparent;
    overflow: hidden;
}
.ui-button.__point-color {
    color: #fff;
    background-color: #0092fa;
}
</style>
</head>
<body id="KOR">
	<div id="mast-head">
		<div class="container">
			<h1 class="bi">
				<a href="https://www.lpoint.com/"
					onclick="return fnWindowOpen(this.href);" target="_blank"> <img
					src="Img/bi-lpoint-new.png" alt="L.POINT"></a> 
				<a href="http://adventure.lotteworld.com"
					onclick="return fnWindowOpen(this.href);" target="_blank" class="">
					<img src="Img/img_1040.png" alt="롯데월드" id="ccoLogo">
				</a>
			</h1>
		</div>
	</div>
	<div id="mast-body">
	<div class="container">
		<!-- toparea -->
		<div class="toparea">
			<h2 class="title">아이디 찾기</h2><!-- 아이디 찾기 -->
			<div class="headline">
				<!-- 등록된 회원정보로<br>아이디를 찾으실 수 있습니다. -->
				등록된 회원정보로<br>아이디를 찾으실 수 있습니다.
			</div>
		</div>
		<!-- //toparea -->

		<!-- contents -->
		<div class="contents">
			<!-- section : 아이디찾기 -->
			<div class="section __half __find ui-radio-accodion" id="resident">
				<div class="subject __underline"></div>
				
				<!-- 휴대폰 번호로 찾기 -->
				<div class="row phone">
					<div class="col-md">
						<!-- 선택 -->
						<div class="ui-radio 1">
							<input type="radio" id="find-way-hp" name="member-find-way" data-id="section-find-hp" data-code="1" data-trigger="#section-find-hp">
							<label for="find-way-hp">휴대폰 번호로 찾기 </label><!-- 휴대폰 번호로 찾기 -->
						</div>
						<!-- 펼침 -->
						<div id="section-find-hp" class="inner-content active">
							<!-- 이름 -->
							<div class="row">
								<div class="col-md">
									<label for="find-hp-user-name">이름</label><!-- 이름 -->
								</div>
								<div class="col-md">
									<div class="form-wrap __normal">
										<div class="ui-input">
											<input type="text" id="find-hp-user-name" data-type="cstNm" maxlength="20" class="">
											<span class="placeholder">한글 또는 영문으로 입력해주세요. </span><!-- 한글 또는 영문으로 입력해주세요. -->
										</div>
									</div>
								</div>
							</div>
							<!-- 휴대폰 번호 -->
							<div class="row">
								<div class="col-md">
									<label for="find-hp-user-hp-0">휴대폰 번호</label><!-- 휴대폰 번호 -->
								</div>
								<div class="col-md">
									<div class="form-wrap __phone">
										<select title="통신사번호" id="find-hp-user-hp-0" name="mbzNoC" data-type="mbzNoC" class="ui-select">
											<option value="">선택<!-- 선택 --></option>
											
												<option value="010">010</option>
											
												<option value="011">011</option>
											
												<option value="016">016</option>
											
												<option value="017">017</option>
											
												<option value="018">018</option>
											
												<option value="019">019</option>
											 
										</select>
										<div class="ui-input">
											<input type="tel" id="find-hp-user-hp-1" style="ime-mode:disabled;" maxlength="4" data-type="mmtExno">
										</div>
										<div class="ui-input">
											<input type="tel" id="find-hp-user-hp-2" style="ime-mode:disabled;" maxlength="4" data-type="mtlno">
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- //펼침 -->
					</div>
				</div>
				<!-- 이메일 주소로 찾기 -->
				<div class="row email">
					<div class="col-md">
						<!-- 선택 -->
						<div class="ui-radio 2">
							<input type="radio" id="find-way-email" name="member-find-way" data-id="section-find-emailid" data-code="2" data-trigger="#section-find-emailid"> <!-- 초기 활성화 시, checked="checked" 추가 -->
							<label for="find-way-email">이메일주소로 찾기 </label><!-- 이메일 주소로 찾기 -->
						</div>
						<!-- 펼침 -->
						<div id="section-find-emailid" class="inner-content active">
							<!-- 이름 -->
							<div class="row">
								<div class="col-md">
									<label for="find-email-user-name">이름</label><!-- 이름 -->
								</div>
								<div class="col-md">
									<div class="form-wrap __normal">
										<div class="ui-input">
											<input type="text" id="find-email-user-name" data-type="cstNm" maxlength="20">
											<span class="placeholder">한글 또는 영문으로 입력해주세요.</span><!-- 한글 또는 영문으로 입력해주세요. -->
										</div>
									</div>
								</div>
							</div>
							<!-- 이메일 주소 -->
							<div class="row">
								<div class="col-md">
									<label for="find-email-user-email">이메일 주소 </label><!-- 이메일 주소 -->
								</div>
								<div class="col-md">
									<div class="form-wrap __normal">
										<div class="ui-input">
											<input type="email" id="find-email-user-email" data-type="elcAdd" maxlength="50">
											<span class="placeholder">이메일주소를 입력해주세요.</span><!-- 이메일 주소를 입력해주세요. -->
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- //펼침 -->
					</div>
				</div>
				
				<!-- <div class="row self">
					<div class="col-md">
						선택
						<div class="ui-radio 3">
							<input type="radio" id="find-way-ctfinfo" name="member-find-way" data-id="section-find-ctfinfo" data-code="6" data-trigger="#section-find-ctfinfo"> 초기 활성화 시, checked="checked" 추가
							<label for="find-way-ctfinfo">본인인증으로 찾기 </label>본인인증으로 찾기
						</div>
						펼침
						<div id="section-find-ctfinfo" class="inner-content active">
							<div id="section-certify-way">
								<ul class="item-wrap">
									<li class="el">
						                <a href="#" onclick="callNaverCtf()">
						                  <div class="icon"><img width="60" height="60" src="Img/ico-certify-naver__x2.png" srcset="/resources/images/ico/ico-certify-naver__x2.png 2x,/resources/images/ico/ico-certify-naver__x3.png 3x" alt=""></div>
						                  <div class="brand">네이버네이버</div>
						                </a>
						              </li>
								</ul>
							</div>
							<div class="description">
								<p>법인 명의 휴대폰 사용자는 통신사 지점 또는 대리점에 방문하여 법인명의 실사용자 등록 후 휴대폰 인증이 가능합니다.</p>
								<p>
									법인 명의 휴대폰 사용자는 통신사 지점 또는 대리점에 방문하여 법인명의 실사용자 등록 후 휴대폰 인증이 가능합니다.
								</p>
							</div>
						//펼침
						</div>
					</div>
				</div> -->
				</div>
				
			<!-- //section -->

			<!-- btn -->
			<div class="btn-area __center">
				<button type="button" class="ui-button __square-large __black"  onclick="history.back()">취소 </button>
				<button type="button" class="ui-button __square-large __point-color" id="checkBtn">다음 </button>
			</div>
		</div>
		<!-- //contents -->
	</div>
</div>
	<!-- footer -->
	<style>
#mast-foot {
	padding: 30px 0;
	border-top: 1px solid #d0d0d0;
}

#mast-foot>.container {
	position: relative;
}

#mast-head>.container, #mast-foot>.container {
	margin: 0 auto;
	max-width: 1100px;
}

#mast-foot .utility .item {
	display: inline-block;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

a {
	color: #555;
	text-decoration: none;
}

#mast-foot .utility .item:before {
	content: '·';
	display: inline;
	margin: 0 5px;
	color: #b8b8b8;
}

#mast-foot .utility .item:first-child:before {
	display: none;
}

#mast-foot .utility .item>a {
	font-size: 13.905px;
	color: #8a8a8a;
}

.__point-color {
	color: #0092fa;
}

#mast-foot .com-address {
	margin: 10px 0 0 0;
	font-size: 13.905px;
	color: #8a8a8a;
}

#mast-foot .com-address span {
	white-space: nowrap;
}

#mast-foot .com-address span:not(:last-child):after {
	content: '|';
	display: inline;
	margin: 0 5px;
	color: #b7b7b7;
}

#mast-foot .copyright {
	margin: 10px 0 10px;
	font-size: 13.905px;
	color: #000;
}

#mast-foot .friendly {
	position: absolute;
	right: 0;
	top: 0;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}

#mast-foot .site-linker>button:before {
	content: '';
	position: absolute;
	top: 50%;
	right: 10px;
	margin: -2px 0 0;
	width: 0;
	height: 0;
	vertical-align: middle;
	border: 1px solid transparent;
	border-top-color: #333;
	border-width: 4px 4px 0;
}

#mast-foot .site-linker>ul {
	display: none;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 33px;
	padding: 10px 0;
	max-height: 200px;
	border: 1px solid #b7b7b7;
	background-color: #fff;
	overflow: hidden;
	overflow-y: auto;
	overflow-scrolling: touch;
	-webkit-overflow-scrolling: touch;
}

ul, ol, dl, li {
	list-style: none;
}

#mast-foot .site-linker>ul li>a {
	display: block;
	padding: 2px 10px;
	font-size: inherit;
	color: #8a8a8a;
}

#mast-foot .site-linker {
	position: relative;
	display: inline-block;
	margin: 0 2px;
	width: 150px;
	font-size: 12.855px;
	background-color: #fff;
}

#mast-foot .site-linker>button {
	width: 100%;
	height: 34px;
	color: #333;
	text-indent: -26px;
	border: 1px solid #b7b7b7;
}
</style>
	<div id="mast-foot">
		<div class="container">
			<div class="utility">
				<div class="item">
					<a href="http://www.lottemembers.com/">회사소개<!-- 회사소개 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDE100100.do">고객센터<!-- 고객센터 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do">이용약관<!-- 이용약관 --></a>
				</div>
				<div class="item">
					<a href="https://m.lpoint.com/app/center/LWDD100100.do?popup=4"><em
						class="__point-color">개인정보처리방침<!-- 개인정보처리방침 --></em></a>
				</div>
			</div>
			<div class="com-address">
				<address>
					<span>서울시 중구 통일로 2길 16 AIA타워 14층<!-- 서울시 중구 통일로 2길 16 AIA타워 14층 --></span>
					<span>회사명 롯데멤버스(주)<!-- 회사명 롯데멤버스(주) --></span> <span>대표이사
						전형식<!-- 대표이사 강승하 -->
					</span> <span>사업자등록번호 104-86-58491<!-- 사업자등록번호 104-86-58491 --></span> <span>고객센터
						1899-8900<!-- 고객센터 1899-8900 -->
					</span>
				</address>
			</div>
			<div class="copyright">© LOTTE MEMBERS CO.,LTD.</div>
			<div class="friendly">
				<div class="site-linker">
					<button type="button" role="button" id = "first">
						Service Site
						<!-- Service Site -->
					</button>
					<ul class= "one">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpoint.com">L.POINT<!-- L.POINT --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lpay.com">L.pay<!-- L.pay --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://www.lime-in.co.kr">라임<!-- 라임 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="https://partners.lpoint.com">L.POINT 파트너스<!-- L.POINT 파트너스 --></a></li>
					</ul>
				</div>
				<div class="site-linker">
					<button type="button" role="button" id = "second">
						Family Site
						<!-- Family Site -->
					</button>
					<ul class= "two">
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.co.kr">롯데그룹<!-- 롯데그룹 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottetown.com">롯데타운<!-- 롯데타운 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotte.com/">롯데닷컴<!-- 롯데닷컴 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottemart.com/">롯데마트<!-- 롯데마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.vic-market.com/vicmarket/main.do">롯데빅마켓<!-- 롯데빅마켓 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.toysrus.co.kr/to/main.do">토이저러스<!-- 토이저러스 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottesuper.co.kr/">롯데슈퍼<!-- 롯데슈퍼 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteimall.com/main/Index.jsp">롯데홈쇼핑<!-- 롯데홈쇼핑 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">바이더웨이<!-- 바이더웨이 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.7-eleven.co.kr/">세븐일레븐<!-- 세븐일레븐 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.himart.co.kr/">하이마트<!-- 하이마트 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.fujifilm.co.kr/">한국후지필름<!-- 한국후지필름 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lohbs.co.kr/main.do">LOHB's<!-- LOHB's --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.ellotte.com/">롯데백화점<!-- 롯데백화점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://kr.lottedfs.com/main">롯데면세점<!-- 롯데면세점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottefitin.com">롯데피트인<!-- 롯데피트인 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://gimpoairport.lottemall.co.kr">롯데몰 김포공항점<!-- 롯데몰 김포공항점 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lwt.co.kr">롯데월드몰<!-- 롯데월드몰 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=021&amp;gubun=2">롯데영플라자<!-- 롯데영플라자 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=057">롯데아울렛<!-- 롯데아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://store.lotteshopping.com/handler/Main-Start?subBrchCd=054&amp;gubun=1">롯데프리미엄아울렛<!-- 롯데프리미엄아울렛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.mujikorea.net/">무인양품<!-- 무인양품 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.uniqlo.kr/">유니클로<!-- 유니클로 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteria.com/">롯데리아<!-- 롯데리아 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.angelinus.co.kr/">엔제리너스커피<!-- 엔제리너스커피 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.tgif.co.kr/">T.G.I FRIDAY'S<!-- T.G.I FRIDAY'S --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.natuur.co.kr/">나뚜루POP<!-- 나뚜루POP --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.krispykreme.co.kr/">크리스피크림도넛<!-- 크리스피크림도넛 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.boulangerie.co.kr/">보네스뻬<!-- 보네스뻬 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottecinema.co.kr/">롯데시네마<!-- 롯데시네마 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/">롯데월드 어드벤처<!-- 롯데월드 어드벤처 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/aquarium/index.asp">롯데월드
								아쿠아리움<!-- 롯데월드 아쿠아리움 -->
						</a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lotteworld.com/waterpark/index.asp">롯데 워터파크<!-- 롯데 워터파크 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.giantsclub.com/">롯데자이언츠<!-- 롯데자이언츠 --></a></li>
						<li><a target="_blank"
							onclick="return fnWindowOpen(this.href);" title="새 창"
							href="http://www.lottejtb.com/">롯데제이티비<!-- 롯데제이티비 --></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>