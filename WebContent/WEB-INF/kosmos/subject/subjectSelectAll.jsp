<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.kosmos.subject.vo.KosmosSubjectVO" %>
<%@ page import="com.kosmos.common.CommonUtils" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체목록 + 개설강좌검색</title>
	<style type="text/css">
		.cursor{
			cursor: pointer;
		}
		
		table{
			display:inline-block;
		}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			// 학년 드롭박스
			<% String g = CommonUtils.grades();
				String[] gArray = g.split(",");
				for (int i=0; i < gArray.length; i++){
					String key_selectgrade = gArray[i];
			%>
					$("#key_sbgrade").append("<option value='"+"<%= key_selectgrade %>"+"'>"+ "<%= key_selectgrade %>학년" +"</option>");
			<%
				}
			%>
						
			// 요일 드롭박스
			<% String d = CommonUtils.days();
				String[] dArray = d.split(",");
				for (int i=0; i < dArray.length; i++){
					String key_selectday = dArray[i];
			%>
					$("#key_sbday").append("<option value='key_selectday'>"+ "<%= key_selectday %>요일" +"</option>");
			<%
				}
			%>
			
			// 교시 드롭박스
			<% String t = CommonUtils.times();
			String[] tArray = t.split(",");
			for (int i=0; i < tArray.length; i++){
				String key_selectday = tArray[i];
			%>
					$("#key_sbtime").append("<option value='key_selectday'>"+ "<%= key_selectday %>교시" +"</option>");
			<%
				}
			%>
			
			$(document).on("click", "#searchBtn", function(){

			//	console.log("keyword >>> : " + $('input[name=keyowrd]').val());
				
				// (임시) 수강신청 페이지랑도 이어짐. 페이지 분리는 다시 생각하기
				// 전체목록에서 조건 붙여서 조회하기
				$("#selectSbForm").attr({
					'action':'subjectSelectAll.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				});
			});
			
			// 과목명 클릭 후 단일 조회
			$(document).on("click", "#searchBtn", function(){
				$("#subjectSelectAll").attr({
					'action':'subjectSelectAll.k',
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
			System.out.println("obj가 null");
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
		<div style="color:blue">
			<p> [현재]<br>
			select 로 되어 있는 드롭박스 형태는 다 선택(입력,input)을 해줘야 합니다. text는 입력 안 해도 상관없습니다.<br>
			현재는 <span style="color:red">드롭박스 중 학년만 선택가능</span>합니다. 수업요일, 수업교시 미구현입니다.
			</p>
		</div>
	<form id="subjectSelectAll" name="subjectSelectAll">
		<table border="1" align="center" style="float:center;">
			<thead>	
				<tr>
					<th>과목명</th>	<!-- 텍스트 -->
					<td><input type="text" id="key_sbname" name="key_sbname" placeholder="직접입력" /></td>	
					<th>담당교사명</th>	<!-- 텍스트 -->
					<td><input type="text" id="key_sbteacher" name="key_sbteacher" placeholder="직접입력" /></td>
					<th>대상학년</th>		<!-- 드롭박스 -->
					<td><select id="key_sbgrade" name="key_sbgrade">학년</select>
					<input type="hidden" id="key_hidden" name="key_hidden" value=""/>
					</td>
					<td rowspan="5" align="center">
						<button type="button" id="searchBtn">검색</button>	
					</td>
				</tr>
				<tr>
					<th>수업요일</th>		<!-- 드롭박스 -->
					<td><select id="key_sbday" name="key_sbday"></select></td>
					<th>수업교시</th>		<!-- 드롭박스 -->
					<td><select id="key_sbtime" name="key_sbtime"></select></td>		
				</tr>
			</thead>
		</table>
	<hr>		
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
		
		if (listSA != null && listSA.size() >= 0){
			for (int i=0; i < listSA.size(); i++){
				KosmosSubjectVO svo = listSA.get(i);
				
			//	String sb_grade = CommonUtils.gradeDBToFront(svo.getSb_grade());
		%>
				<tbody>
					<tr>
						<th><input type="checkbox" id="sb_num" name="sb_num" value="<%= svo.getSb_num() %>"></th>
						<td><%= svo.getSb_group() %></td>	<!-- 국어, 영어, 수학, 사회, 과학 -->
						<td><%= svo.getSb_code() %></td>
						<td><%= svo.getSb_type() %></td>	<!-- 필수/선택 -->
						<td><input type="text" class="cursor" value="<%= svo.getSb_name()%>" readonly></td>
						<td><%= svo.getSb_creditunit() %></td>	<!-- 1, 2, 3 -->
						<td><%= svo.getSb_grade() %> 학년</td>	<!-- 1, 2, 3 학년 -->
						<td><%= svo.getSb_year() %> 년도</td> <!-- 나중에 head로 뺄 예정 -->
						<td><%= svo.getSb_semester() %>학기</td>
						<td><%= svo.getSb_teacher() %></td>
						<td><%= svo.getSb_maxstu() %> 명</td>
						<td><%= svo.getSb_day() %>요일</td>	<!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
						<td><%= svo.getSb_time() %>교시</td> <!-- 나중에 head로 뺄 예정, 수업요일+교시 합치는 거 고려 예정 -->
						<td><%= svo.getSb_beforeyn() %></td>	<!-- 나중에 head로 빼거나 아예 삭제 고려 -->
						<td><%= svo.getSb_beforename() %></td>
						<td><%= svo.getSb_upddate() %></td> <!-- 나중에 삭제 예정. 데이터 넘어오는지 확인용 -->
					</tr>
				</tbody>	
		<%
			}	// end of for
		}
		%>
			<tr>
				<td colspan="20" align="center">
					<!-- 조회 버튼은 마우스오버/과목명 클릭하면 볼 수 있게하면 더 좋음. 하지만 나중에 생각하기 -->
					<input type="button" id="selectBtn" value="조회">
					<input type="button" id="insertBtn" value="새등록">
					<input type="button" id="updateBtn" value="수정">
					<input type="button" id="deleteBtn" value="삭제">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>