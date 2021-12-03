<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.board.vo.KosmosBoardVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style type="text/css">

	.tt{
		text-align:center;
		font-weight:bold;
	}
</style>
<link rel="stylesheet" href="/kosmos/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/kosmos/common/datepiker/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		// bo_num 게시글번호
		$(document).on("click", "#bo_num", function(){
			alert("KosmosBoardSelectPaging bo_num >>> : ");
			if($(this).prop("checked")){
				//$('input[type="checkbox"][name="sbnum"]').prop('checked',false);
				$(".bo_num").prop("checked", false);
				$(this).prop("checked", true);
			}
		});
		
		// 검색 버튼
		// U
		$(document).on("click", "#searchBtn", function(){
			alert("searchBtn >>> : ");
			$("#boardList").attr({
				"method":"GET",
				"action":"boardSelectAll.k"
			}).submit();
		});
		
		// datepicker : from ~ to 기간 조회
		$("#startdate").datepicker({
			showOn : "button",		// 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "/kosmos/img/cal_0.gif",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			onClose : function(selectedDate){
				$("#enddate").datepicker("option", "minDate", selectedDate);
			}
		});
		
		$("#enddate").datepicker({
			showOn : "button",
			buttonImage : "/kosmos/img/cal_0.gif",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			onClose : function(selectedDate){
				$("#startdate").datepicker("option", "maxDate", selectedDate);
			}
		});
		
		// I
		$(document).on("click", "#I", function(){
			alert("I >>> : ");
			location.href="boardForm.k";
		});
		
		// U
		$(document).on("click", "#U", function(){
			alert("U >>> : " );
			if($(".bo_num:checked").length == 0){
				alert("수정할 글 번호 하나를 선택하세요");
				return;
			}
			$("#boardList").attr({
				"method":"POST",
				"action":"boardSelect.k"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			alert("D >>> : " );
			if($(".bo_num:checked").length == 0){
				alert("삭제할 글 번호 하나를 선택하세요");
				return;
			}
			$("#boardList").attr({
				"method":"POST",
				"action":"boardDelete.k"
			}).submit();
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 페이징 변수 세팅
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	Object objPaging = request.getAttribute("pagingBVO");
	KosmosBoardVO pagingBVO = (KosmosBoardVO)objPaging;
	
	Object obj = request.getAttribute("listAll");
	List<KosmosBoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);
%>
<form name="boardList" id="boardList">
<table border="1" align="center">
<thead>
	<tr>
		<td colspan="10" align="center">
			<h2>게시판</h2>
		</td>
	</tr>
	<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">제목</option>
				<option value="key2">내용</option>
				<option value="key3">제목+내용</option>
				<option value="key4">작성자</option>
				<option value="key5">글번호</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
			<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
			~ <input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
			<button type="button" id="searchBtn">검색</button>
		</td>
	</tr>
	<tr>
		<td class="tt">체크</td>
		<td class="tt">글번호</td>
		<td class="tt">제목</td>
		<td class="tt">이름</td>
		<td class="tt">내용</td>
		<td class="tt">최종작성일</td>
		<td class="tt">사진</td>
	</tr>
</thead>
<%
	for(int i=0; i < nCnt; i++){
		KosmosBoardVO bvo = list.get(i);
		pageSize = Integer.parseInt(pagingBVO.getPageSize());
		groupSize = Integer.parseInt(pagingBVO.getGroupSize());
		curPage = Integer.parseInt(pagingBVO.getCurPage());
		totalCount = Integer.parseInt(bvo.getTotalCount());
		
%>
<tbody>
	<tr>
		<td align="center">
			<input type="checkbox" name="bo_num" id="bo_num" class="bo_num" value=<%= bvo.getBo_num() %>>
		</td>
		<td class="tt"><%= bvo.getBo_num() %> </td>
		<td class="tt"><%= bvo.getBo_subject() %> </td>
		<td class="tt"><%= bvo.getMs_num() %> </td>
		<td class="tt"><%= bvo.getBo_contents() %> </td>
		<td class="tt"><%= bvo.getBo_upddate() %> </td>
		<td class="tt"><img src="/kosmos/fileupload/board/sm_<%= bvo.getBo_file() %>"> </td>
	</tr>
<% 
	} // end of for
%>
	<tr>
		<td colspan="7" align="right">
			<input type="button" value="글쓰기" id="I">
			<input type="button" value="글수정" id="U">
			<input type="button" value="글삭제" id="D">
		</td>
	</tr>
	<tr>
		<td colspan="7">
			<jsp:include page="BoardPaging.jsp" flush="true">
				<jsp:param value="boardSelectPaging.k" name="url"/>
				<jsp:param value="" name="str"/>
				<jsp:param value="<%=pageSize %>" name="pageSize"/>
				<jsp:param value="<%=groupSize %>" name="groupSize"/>
				<jsp:param value="<%=curPage %>" name="curPage"/>
				<jsp:param value="<%=totalCount %>" name="totalCount"/>
			</jsp:include>
		</td>
	</tr>
</tbody>
</table>
</form>
</body>
</html>