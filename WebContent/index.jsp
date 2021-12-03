<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h1 {text-align: center;}
p {text-align: center;}
div {text-align: center;}
</style>
<title>고교학점제 수강신청 프로그램</title>
</head>
<body>
<header>
	<!--  header-top -->
	<div class="header-top">
		<h1 class="logo">
		<a>
			<img alt="미래를 여는 선택 고교학점제" src="img/img1.png">
		</a>
		</h1>
	</div>
</header>
<img src="img/img2.jpg" alt="Girl in a jacket" width="1500" height="500">
<p class="search-school-title"> 
<h1>연구*선도학교</h1>
<h2>
	2025년 고교학점제의 안정적인 도입을 위하여 2018년부터 연구·선도학교를 지정, 고교학점제를 시범 운영하고 있습니다.<br>
	또한 연구·선도 학교가 아닌 일반 학교에서도 고교학점제를 미리 준비할 수 있도록 다양한 일반고 지원 사업이 추진되고 있습니다.</h2></p>
	<h3>연구학교(10)</h3>
	<h3>
	<a href="boardForm.k">스프링 게시판 : 글쓰기</a><br>
	<a href="boardSelectAll.k">스프링 게시판 : 글목록 조회</a><br>
	<a href="rboardForm.k">스프링 게시판 : 댓글 테스트</a><br>
	<a href="boardSelectPaging.k">스프링 게시판 : 글 목록 페이징 테스트</a><br>
	<input type="checkbox" name="high school1"  onclick="calc(this)">코스모스고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">당곡등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">동북고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">문현고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">배명고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">불암고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">압구정고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">잠일고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">정원고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">한서고등학교<br><hr></h3>
	<h3>선도학교(43)</h3>
	<h3>
	<input type="checkbox" name="high school2"  onclick="calc(this)">강서등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">경기고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">경신고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">경희여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">관악고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">광남고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">광문고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">구현고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">노원고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">누원고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">대영고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">대일고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">대진고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">대진여자고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">도봉고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">면목고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">목동고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">무학여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">미림여자고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">미양고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">방산고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">배문고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">삼성고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">상일여자고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">서울여자고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">선일여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">성동고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">세현고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">신광여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">신림고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">신목고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">여의도고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">열일고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">오금고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">원묵고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">은광여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">인헌고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">자양고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">정의여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">중경고등학교<br><hr>
	<input type="checkbox" name="high school1"  onclick="calc(this)">청담고등학교<br><hr>
	<input type="checkbox" name="high school2"  onclick="calc(this)">청원여자고등학교<br><hr>
	<input type="checkbox" name="high school3"  onclick="calc(this)">환일고등학교<br><hr></h3>
</body>
</html>