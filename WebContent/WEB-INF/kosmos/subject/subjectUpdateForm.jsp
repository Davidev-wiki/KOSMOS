<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 수정 페이지</title>
	<style>
		div {
			display:inline-block;
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			// 대상학년 (1, 2, 3)
			$("#sb_grade").append("<option value=''> -- 학년 선택 -- </option>");
			for (var i = 1; i <= 3; i++){
				$("#sb_grade").append("<option value='"+ i +"'>"+ i +"</option> ");
			}
			
			// 이수단위
			$("#sb_creditunit").append("<");
			
			// 개설학기
			$("#sb_semester").append("<option value=''> -- 학기 선택 -- </option>");
			for (var i=1; i <= 2; i++){
				$("#sb_semester").append("<option value='"+i+"'>"+ i +"학기</option>");
			}
			$("sb_semester").append("<option value='3'> 전학기 </option>");
			
			// 교사목록 : 함수 다녀오기(DB)
			// 해당 과목의 모든 선생님 일단 목록 다 나와야 하고, 선택하면 그 선생님의 정보에 대해서만 수정 가능하게..
			
			// 정원
			for (var i = 25; i <= 30; i++){
				$("#sb_maxstu").append("<option value='"+i+"'>"+i+"</option>");	
			}
			
			// 수업요일	> codeutil로 뺄 수도 있음
			
			
			// 수업교시 (1 ~ 8교시)
			for (var i=1; i <= 8; i++){
				$("#sb_time").append("<option value='"+i+"'>"+i+"교시</option>");
			}
			
			
			// 선수과목명	> codeutil로 뺄 수도 있음 : 함수 다녀오기(DB)
			// DB에 있는 선수과목명 모두 호출 > 선택 박스로 나오게 
			/*
				쿼리문
				SELECT 	DISTINCT  A.SB_BEFORENAME
				FROM 	KOSMOS_SUBJECT A	
				WHERE   A.SB_BEFORENAME IS NOT NULL
				ORDER BY 1 ASC;	
			
				리턴된 SB_BEFORENAME들을 모두 모아서 여기서 풀고,
				반복문 이용해서 하나씩 빼기
				
			*/
			
			var beforenameList = ['국어1', '물리학1', '수학1', '영어1', '일본어1', '중국어1', '한문1', '화학1'];	
			var resultList = [];
			
			for(var i=0; i < beforenameList.length; i++){
                console.log(beforenameList[i]);
                beforenameList.forEach(x =>{
                	resultList.push(beforenameList[i]);
               	 	console.log(resultList[i]);
                });
                $("#sb_beforename_1").append("<option value='"+i+"'>"+ beforenameList[i] +"</option>");
                // <datalist> 엘리먼트 사용할 경우에만 가능
        		// $("#sb_beforename").append("<option value='"+ beforenameList[i] +"'></option>");
            }
			
			
            $(document).on("input", "#sb_beforeList", function(){
                var options = {};
                options.url = "/getBeforeNameList.k";
                options.type = "GET";
                options.data = { "criteria":$("#sb_beforeList").val(), };
                options.dataType = "list";
                options.success = function(data){
                    $("#sb_beforename").empty();
                    for (var i=0; i < data.length; i++){
                    	console.log("data[i] >>> : " + data[i]);
                        $("#sb_beforename").append("<option value='"+data[i]+"'></option>");
                    }
                };
                $.ajax(options);
            });
            	
			$(document).on("click", "#updateBtn", function(){
				$("#subjectUpdateForm").attr({
					'action':'subjectUpdate.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();		
			});
			
			$(document).on("click", "#insertBtn", function(){
				location.href="subject.k";
			});
			
			$(document).on("click", "#selectAllBtn", function(){
				location.href="subjectSelectAll.k";
			});
		});
	</script>
</head>
<body>
	<form id="subjectUpdateForm" name="subjectUpdateForm">
		<table border="1">
			<thead>
				<tr>
					<th colspan="5">과목 수정</th>
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
					<td>과목유형</td>
					<td>
						<input type="radio" id="sb_type" name="sb_type" value="필수">필수
						<input type="radio" id="sb_type" name="sb_type" value="선택">선택
					</td>
				</tr>
				<tr>
					<td>과목명</td>
					<td>
						<div>
							<!-- db에 있는 정보와 일치하면 검색 / db에 있는 정보와 일치하지 않으면 색 변하면서 (새로 입력) 메시지 보이게 -->
							<input type="text" id="sb_name" name="sb_name" placeholder="직접입력">
						</div>
						<div>
							<button type="button">검색</button>
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
					<!-- svo.get 값 가져와서 바인딩하기. 수정불가 -->
					<td><input id="sb_year" name="sb_year" value="바인딩하기" readonly></td>
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
                            <input type="text" id="sb_teacher" name="sb_teacher" value="바인딩하기">
                        </div>
                        <div>
                       		<!-- 해당 과목의 모든 선생님 일단 목록 다 나와야 하고, 선택하면 그 선생님의 정보에 대해서만 수정 가능하게.. (시간남으면 수정) -->
                        	<button type="button" id="search_teacher" name="search_teacher">검색</button>	
                        </div>
					</td>
				</tr>
				<tr>
					<td>정원</td>
					<td><input type="number" id="sb_maxstu" name="sb_maxstu" pattern="[25-30]" value=""></td>
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
						<div>
							<select id="sb_beforename_1" name="sb_beforename"></select>
							<input id="sb_beforeList" list="sb_beforename">테스트중</input>
      						<datalist id="sb_beforename" name="sb_beforename"></datalist>
							<!-- <select id="sb_beforename" name="sb_beforename"></select> -->	
						</div>
					</td>					
				</tr>
				<tr>
					<td>등록일</td>
					<td><input id="sb_insdate" name="sb_insdate" readonly></td>	
				</tr>
			</tbody>
			<tr>
				<td colspan="5" align="left">
					<input type="button" id="updateBtn" value="수정완료">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="insertBtn" value="새등록">
					<input type="button" id="selectAllBtn" value="전체목록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>