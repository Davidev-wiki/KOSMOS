<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>메인 페이지</title>
  <link rel="stylesheet" href="resource/css/default.css">
  <link rel="stylesheet" href="resource/css/gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
  <style type="text/css">
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	.image{
      position: relative;
      background:url(img/kosmos_1.jpg);no-repeat;height:250px; background-position: center;
	}
	.text{
		padding-top:20px; margin-left:20px;
	}
</style>
</head>

<body>
<div class="image">
    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
    <div class="text">
        <a href=""><h1>KOSMOS 고등학교</h1></a>
    </div>
</div>
<div class="container">
<header>
  <nav>
    <ul class="gnb">
      <li>
        <a href="kosmos_main_page.jsp">Home</a>
      </li>
      <li>
          <a href="#">Login</a>
      </li>
      <li>
        <a href="#">학교 소개</a>
        <ul>
          <li><a href="kosmos_words.jsp">학교장 인사</a></li>
          <li><a href="kosmos_history.jsp">학교 연혁</a></li>
          <li><a href="kosmos_info.jsp">학교 소개</a></li>
          <li><a href="kosmos_symbol.jsp">학교 상징</a></li>
          <li> <a href="kosmos_map.jsp">학교 위치</a></li>
        </ul>
      </li>
      <li>
        <a href="#">수강신청</a>
      </li>
      <li>
        <a href="#">수업정보</a>
        <ul>
          <li><a href="subjectSelectAll.k">과목정보</a></li>
          <li><a href="#">시간표</a></li>
        </ul>
      </li>
      <li>
        <a href="#">공지사항</a>
      </li>
      <li>
      	<a href="#">코스모스숲</a>
      </li>
      <li>
      	<a href="#">마이페이지</a>
      </li>
    </ul>
  </nav>

</header>

<div class="content">

<!-- 요기에 넣으면 됩니다 크기 1000px인데 작으면 말해줘요  -->

<div class="info"> 

<section>

		<div class="type03"> 
			<ul>
				<br><br>
				<li><span><img src="img/KakaoTalk_20211128_143447619.jpg" alt="학교장 사진"></span><br>
				<strong>코스모스고등학교장 </strong><em>ㅇㅇㅇ</em></li><br> 
				<li style="text-align:left"><p>우리 학교는 1993년 개교하여 30여 년 동안 5천여 인재를 배출한 공립 명문 일반계고등학교로 ‘바른 인성과 실력으로 자신의 삶을 만들어가는 자주적인 사람’, 
				‘다양한 발상으로 새로움에 도전하는 창의적인 사람’, 
				‘문화를 이해하고 누릴 수 있는 교양 있는 사람’, 
				‘타인을 생각하고 배려하는 더불어 사는 사람’을 양성하기 위해 최선을 다하고 있습니다.</p>
				<p>특히 ‘휴대폰’, ‘흡연’, ‘학교 폭력’이 없는 '3무(三無) 학교'로 안정적이고 즐거운 학습 분위기 조성을 위해 최선을 다하고 있으며, 
				‘나의 꿈 갖기, 먼저 인사하기, 고운 말 쓰기, 서로 칭찬하기’의 ‘4실천 운동’을 생활화하고 있습니다.</p>
				<p>학생은 다양한 교육·체험 활동을 통하여 자아를 형성하고 교사는 솔선수범하고 학생지도에 애정을 쏟으며, 
				학교장은 투명하고 민주적인 학교를 만들기 위해 노력함으로써 가고 싶은 학교, 
				근무하고 싶은 학교, 
				보내고 싶은 학교를 만들어 나가는 데 노력을 기울이겠습니다.</p>
				<p>학생들이 즐겁고 깨끗한 공간에서 꿈을 키워나갈 수 있도록 구성원 모두가 힘쓸 것을 다짐합니다.</p> 
				<p>29년 동안 이어진 코스모스고등학교의 전통과 명성이 향후 50년 이상 미래에도 계속될 수 있도록 코스모스고를 사랑하시는 모든 분들께서 더욱 깊은 애정을 갖고 응원해 주시기 바랍니다.</p>
				<p>우리 학교 홈페이지에 자주 방문하시어 좋은 의견 나누어 주시면 감사하겠습니다.</p></li> 
			</ul> 
		</div>

</section>

<!-- 요기까지 -->

</div>

</div>
</body>
</html>





<!-- 
<div class="bg_gnb"></div>
<div class="content-top">제일 위</div>
<div class="content" align="center">
	<div id="s_left">사이드바 왼쪽</div>
	<div id="contents">본문</div>
	<div id="s_right">사이드바 오른쪽</div>
<div id="footer" align="center">
	<div class="container">
		서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
		교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
		Copyright (c) 코스모스고등학교 All Rights Reseved
	</div>
	 -->