<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.common.AuthenticationKey" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		tr, td {
			text-align: center;
		}
		
		div {
			display:inline-block;
		}
	</style>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			// 오늘 날짜 바인딩 
			document.getElementById('sb_insdate').value = new Date().toISOString().substring(0, 10);
			
			// <select> <option> 가능하면 CommonUtils에서 배열 > for문 이용하기 (강사님 코드 공부하기)
			// 대상학년 (1, 2, 3)
			$("#sb_grade").append("<option value=''> -- 학년 선택 -- </option>");
			for (var i = 1; i <= 3; i++){
				$("#sb_grade").append("<option value='"+ i +"'>"+ i +"</option> ");
			}
			
			// 이수단위
			$("#sb_creditunit").append("<option value=''></option>");
			
			// 개설학기
			$("#sb_semester").append("<option value=''> -- 학기 선택 -- </option>");
			for (var i=1; i <= 2; i++){
				$("#sb_semester").append("<option value='"+i+"'>"+ i +"학기</option>");
			}
			$("#sb_semester").append("<option value='3'> 전학기 </option>");
						
			// 수업교시 (1 ~ 8교시)
			for (var i=1; i <= 8; i++){
				$("#sb_time").append("<option value='"+i+"'>"+i+"교시</option>");
			}
			
			// 관리자 키 확인
			$("#keyCheck").click(function(){
				alert("관리자 키 확인합니다.");
				var key = $("#teacher_key").val();
				var key_auth = $("#auth_teacher_key").val();
				
				alert("key >>> : " + key);
				alert("key_auth >>> : " + key_auth);
				
				if (key == key_auth){
					alert("관리자 키와 일치합니다. 과목정보를 수정하실 수 있습니다.");
					key = '';
					
					$("#teacher_key").attr("disabled", true);
					$("#insertBtn").attr("disabled", false);
					$("#teacher_key").css("background-color", "lightgray");
				}else{
					alert("관리자 키와 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
					$("#teacher_key").val('');
					$("#teacher_key").focus();
				}
			});

			
			// 등록 버튼 누르면
			$(document).on("click", "#insertBtn", function(){
				alert("(확인용) insertBtn >>> : ");
				
				// 관리자 아이디와 비밀번호 입력하는 1. 페이지로 이동
				// 2. 팝업창 구현
				
				// 임시로 Controller 다녀오게 함. 
				// 비동기 + jsp 이동 가능하게 노력해보기 + 로그인한 아이디가 T로 시작하는 아이디인지 확인 필요.
				$("#subjectInsertForm").attr({
					'action':'subjectInsert.k',
					'method':'GET',
					'enctype':'application/x-www-urlencoded'
				}).submit();
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				location.href="subjectSelectAll.k";
			});
		});
	</script>
</head>
<body>
	<hr>
	<form id="subjectInsertForm" name="subjectInsertForm">
		<table border="1">
			<thead>
				<tr>
					<th colspan="10">과목 입력</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>교과군</td>
					<td>
						<select id="sb_group" name="sb_group">
							<option value=1>국어
							<option value=2>수학
							<option value=3>영어
							<option value=4>사회
							<option value=5>과학
						</select>
					</td>
				</tr>
				<tr>
					<td>과목코드</td>
					<!-- 넣을지 말지 수정 요함 -->
					<td><input type="text" id="sb_code" name="sb_code" readonly></td>
				</tr>
				<tr>
					<td>과목유형</td>
					<td>
						<input type="radio" id="sb_type" name="sb_type" value="01">필수
						<input type="radio" id="sb_type" name="sb_type" value="02">선택
					</td>
				</tr>
				<tr>
					<td>과목명</td>
					<td>
						<div>
							<!-- db에 있는 정보와 일치하면 검색 / db에 있는 정보와 일치하지 않으면 색 변하면서 (새로 입력) 메시지 보이게 -->
							<input type="text" id="sb_name" name="sb_name" placeholder="직접입력">
							<button type="button">검색</button>
						</div>
						<div>
							<input type="checkbox" id="beforeyn" name="beforeyn">선수과목</input>
						</div>
					</td>
				</tr>
				<tr>
					<td>이수단위</td>
					<td>
						<input type="number" min="1" max="3" step="1" value="1" id="sb_creditunit" name="sb_creditunit">
					</td>
				</tr>
				<tr>
					<td>대상학년</td>
					<td>
						<select id="sb_grade" name="sb_grade"></select>
					</td>
				</tr>
				<tr>
					<td>개설년도</td>
					<td>
						<input type="number" min="1900" max="2099" step="1" value="2021" id="sb_year" name="sb_year" pattern="[1900-2099]+">
						<!-- <input type="month" id="sb_month" name="sb_month" > -->
					</td>
					
				</tr>
				<tr>
					<td>개설학기</td>
					<td>
						<select id="sb_semester" name="sb_semester"></select>
					</td>
				</tr>
				<tr>
					<td>담당교사</td>
					<td>
						<div>
                            <input type="text" id="sb_teacher" name="sb_teacher">
                        </div>
                        <div>
                        	<button id="search_teacher" name="search_teacher">검색</button>
                        </div>
					</td>
				</tr>
				<tr>
					<td>정원</td>
					<td><input type="number" id="sb_maxstu" name="sb_maxstu" pattern="[25-30]" placeholder="정원 입력해주세요"></td>
				</tr>
				<tr>
					<td>수업요일</td>
					<td>
						<select id="sb_day" name="sb_day">
							<option>월</option>
							<option>화</option>
							<option>수</option>
							<option>목</option>
							<option>금</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>수업교시</td>
					<td>
						<select id="sb_time" name="sb_time"></select>
					</td>
				</tr>
				<tr>
					<td>선수과목명</td>
					<td>
						<div id="sb_beforename" name="sb_beforename">
							<select>
								<option>물리학1
								<option>수학1
								<option>생명과학1
								<option>영어1
								<option>일본어1
								<option>중국어1
								<option>한문1
								<option>화학1
							</select>
							<input type="text" placeholder="직접입력">
						</div>
					</td>					
				</tr>
				<tr>
					<td>등록일</td>
					<td>
						<!-- 오늘 날짜 바인딩 되게 수정 예정 > 바인딩 완료 -->
						<input type="date" id="sb_insdate" name="sb_insdate" readonly>
					</td>	
				</tr>
			</tbody>
			<tr>
				<td colspan="5">
					과목 수정을 위한 관리자님의 비밀번호를 입력해주세요.<br>
					<input type="password" id="teacher_key" name="teacher_key">
					<button type="button" id="keyCheck" name="keyCheck">확인</button>
					<input type="hidden" id="auth_teacher_key" name="auth_teacher_key" value=<%= AuthenticationKey.TEACHER_KEY %>>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="right">
					<input type="button" id="insertBtn" value="등록" disabled >
					<input type="button" id="selectAllBtn" value="전체목록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>