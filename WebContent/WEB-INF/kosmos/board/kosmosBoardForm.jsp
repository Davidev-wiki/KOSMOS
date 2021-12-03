<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD : 게시판 : 글쓰기 </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$(document).on("click", "#sbbtn", function(){
			console.log("sbbtn >>> : ");								
			$('#boardForm').attr({
				'action':'boardInsert.k',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});	
</script>
</head>
<body>
<form name="boardForm" id="boardForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">게시판 글쓰기</td>				
	</tr>
	<tr>
		<td align="center">게시글번호</td>
		<!-- readonly을 사용해서 bo_num를 사용할 수 없게 만든다.-->
		<td><input type="text" name="bo_num" id="bo_num" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">게시판말머리</td>
		<td><input type="text" name="bo_header" id="bo_header" size="53"></td>
	</tr>
	<tr>
		<td align="center">제목</td>
		<td><input type="text" name="bo_subject" id="bo_subject" size="53"></td>
	</tr>
	<tr>
		<td  align="center">회원번호</td>.
		<td><input type="text" name="ms_num" id="ms_num" size="53"></td>
	</tr>
	<tr>
		<td  align="center">게시판비밀번호</td>
		<td><input type="password" name="bo_pw" id="bo_pw" size="20"></td>
	</tr>
	<tr>
		<td  align="center">게시글 내용</td>
		<td>
		<textarea name="bo_contents" id="bo_contents" cols="50" rows="10"></textarea>
	</td>
	</tr>
	<tr>
		<td  align="center">게시판첨부파일</td>
		<td>
		<input type="file" name="bo_file" id="bo_file">
	</td>
	</tr>
	<tr>
		<td colspan="2" align="right">				
		<input type="button" value="글쓰기" id="sbbtn">		
	</td>				
	</tr>
</table>
</form>
</body>
</html>