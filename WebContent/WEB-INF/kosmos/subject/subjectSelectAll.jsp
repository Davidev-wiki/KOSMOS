<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체목록 + 개설강좌검색</title>
	<style type="text/css">
	
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			// 개설학기
			$("#sb_semester").append("<option value=''> -- 학기 선택 -- </option>");
			for (var i=1; i <= 2; i++){
				$("#sb_semester").append("<option value='"+i+"'>"+ i +"학기</option>");
			}
			$("#sb_semester").append("<option value='3'> 전학기 </option>");
			
			$(document).on("click", "#searchBtn", function(){
				
				// (임시) 수강신청 페이지랑도 이어짐. 페이지 분리는 다시 생각하기
				// 전체목록에서 조건 붙여서 조회하기
				$("#selectSbForm").attr({
					'action':'subjectSelectAll.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectBtn", function(){
				$("#subjectSelectAll").attr({
					'action':'subjectSelect.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#updateBtn", function(){
				$("#subjectSelectAll").attr({
					'action':'subjectUpdateForm.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#insertBtn", function(){
				// 어디로 보내지? subjectInsert.jsp 또는 subjectForm.jsp
				// subjectForm.jsp 가 필요한가..?
				location.href="subject.k";
			});
			
			$(document).on("click", "#deleteBtn", function(){
				$("subjectSelectAll").attr({
					'action':'subjectDelete.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
		});
	</script>
</head>
<body>
	<% 	request.setCharacterEncoding("UTF-8"); %>
	<%
		Object obj = request.getAttribute("listSA");
		if (obj == null){
			return;
		}
	%>
	<table>
	<tr>
		<td colspan="2">
			<a href="sgRegistration.k">수강희망과목</a> ||
			<a href="subjectSelectAll.k">개설강좌검색</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			현재 신청한 이수학점 : 
			
		</td>
	</tr>
	</table>
	<hr>
	<hr>
	개설 강좌 목록
	<form name="selectSbForm" id="selectSbForm">
		<table border="1" align="center" style="float:left;">
			<thead>			
				<th>개설년도
					<select id="sb_year" name="sb_year">
						<option value=""></option>
						<option value=""></option>
					</select>
				</th> 
				<th>개설학기
					<select id="sb_semester" name="sb_semester"></select>
				</th>	<!-- 드롭박스 -->
				<th>과목명<br>
					<input type="text" id="sb_name" name="sb_name" placeholder="직접입력">	
				</th>	<!-- 텍스트 -->
				<th>담당교사명<br>
					<input type="text" id="sb_teacher" name="sb_teacher" placeholder="직접입력">	
				</th>	<!-- 텍스트 -->
				<th>대상학년<br>
					<input type="text" id="sb_grade" name="sb_grade" placeholder="직접입력">	
				</th>		<!-- 드롭박스 -->
				<th>수업요일<br>
					<input type="text" id="sb_day" name="sb_day" placeholder="직접입력">	
				</th>		<!-- 드롭박스 -->
				<th>수업교시<br>
					<input type="text" id="sb_time" name="sb_time" placeholder="직접입력">	
				</th>		<!-- 드롭박스 -->
				<th>
					<input type="text" id="keyword" name="keyword" >
					<input type="button" id="searchBtn" value="조회"></th>
			</thead>
		</table>
	</form>
	<hr>
	<form id="subjectSelectAll" name="subjectSelectAll">
		<table border="1">
			<thead>
				<tr>
					<th><input type="checkbox" id="chkTop" name="chkTop"></th>
					<!-- 일단 순서대로 정렬 + 데이터 받아보기 -->
					<th>교과군</th>	<!-- 국어, 영어, 수학, 사회, 과학 -->
					<th>과목코드</th>
					<th>과목유형</th>	<!-- 필수/선택 -->
					<th>과목명</th>
					<th>이수단위</th>	<!-- 1, 2, 3 -->
					<th>대상학년</th>	<!-- 1, 2, 3 학년 -->
					<th>개설년도</th> <!-- 나중에 head로 뺄 예정 -->
					<th>개설학기</th>
					<th>담당교사명</th>
					<th>정원</th>
					<th>수업요일</th>	<!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
					<th>수업교시</th> <!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
					<th>선수과목유무</th>	<!-- 나중에 head로 빼거나 아예 삭제 고려 -->
					<th>선수과목명</th>	<!-- 뺄까...? 넣을까...? -->
					<th>수정일</th> <!-- 나중에 삭제 예정. 데이터 넘어오는지 확인용 -->
				</tr>
			</thead>
		<%		
		ArrayList<KosmosSubjectVO> listSA = (ArrayList<KosmosSubjectVO>)obj;
		
	//	if (listSA != null && listSA.size() > 0){
			for (int i=0; i < listSA.size(); i++){
				KosmosSubjectVO svo = listSA.get(i);
		%>
				<tbody>
					<tr>
						<th><input type="checkbox" id="sb_num" name="sb_num" value=<%= svo.getSb_num() %>></th>
						<td><%= svo.getSb_group() %></td>	<!-- 국어, 영어, 수학, 사회, 과학 -->
						<td><%= svo.getSb_code() %></td>
						<td><%= svo.getSb_type() %></td>	<!-- 필수/선택 -->
						<td><%= svo.getSb_name() %></td>
						<td><%= svo.getSb_creditunit() %></td>	<!-- 1, 2, 3 -->
						<td><%= svo.getSb_grade() %> 학년</td>	<!-- 1, 2, 3 학년 -->
						<td><%= svo.getSb_year() %> 년도</td> <!-- 나중에 head로 뺄 예정 -->
						<td><%= svo.getSb_semester() %></td>
						<td><%= svo.getSb_teacher() %></td>
						<td><%= svo.getSb_maxstu() %></td>
						<td><%= svo.getSb_day() %></td>	<!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
						<td><%= svo.getSb_time() %></td> <!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
						<td><%= svo.getSb_beforeyn() %></td>	<!-- 나중에 head로 빼거나 아예 삭제 고려 -->
						<td><%= svo.getSb_beforename() %></td>
						<td><%= svo.getSb_upddate() %></td> <!-- 나중에 삭제 예정. 데이터 넘어오는지 확인용 -->
					</tr>
				</tbody>	
		<%
			}	// end of for
	//	}
		%>
			<tr>
				<td colspan="20" align="center">
					<!-- 조회 버튼은 마우스오버/과목명 클릭하면 볼 수 있게하면 더 좋음. 하지만 나중에 생각하기 -->
					<input type="button" id="insertBtn" value="새등록">
					<input type="button" id="updateBtn" value="수정">
					<input type="button" id="deleteBtn" value="삭제">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>