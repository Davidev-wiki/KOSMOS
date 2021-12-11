<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>코스모스 고등학교</title>

    <!-- 	css랑 js 파일 경로
            WebContent/resource/css/default.css
            WebContent/resource/css/gnb3.css
            요거 두개 보시면 됩니다.
            
            default 는 본문 글자 셋팅 (맨 아랫줄 body부분)
            gnb 는 메뉴 css 및 빨간 테두리 부분 (content로 검색) 들어가 있어요. 
    -->
    <link rel="stylesheet" href="resource/css/default.css">
    <link rel="stylesheet" href="resource/css/gnb3.css">
    <script src="resource/js/jquery.js" charset="utf-8"></script>
    <script src="resource/js/gnb3.js" charset="utf-8"></script>

	<script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/examples-base.js"></script>
	<script type="text/javascript" src="http://localhost:8088/kOSMOS/naverMap/docs/js/highlight.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tsir1dm8e&amp;submodules=panorama"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:8088/kOSMOS/naverMap/docs/css/examples-base.css" />
	


    <!-- 
        script 정리해보려고 했는데 공모전 ucc 링크가 풀려서 일단 다 합쳐뒀어요 
    -->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script>
        var Seourl = 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=58ae7970b66bd66c1602a8cd4c2ca3f4&units=metric';

        $.getJSON(Seourl, function (result) {
            // result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
            $('.setemp').append(result.main.temp + ' º');
            //$('.lowtemp').append(result.main.temp_min);
            //$('.hightemp').append(result.main.temp_max);

            /*아이콘					
            $('.icon').append(result.weather[0].icon);					
            ->					
            var wiconUrl = '<img src="http://openweathermap.org/img/wn/10d@2x.png" alt="">'// 이렇게하면 고정적인 img 가 나오기때문에 					
            ->
            '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon +'.png" alt="'+ result.weather[0].description +'">'
            로 수정					
            -
            */
            //(result.weather[0].icon
            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
            $('.seicon').html(wiconUrl);
        });
        $.getJSON(Gyourl, function (result) {
            // result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
            $('.gytemp').append(result.main.temp + ' º');

            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
            $('.gyicon').html(wiconUrl);
        });

        $.getJSON(Gyourl, function (result) {
// result 변수는 getJSON 안에서 선언되었기때문에 안에서 사용되어야 한다.
            $('.butemp').append(result.main.temp + ' º');

            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">'
            $('.buicon').html(wiconUrl);
        });
    </script>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }

/*
 * 		
 *		요기만 추가 : 팝업용
 */
        $(document).ready(function () {

            $("#img_ucc").click(function () {

                window.open("notice.jsp", "", "width=800, height=800, resizable=no, scrollbars=no, status=no");

            });

        });

    </script>

    <!-- 
        css파일 공유하는 다른페이지들이랑 겹치거나 
        다른이유로 적용 안되는 애들 문서에 적용시켜서 우선순위로 넣었어요.
    -->

    <style type="text/css">

        #footer {
            border-top: double;
            width: 100%;
            height: 70px;
            float: bottom;
        }

        .image {
            position: relative;
            background: url(img/kosmos_1.jpg);
            no-repeat;
            height: 280px;
            background-position: center;
        }

        .text {
            padding-top: 20px;
            margin-left: 20px;
            width: 200px;
        }

        img {
            max-width: 100%;
            height: auto;
            border: 1px solid gray;
        }

    </style>

</head>

<!-- 본문 -->
<body>

<!-- 상단 이미지 위에 글씨 오버랩 되는 부분 -->
<div class="image">

    <!-- <img src="/KOSMOS/img/kosmos_1.jpg" width="100%"> -->
    <div class="text">
        <a href=""><h1>KOSMOS 고등학교</h1></a>
    </div>
    <div class="right_box"><a href style="margin-right: 10px;">로그인</a><a href="">수강신청</a></div>
</div>

<!-- 메뉴포함 제일 외곽에 있는 틀 시작-->
<div class="container">

    <header>
        <nav>
        	<!-- 메뉴 css 클래스명 gnb -->
            <ul class="gnb">
            
                <li>
<!-- 학교소개 링크 -->
                    <a href="#">학교 소개</a>
                    <ul>
                        <li><a href="kosmos_words.jsp">학교장 인사</a></li>
                        <li><a href="kosmos_history.jsp">학교 연혁</a></li>
                        <li><a href="kosmos_info.jsp">학교 소개</a></li>
                        <li><a href="kosmos_symbol.jsp">학교 상징</a></li>
                        <li><a href="kosmos_map.jsp">학교 위치</a></li>
                    </ul>
                </li>
                
<!-- 수업정보 링크 -->
                <li>
                    <a href="#">수업정보</a>
                    <ul>
                        <li><a href="subjectSelectAll.k">과목정보</a></li>
                        <li><a href="mainTimeTable.k">시간표</a></li>
                    </ul>
                </li>

<!-- 공지사항 링크 -->
                <li>
                    <a href="#">공지사항</a>
                </li>


                <li>
                    <a href="#">코스모스숲</a>
                </li>

<!-- 마이페이지 링크 -->
                <li>
                    <a href="#">마이페이지</a>
                </li>
            </ul>
        </nav>

    </header>

    <!-- 
        (빨간선) 
        빨간선은 마지막에 웹컨텐트 > 리소스 > css > gnb3.css 에서  
        content 찾아서 border 지워주시면 됩니다.	
    -->
    <div class="content">

        <!-- 왼쪽부분  width 15프로  -->
        <!-- 보더값 적용 소스 : <div id="s_left" style="width:15%;border:1px solid black;float:left;height:100%;"> -->
        <div style="width:15%; float:left;height:100%;">

            <!-- 왼쪽 상단 : 공모전 -->
            <div><img src="img/img8.png" id="img_ucc" name="img_ucc"
                      style="border:1px soild gray; width:100%; height: 50%">
            </div>

            <div>
                <!-- 왼쪽 하단 : 공모전 이미지 아래 빈칸부분 만약 넣고 싶은거 있으면 요기다가-->
            </div>
        </div>

        <!-- 가운데부분 width: 69프로 -->
        <!-- 보더값 적용 소스 : <div id="s_center" style="width: 69%; border:1px solid black;float:left;margin-left:5px;margin-right:5px;height:100%;">본문  -->
        <div style="width: 69%; float:left; margin-left:5px;margin-right:5px;height:100%">

            <!-- 본문 요기다가 넣어주세요 빨간테두리에서 가운데 부분 입니다. -->
			<h1><a href="">코스모스고등학교 위치<span class="hide"></span></a></h1>
				<!-- @category Map -->
					<div>
						<br><br><br>
					    <div id="map" style="width:100%;height:600px;"></div>
					</div>
					<script id="code">
					var map = new naver.maps.Map('map', {
					    center: new naver.maps.LatLng(14123607.1614161,4506046.4030327),
					    zoom: 10,
					    mapTypeId: naver.maps.MapTypeId.NORMAL
					});
					
					var infowindow = new naver.maps.InfoWindow();
					
					function onSuccessGeolocation(position) {
					    var location = new naver.maps.LatLng(position.coords.latitude,
					                                         position.coords.longitude);
					
					    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
					    map.setZoom(17); // 지도의 줌 레벨을 변경합니다.
					
					    infowindow.setContent('<div style="padding:20px;">' + '코스모고등학교' + '</div>');
					
					    infowindow.open(map, location);
					    console.log('Coordinates: ' + location.toString());
					}
					
					function onErrorGeolocation() {
					    var center = map.getCenter();
					
					    infowindow.setContent('<div style="padding:20px;">' +
					        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
					
					    infowindow.open(map, center);
					}
					
					$(window).on("load", function() {
					    if (navigator.geolocation) {
					        /**
					         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
					         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
					         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
					         */
					    	navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
					    } else {
					        var center = map.getCenter();
					        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
					        infowindow.open(map, center);
					    }
					});
					</script>
            <!-- 본문 끝 -->

        </div>

        <!-- 오른쪽부분 width: 15프로 -->
        <!-- 보더값 적용 소스 : <div id="s_right" style="width:15%; float:right;height:100%;"본문  -->
        <div style="width:15%; float:right;height:100%">

            <!-- 오른쪽에서 상단 부분 : 날씨 -->
            <div style="height: 30%; margin-top: 50px">
                <h1>오늘의 날씨</h1>
                <p>
                <p>
                    <!-- 원래 주석처리 되어있던 것 (안지움) <div class = "mainb3">Seoul<br>Current Weather</div>-->
                <div class="mainb3">서울</div>
                <div class="seicon" style="text-align:center"></div>
                <div class="setemp"> 현재 온도 :</div>
            </div>

            <!-- 오른쪽에서 하단부분 : 식단 -->
            <div style="float:top; height: 40%">

                <h1>오늘의 메뉴</h1>
                	흰쌀밥,된장국,김치,꼬마돈까스,제육볶음
                <div class="slide">
                    <ul>
                        <li><img src="img/_rice.jpg"></li>
                        <li><img src="img/_kim.jpg"></li>
                        <li><img src="img/_miso.jpg"></li>
                        <li><img src="img/_pork.jpg"></li>
                        <li><img src="img/_don.jpg"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer 부분  -->
<div id="footer" align="center">
    <div class="container">
        서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
        교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
        opyright (c) 코스모스고등학교 All Rights Reserved
    </div>
</div>

</body>
</html>