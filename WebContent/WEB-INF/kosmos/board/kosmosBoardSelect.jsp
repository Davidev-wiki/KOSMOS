<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="com.kosmos.board.vo.KosmosBoardVO" %> 
<%@ page import="java.util.List" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD SELECT</title>
<style type="text/css">
	div {
			margin: 50px 0px 0px 100px;
		}
	.mem{ text-align: center;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 비밀번호 확인
		$(document).on("click", "#pwbtn", function(){
			alert("pwbtn >>> : ");

			let pwcheckURL = "boardPwCheck.k";
			let reqType = "POST";
			let dataParam = {
				sbnum: $("#bo_num").val(),
				sbpw: $("#bo_pw").val(),
			};
			//dataParam = $("#boardUpdateForm").serialize();
			//alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: pwcheckURL,
				type: reqType,								
				data: dataParam,	            
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);
				if ("PW_GOOD" == resData){
					alert("비밀번호 GOOD.");
					$("#sbpw").attr("readonly", true);										
					$("#U").css('background-color','yellow');
					$("#D").css('color','red');
				}else if ("PW_GOOD" == resData){
					alert("비밀번호 BAD.");
					$("#bo_pw").val('');
					$("#bo_pw").focus();
				};				
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
	
		//  U
		$(document).on("click", "#U", function(){
			//alert("U >>> : ");		
			$("#boardUpdateForm").attr({ "method":"POST"
				                        ,"action":"boardUpdate.k"}).submit();
		});
		//  D
		$(document).on("click", "#D", function(){
			//alert("D >>> : ");
			$("#boardUpdateForm").attr({ "method":"POST"
				                        ,"action":"boardDelete.k"}).submit();
		});
	});
</script>	
</head>
<body>
BOARD SELECT
<hr>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listS");
	List<KosmosBoardVO> list = (List)obj;
	KosmosBoardVO bvo = null;
	if (list.size() == 1) {
		bvo = list.get(0);
	};
%>
<div>
<form name="boardUpdateForm" id="boardUpdateForm">
<table border=1>
<tr>
<td colspan="2" align="center">게시판 글수정하기</td>
</tr>
<tr>
<td class="mem">게시글번호</td>
<td><input type="text" name="bo_num" id="bo_num" value="<%= bvo.getBo_num() %>" readonly/></td>
</tr>
<tr>
<td class="mem">게시판말머리</td>
<td><input type="text" name="bo_header" id="bo_header" value="<%=  bvo.getBo_header() %>" readonly/></td>
</tr>
<tr>
<td class="mem">게시판제목</td>
<td>
<input type="text" name="bo_subject" id="bo_subject" value="<%= bvo.getBo_subject() %>" style="width:100px"  readonly/>
</td>
</tr>
<tr>
<td class="mem">회원번호</td>
<td><input type="text" name="ms_num" id="ms_num" value="<%=  bvo.getMs_num() %>" readonly/></td>
</tr>

</tr>	 
<tr>
<td class="mem">게시판내용</td>
<td>
<textarea name="bo_contents" id="bo_contents" rows="5" cols="50"><%= bvo.getBo_contents() %>					
</textarea>
</td>
</tr>
<tr>
<td class="mem">게시판첨부파일</td>
<td> 
<img src="/kosmos/fileupload/board/sm_<%= bvo.getBo_file() %>" border="1" width="40" height="50" alt="image">
</td>
</tr>
</tr>
<td class="mem">게시글 등록일</td>
<td> 
<input type="text" name="bo_insdate" id="bo_insdate" value="<%= bvo.getBo_insdate() %>" readonly />		      
</td>
</tr>	 
<td class="mem">게시글 수정일</td>
<td> 
<input type="text" name="bo_upddate" id="bo_upddate" value="<%= bvo.getBo_upddate() %>" readonly />		      
</td>
</tr>
<tr>
<td class="mem">게시판비밀번호</td>
<td>
<input type="text" name="bo_pw" id="bo_pw"  />
<button type="button" id="pwbtn">게시판비밀번호</button>

</td>	 	 
<tr>
<td colspan="2" align="right"> 		
<button type="button" id="U">수정</button>
<button type="button" id="D">삭제</button>
</td>				
</tr>
</table>
</form>
</div>
<p>
<h3>댓글 처리 하는 루틴 </h3>
<hr>
<c:import url="/rboardForm.k">
	<c:param name="ms_num" value="<%=bvo.getMs_num()%>"></c:param>
</c:import>
<!-- 
<jsp:include page="/rboardForm.h">
	<jsp:param value="<%=bvo.getMs_num()%>" name="ms_num"/>
</jsp:include>
 -->	
</body>
</html>