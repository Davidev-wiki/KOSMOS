<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.school.vo.KosmosSchoolVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Table</title>
<style type="text/css">

	table {
	  border-collapse: collapse;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 3px solid #369;
	  margin : 0px;
	  width:600px;
	}
	table th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #153d73;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
	table td {
	  width: 200px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  font-size:13px;
	}
</style>
</head>
<body>
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
<h1 align="center">- 시 간 표 -</h1>
<div align="center">
<table>
	<tr style="width:250px;">
		<th></th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
	</tr>
	<tr>
		<td>1</td>
		<td><%= sb_name %></td>
		<td><%= sb_name1 %></td>
		<td><%= sb_name2 %></td>
		<td><%= sb_name3 %></td>
		<td><%= sb_name4 %></td>
	</tr>
	<tr>
		<td>2</td>
		<td><%= sb_name5 %></td>
		<td><%= sb_name6 %></td>
		<td><%= sb_name7 %></td>
		<td><%= sb_name8 %></td>
		<td><%= sb_name9 %></td>
	</tr>
	<tr>
		<td>3</td>
		<td><%= sb_name10 %></td>
		<td><%= sb_name11 %></td>
		<td><%= sb_name12 %></td>
		<td><%= sb_name13 %></td>
		<td><%= sb_name14 %></td>
	</tr>
	<tr>
		<td>4</td>
		<td><%= sb_name15 %></td>
		<td><%= sb_name16 %></td>
		<td><%= sb_name17 %></td>
		<td><%= sb_name18 %></td>
		<td><%= sb_name19 %></td>
	</tr>
	<tr>
		<td>5</td>
		<td><%= sb_name20 %></td>
		<td><%= sb_name21 %></td>
		<td><%= sb_name22 %></td>
		<td><%= sb_name23 %></td>
		<td><%= sb_name24 %></td>
	</tr>
	<tr>
		<td>6</td>
		<td><%= sb_name25 %></td>
		<td><%= sb_name26 %></td>
		<td><%= sb_name27 %></td>
		<td><%= sb_name28 %></td>
		<td><%= sb_name29 %></td>
	</tr>
	<tr>
		<td>7</td>
		<td><%= sb_name30 %></td>
		<td><%= sb_name31 %></td>
		<td><%= sb_name32 %></td>
		<td><%= sb_name33 %></td>
		<td><%= sb_name34 %></td>
	</tr>
</table>
</div>
</body>
</html>