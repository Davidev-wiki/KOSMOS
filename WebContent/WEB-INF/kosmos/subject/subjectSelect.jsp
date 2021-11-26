<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 단일 조회</title>
	<style>
		.div1{
			width: 300px;
			height: 400px;
			margin: 100px auto;
		}
		
		.div2{
			align:center;
			margin: 10px 90px;
		}
		
		h3{
			margin: 0px 80px;
		}
		
		table {
			margin: 10px auto;
		}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click", "#updateBtn", function(){
				
				$("#subjectUpdate").attr({
					'action':'subjectUpdate.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				$("#subjectSelect").attr({
					'action':'subjectSelectAll.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
		});
	</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>	
	<%
		Object obj = request.getAttribute("listS");
		if (obj == null){
			System.out.println("subjectSelect.jsp : obj가 null");
			return;
		}
		List<KosmosSubjectVO> listS = (List<KosmosSubjectVO>)obj;
		KosmosSubjectVO svo = null;
		svo = new KosmosSubjectVO();
		svo = listS.get(0);
	%>
	<div class="div1">
		<form id="subjectSelect" name="subjectSelect">
			<table>
				<thead>
					<h3>과목정보</h3>
				</thead>
				<tbody>
					<tr>
						<td>교과군</td>
						<td><%= svo.getSb_group() %></td>	<!-- 번호 > 한글명으로 바꿔주기 -->
					</tr>
					<tr>
						<td>과목유형</td>
						<td><%= svo.getSb_type() %></td>
					</tr>
					<tr>
						<td>과목명</td>
						<td><%= svo.getSb_name() %></td>
					</tr>
					<tr>
						<td>이수단위</td>
						<td><%= svo.getSb_creditunit() %></td>
					</tr>
					<tr>
						<td>대상학년</td>
						<td><%= svo.getSb_grade() %>학년</td>
					</tr>
					<tr>
						<td>개설년도</td>
						<td><%= svo.getSb_year() %>년도</td>		<!-- 개설년도 + 개설학기 합치는 여부 고려 -->
					</tr>
					<tr>
						<td>개설학기</td>
						<td><%= svo.getSb_semester() %></td>	<!-- 개설년도 + 개설학기 합치는 여부 고려 -->
					</tr>
					<tr>
						<td>담당교사</td>
						<td><%= svo.getSb_teacher() %></td>
					</tr>
					<tr>
						<td>정원</td>
						<td><%= svo.getSb_maxstu() %> 명</td>
					</tr>
					<tr>
						<td>수업요일</td>
						<td><%= svo.getSb_day() %>요일</td>		<!-- 요일 + 교시 합치는 여부 고려 -->
					</tr>
					<tr>
						<td>수업교시</td>
						<td><%= svo.getSb_time() %>교시</td>		<!-- 요일 + 교시 합치는 여부 고려 -->
					</tr>
					<tr>
						<td>선수과목명</td>
						<td><%= svo.getSb_beforename() %></td>	<!-- 요거는 있을때만 출력되게 해야 하는데.. -->				
					</tr>
					<tr>
						<td>등록일</td>
						<td><%= svo.getSb_insdate() %></td>		<!-- 현재 2021-11-25 형태 -->
					</tr>	
				</tbody>
			</table>
			<div class="div2">
				<input type="button" id="updateBtn" value="수정">
				<input type="button" id="selectAllBtn" value="전체목록">
			</div>
		</form>
	</div>
</body>
</html>