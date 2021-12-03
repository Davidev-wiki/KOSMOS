<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.kosmos.board.vo.KosmosBoardVO" %>
<%@ page import = "com.kosmos.rboard.vo.KosmosRboardVO" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RBOARD : 댓글 </title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//co_contents 길이 제한
		$("#co_contents").keyup(function(){
			cut_200(this);
		});
		
		selectAll();
				
		// 댓글 등록
		$(document).on("click", "#I", function(){
			alert("I >>> : ");
			
			let insertURL = "rboardInsert.k";		
			let method = "POST";
			let dataParam = {
					bo_num : $("#bo_num").val(),
				ms_num: $("#ms_num").val(),
				co_contents: $("#co_contents").val(),
			};
			dataParam = $("#rboardForm").serialize();
			alert("dataParam >>> : " + dataParam);
			
			console.log("insertURL >>: " + insertURL);
			console.log("method >>>: " + method);
			console.log("dataParam >> : " + dataParam);
			
			$.ajax({
				url: insertURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);	
				if ("GOOD" == resData){
					rboardFormData();
					location.reload();
				}
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
		
		// 단건 조회
		$(document).on("click", "#S", function(){
			alert("S >>> : ");
			
			let selectURL = "rboardSelect.k";
			let method = "POST";
			let dataParam = {
					co_num: $("#co_num").val(),				
			};
			// dataParam = $("#jsonTestForm").serialize();
			alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url: selectURL,
				type: method,
				data: dataParam,
				success: whenSuccess,
				error: whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);
				let v = resData.split(",");
				for(let i=0; i < v.length; i++){
					console.log("v[0]" + v[0]);
					console.log("v[1]" + v[1]);
					console.log("v[2]" + v[2]);
					console.log("v[3]" + v[3]);
					addNewItem(v[0], v[1], v[2], v[3]);
				}
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});			
		
		// 댓글 삭제		
		$(document).on("click", ".deleteBtn", function(){
			alert("D >>> : ");
			
			// **************************중요******************************
			var co_num = $(this).parents("li").attr("dataNum");
			var target = $(this).parents(".rbmemoItem");
			
			console.log("target >>> : " + target);
			
			let deleteURL = "rboardDelete.k";
			let method = "POST";
			let dataParam = {
				co_num : co_num,				
			};
			// dataParam = $("#jsonTestForm").serialize();
			alert("dataParam >>> : " + dataParam);
			
			$.ajax({
				url : deleteURL,
				type : method,
				data : dataParam,
				success : whenSuccess,
				error : whenError
			});
			
			function whenSuccess(resData){	
				alert("resData >>> : " + resData);	
				console.log("resData >>> : " + resData);	
				
				if ("GOOD" == resData){
					alert("댓글이 삭제되었습니다.");
					target.remove();
				}	
			}
			function whenError(e){
				alert("e >>> : " + e.responseText);
			}
		});
	});
	
	// 게시글 번호로 댓글 전체조회
	function selectAll(){
					
		alert("SALL >>> : ");
		
		let selectAllURL = "rboardSelectAll.k";
		let method = "POST";
		let dataParam = {
				bo_num: $("#bo_num").val(),				
		};		
		// dataParam = $("#jsonTestForm").serialize();
		alert("dataParam >>> : " + dataParam);
		
		$.ajax({
			url : selectAllURL,
			type : method,
			data : dataParam,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : whenSuccess,
			error : whenError
		});
		
		function whenSuccess(resData){	
			alert("resData >>> : " + resData);
			console.log("whenSuccess rboardSelectAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i=0; i < v.length; i++){
				console.log(v[i]);
				
				let vv = v[i].split(",");
				let j=0
				for (; j < vv.length-1; j++){
					console.log("vv[0] >>> : " + vv[0]);
					console.log("vv[1] >>> : " + vv[1]);
					console.log("vv[2] >>> : " + vv[2]);
					console.log("vv[3] >>> : " + vv[3]);					
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3]);
			}
		}
		function whenError(e){
			alert("e >>> : " + e.responseText);
		}	
	}
	
	//새로운 글 화면에 추가	
	function addNewItem(num, writer, content, datetime){
		
		//데이터 체크
		if(isEmpty(num)) return false;
		
		// 새로운 글이 추가될 li태그 
		var newLi = $("<li>");
		newLi.attr("dataNum", num);
		newLi.addClass("rbmemoItem");
		// 작성자 정보가 지정될 <p> 태그 
		var writerP = $("<p>");
		writerP.addClass("writer");
		// 작성자 정보의 이름 
		var nameSpan = $("<span>");
		nameSpan.addClass("name");
		nameSpan.html(decodeURIComponent(writer) + "님");
		// 작성일시 
		var dateSpan = $("<span>");
		dateSpan.html(" / " + datetime + " ");
		// 삭제 버튼 
		var delInput = $("<input>");
		delInput.attr({"type":"button", "value":"삭제하기"});
		delInput.addClass("deleteBtn");
		// 내용
		var contentP = $("<p>");
		contentP.html(decodeURIComponent(content));
		
		// 조립하기
		writerP.append(nameSpan).append(dateSpan).append(delInput);
		newLi.append(writerP).append(contentP);
		$("#rboardlist").append(newLi);
	}
	
	// 댓글 길이 체크 -----------------------------------------
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t = t.substring(0, 1);
		}
		$(obj).val(t);
		$(".bytes").text(getTextLength(t));
	}
	// 댓글 길이 체크 -----------------------------------------
	
	//댓글 등록 후 입력창 초기화
	function rboardFormData(){
		$("#co_num").val("");
		$("#co_contents").val("");
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val=="undefined" || val==null || val==""){
			return true;
		}else{
			return false;
		}
	}
</script>

</head>
<body>
RBOARD : 댓글 
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String bo_num = request.getParameter("bo_num");
	System.out.println("rboardFrom bo_num >>> : " + bo_num);
%>
<div id="rbwriterdiv">
<form name="rboardForm" id="rboardForm">
<table>
<tr>
	<td>작성자</td>
	<td>
		<input type="text" name="ms_num" id="ms_num"/>
		<input type="hidden" name="bo_num" id="bo_num" value="<%=bo_num%>">
		<input type="hidden" name="co_num" id="co_num">
	    <input type="button" value="저장하기" id="I">
	</td>
</tr>
<tr>
	<td>덧글 내용</td>
		<td>
			<textarea name="co_contents" id="co_contents" rows="5" cols="50"
			style="resize:none"></textarea>
			<div><span class="bytes">0</span>bytes</div>
		</td>
</tr>
</table>
<hr>
<ul name="rboardlist" id="rboardlist">
	<!-- 여기에 동적 생성 요소가 들어온다. -->
</ul>
</form>
</div>
</body>
</html>