<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.school.vo.KosmosSchoolVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>time table</title>
  <link rel="stylesheet" href="default.css">
  <link rel="stylesheet" href="gnb3.css">
  <script src="js/jquery.js" charset="utf-8"></script>
  <script src="js/gnb3.js" charset="utf-8"></script>
</head>
<style type="text/css">

	.content-top{
		height: 60px;
	}
	
	#s_left{
		border: 1px solid black;
		width:20%;
		height:700px;
		float:left;
	}
	
	#s_right{
		border: 1px solid black;
		width:20%;
		height:700px;
		float:left;
	}
	
	#contents{
		border: 1px solid black;
		width: 59.5%;
		float:left;
		height:700px;
	}
	
	#footer{
		border-top:double;
		width:100%;
		height:70px;
		float:bottom;
	}
	
	table {
	  border-collapse: collapse;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-bottom: 2px solid #036;
	  margin : 0px;
	  width:550px;
	  font-weight:bold;
	  font-family:Monospace;
	  box-shadow:4px 4px 10px gray;
	}
	
	table th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #153d73;
	  border-right: 1px solid #ccc;
	  border-bottom: 3px solid #036;
	  background-color:#D2E1FF;
	}
	
	table td {
	  width: 200px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  font-size:13px;
	}
	
	.time{
		 background-color:#EBF5FF;
		 font-size: 17px;
	}
	
	.hd{
		font-size:50px;
		text-shadow:4px 4px 6px gray; 
		font-family:Monospace;
		color:#5A78AF;
		margin-top:40px;
	}
	
	.day{
		font-size: 17px;
	}
</style>
<body>
<div style="width:1400px; margin:0 auto;"></div>
<header>
  <h1><a href="">코스모스고등학교<span class="hide"></span></a></h1>
  <nav>
    <ul class="gnb">
      <li>
        <a href="kosmos_main_page.html">Home</a>
      </li>
      <li>
          <a href="#">Login</a>
      </li>
      <li>
        <a href="#">학교 소개</a>
        <ul>
          <li><a href="kosmos_words.html">학교장 인사</a></li>
          <li><a href="kosmos_history.html">학교 연혁</a></li>
          <li><a href="kosmos_info.html">학교 소개</a></li>
          <li><a href="kosmos_symbol.html">학교 상징</a></li>
          <li> <a href="kosmos_map.html">학교 위치</a></li>
        </ul>
      </li>
      <li>
        <a href="#">수강신청</a>
      </li>
      <li>
        <a href="#">수업정보</a>
        <ul>
          <li><a href="#">과목정보</a></li>
          <li><a href="mainTimeTable.k">시간표</a></li>
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
<div class="bg_gnb"></div>
<div class="content-top">제일 위</div>
<div class="content" align="center">
	<div id="s_left">사이드바 왼쪽</div>
	<div id="contents">
	<% request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("aList1");
		List<KosmosSchoolVO> list = (List<KosmosSchoolVO>)obj;
		
		Object obj2 = request.getAttribute("aList2");
		List<KosmosSchoolVO> list2 = (List<KosmosSchoolVO>)obj2;
		
		Object obj3 = request.getAttribute("aList3");
		List<KosmosSchoolVO> list3 = (List<KosmosSchoolVO>)obj3;
		
		Object obj4 = request.getAttribute("aList4");
		List<KosmosSchoolVO> list4 = (List<KosmosSchoolVO>)obj4;
		
		Object obj5 = request.getAttribute("aList5");
		List<KosmosSchoolVO> list5 = (List<KosmosSchoolVO>)obj5;
		
		Object obj6 = request.getAttribute("aList6");
		List<KosmosSchoolVO> list6 = (List<KosmosSchoolVO>)obj6;
		
		Object obj7 = request.getAttribute("aList7");
		List<KosmosSchoolVO> list7 = (List<KosmosSchoolVO>)obj7;
			
		KosmosSchoolVO svo = new KosmosSchoolVO();
		
		// 1교시
		svo = list.get(0);
		String sb_name = svo.getSb_name();
		String sb_name1 = svo.getSb_name1();
		String sb_name2 = svo.getSb_name2();
		String sb_name3 = svo.getSb_name3();
		String sb_name4 = svo.getSb_name4();
		
		// 2교시
		svo = list2.get(0);
		String sb_name5 = svo.getSb_name5();
		String sb_name6 = svo.getSb_name6();
		String sb_name7 = svo.getSb_name7();
		String sb_name8 = svo.getSb_name8();
		String sb_name9 = svo.getSb_name9();
		
		// 3교시
		svo = list3.get(0);
		String sb_name10 = svo.getSb_name10();
		String sb_name11 = svo.getSb_name11();
		String sb_name12 = svo.getSb_name12();
		String sb_name13 = svo.getSb_name13();
		String sb_name14 = svo.getSb_name14();
		
		// 4교시
		svo = list4.get(0);
		String sb_name15 = svo.getSb_name15();
		String sb_name16 = svo.getSb_name16();
		String sb_name17 = svo.getSb_name17();
		String sb_name18 = svo.getSb_name18();
		String sb_name19 = svo.getSb_name19();
		
		// 5교시
		svo = list5.get(0);
		String sb_name20 = svo.getSb_name20();
		String sb_name21 = svo.getSb_name21();
		String sb_name22 = svo.getSb_name22();
		String sb_name23 = svo.getSb_name23();
		String sb_name24 = svo.getSb_name24();
		
		// 6교시
		svo = list6.get(0);
		String sb_name25 = svo.getSb_name25();
		String sb_name26 = svo.getSb_name26();
		String sb_name27 = svo.getSb_name27();
		String sb_name28 = svo.getSb_name28();
		String sb_name29 = svo.getSb_name29();
		
		// 6교시
		svo = list7.get(0);
		String sb_name30 = svo.getSb_name30();
		String sb_name31 = svo.getSb_name31();
		String sb_name32 = svo.getSb_name32();
		String sb_name33 = svo.getSb_name33();
		String sb_name34 = svo.getSb_name34();
	%>
	<br>
	<div class="hd" align="center">시 &nbsp;간 &nbsp;표</div><br>
	<div align="center">
	<table>
		<tr>
			<th></th>
			<th class="day">월</th>
			<th class="day">화</th>
			<th class="day">수</th>
			<th class="day">목</th>
			<th class="day">금</th>
		</tr>
		<tr>
			<td class="time">1</td>
			<td><%= sb_name %></td>
			<td><%= sb_name1 %></td>
			<td><%= sb_name2 %></td>
			<td><%= sb_name3 %></td>
			<td><%= sb_name4 %></td>
		</tr>
		<tr>
			<td class="time">2</td>
			<td><%= sb_name5 %></td>
			<td><%= sb_name6 %></td>
			<td><%= sb_name7 %></td>
			<td><%= sb_name8 %></td>
			<td><%= sb_name9 %></td>
		</tr>
		<tr>
			<td class="time">3</td>
			<td><%= sb_name10 %></td>
			<td><%= sb_name11 %></td>
			<td><%= sb_name12 %></td>
			<td><%= sb_name13 %></td>
			<td><%= sb_name14 %></td>
		</tr>
		<tr>
			<td class="time">4</td>
			<td><%= sb_name15 %></td>
			<td><%= sb_name16 %></td>
			<td><%= sb_name17 %></td>
			<td><%= sb_name18 %></td>
			<td><%= sb_name19 %></td>
		</tr>
		<tr>
			<td class="time">5</td>
			<td><%= sb_name20 %></td>
			<td><%= sb_name21 %></td>
			<td><%= sb_name22 %></td>
			<td><%= sb_name23 %></td>
			<td><%= sb_name24 %></td>
		</tr>
		<tr>
			<td class="time">6</td>
			<td><%= sb_name25 %></td>
			<td><%= sb_name26 %></td>
			<td><%= sb_name27 %></td>
			<td><%= sb_name28 %></td>
			<td><%= sb_name29 %></td>
		</tr>
		<tr>
			<td class="time">7</td>
			<td><%= sb_name30 %></td>
			<td><%= sb_name31 %></td>
			<td><%= sb_name32 %></td>
			<td><%= sb_name33 %></td>
			<td><%= sb_name34 %></td>
		</tr>
	</table>
	</div>
	</div>
	<div id="s_right">사이드바 오른쪽</div>
<div id="footer" align="center">
	<div class="container">
		서울 금천구 가산동 8명로 88 코스모스고등학교 <br/>
		교무실 02-123-4567(09:00~17:00) 행정실 02-7654-3210(09:00~24:00)<br/>
		Copyright (c) 코스모스고등학교 All Rights Reseved
	</div>
</div>
</div>
</body>
</html>