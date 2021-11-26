<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목정보 입력 관리자 확인</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$(document).on("click", "#checkBtn", function(){
				$("#subjectAdminCheck").attr({
					'action':'subjectAdminCheck.k',
					'method':'GET',
					'enctype':'application/x-www-form-urlencoded'
				}).submit();
			});
		});
	</script>
</head>
<body>
	<form id="subjectAdminCheck">
		<table border="1">
			<tr>
				<td>
					선생님 아이디 (me_num) : 
				</td>
				<td>
					<input type="text" id="me_id" name="me_id">
				</td>	
			</tr>
			<tr>
				<td>
					선생님 비밀번호 (me_pw) : 
				</td>
				<td>
					<input type="text" id="me_pw" name="me_pw">
				</td>
			</tr>
			<tr>
				<td>
					<button id="checkBtn" name="checkBtn">확인</button>
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>