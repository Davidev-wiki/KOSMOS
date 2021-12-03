<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교학점제 수강신청 프로그램</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<div class="wrap">	
	<head>
		<div class="col-md-11">
				<!--border:20px solid orange;-->
			<h1 class="logo">
				<a>
					<div class="topimg"></div>
				</a>
			</h1>
		</div>
	</head>
	<div class="container"">
		<div class="row">
			<h2 class="sub_name">고교학점제란</h2>
			<div class="box_video">
				<!-- ?autoplay=1: 자동재생 ,&mute=1: 음소거 -->
				<iframe  class="video_inner" width="820" height="500" right="350" left="10" src="https://www.youtube.com/embed/_ikRwjH4ZOU?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
				</iframe>
			</div>
		</div>
		<div class="row2">
			<div class="col-md-7">
				<img alt="미래를 여는 선택 고교학점제" src="img/img3.png">
			</div>
			<div class="select_wrap">
				<p>* 지역을 선택하신 후, 학교명을 클릭하시면 학교별 수강신청 사이트로 넘어갈수 있습니다.</p>
				<div class="col-md-2">
					<p class="title">"연구학교"<span class="num" id="rschCnt">(10)</span></p>
					<select name='선도학교' size='7'>
						<option value='high school1'>코스모스고등학교</option>
						<option value='high school2'>당곡등학교</option>
						<option value='high school3'>동북고등학교</option>
						<option value='high school4'>문현고등학교</option>
						<option value='high school5'>배명고등학교</option>
						<option value='high school6'>불암고등학교</option>
						<option value='high school7'>압구정고등학교</option>
						<option value='high school8'>잠일고등학교</option>
						<option value='high school9'>정원고등학교</option>
						<option value='high school10'>한서고등학교</option>
					</select>
				</div>
				<div class="col-md-3">
					<p class="title">"선도학교"<span class="num" id="rschCnt">(25)</span></p>
					<select name='선도학교' size='7'>
						<option value='high school11'>강서등학교</option>
						<option value='high school12'>경기고등학교</option>
						<option value='high school13'>경신고등학교</option>
						<option value='high school14'>경희여자고등학교</option>
						<option value='high school15'>관악고등학교</option>
						<option value='high school16'>광남고등학교</option>
						<option value='high school17'>광문고등학교</option>
						<option value='high school18'>구현고등학교</option>
						<option value='high school19'>노원고등학교</option>
						<option value='high school20'>누원고등학교</option>
						<option value='high school21'>대영고등학교</option>
						<option value='high school22'>대일고등학교</option>
						<option value='high school23'>대진고등학교</option>
						<option value='high school24'>대진여자고등학교</option>
						<option value='high school25'>도봉고등학교</option>
						<option value='high school26'>면목고등학교</option>
						<option value='high school27'>목동고등학교</option>
						<option value='high school28'>무학여자고등학교</option>
						<option value='high school29'>미림여자고등학교</option>
						<option value='high school30'>미양고등학교</option>
						<option value='high school31'>방산고등학교</option>
						<option value='high school32'>배문고등학교</option>
						<option value='high school33'>삼성고등학교</option>
						<option value='high school34'>상일여자고등학교</option>
						<option value='high school35'>서울여자고등학교</option>
					</select>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>