<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.paging.BoardDAO2"%>
<%@ page import="com.kosmos.paging.BoardVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT LIST</title>
<style type="text/css">

	table, td{
		border:1px solid red;
	}
	
	table{
		width:70%;
		height:80%;
		margin:auto;
		text-align:center;
	}
</style>
</head>
<body>
<%
	BoardDAO2 dao = new BoardDAO2();

	// 현재 row 개수
	int pageSize = 10;
	// 목록 그룹
	int groupSize = 5;
	// 현재 페이지
	int curPage = 1;
	// 전체 글 수
	int totalCount = 0;
	
	System.out.println("curPage >>> : " + request.getParameter("curPage"));
	
	// 처음 실행되면 null값이 들어온다
	// 현재 페이지를 이동시키면 null값이 아니라서 if문이 실행된다
	if(request.getParameter("curPage") != null){
		// getParameter의 리턴값이 String이므로 int로 형변환해준다
		curPage = Integer.parseInt(request.getParameter("curPage"));
		System.out.println("curPage >>> : " + curPage);
	}
	
	System.out.println("pageSize >>> : " + pageSize);
	System.out.println("curPage >>> : " + curPage);
	
	BoardVO bvo = null;
	bvo = new BoardVO();
	bvo.setPageSize(String.valueOf(pageSize));
	bvo.setCurPage(String.valueOf(curPage));
	
	ArrayList al = dao.selectList(bvo);
	
	// ArrayList인 al의 사이즈가 0이면
	if(al.size() == 0) return;
%>
<table>
	<tr>
		<td align="center" colspan="13">select된 행의 내용 : VO 사용</td>
	</tr>	
	<tr>
		<td>글번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>이메일</td>
		<td>글내용</td>
		<td>비밀번호</td>
		<td>REF</td>
		<td>STEP</td>
		<td>DEPTH</td>
		<td>작성일</td>
		<td>조회수</td>
		<td>페이지번호</td>
		<td>전체글수</td>
	</tr>
<%
	for(int i=0; i < al.size(); i++){
		BoardVO _bvo = (BoardVO)al.get(i);
		
		totalCount = Integer.parseInt((String)_bvo.getTotalCount());
%>
	<tr>
		<td><%= _bvo.getMnum() %></td>
		<td><%= _bvo.getMtitle() %></td>
		<td><%= _bvo.getMname() %></td>
		<td><%= _bvo.getMemail() %></td>
		<td><%= _bvo.getMarea() %></td>
		<td><%= _bvo.getMpass() %></td>
		<td><%= _bvo.getMref() %></td>
		<td><%= _bvo.getMstep() %></td>
		<td><%= _bvo.getMdepth() %></td>
		<td><%= _bvo.getMwriteday() %></td>
		<td><%= _bvo.getMhits() %></td>
		<td><%= _bvo.getPageSize() %></td>
		<td><%= _bvo.getTotalCount() %></td>
	</tr>
<%
	}
%>
	<tr>
		<td colspan="13">
			<jsp:include page="paging.jsp" flush="true">
				<jsp:param value="boardSelectListVO.jsp" name="url"/>
				<jsp:param value="" name="str"/>
				<jsp:param value="<%=pageSize %>" name="pageSize"/>
				<jsp:param value="<%=groupSize %>" name="groupSize"/>
				<jsp:param value="<%=curPage %>" name="curPage"/>
				<jsp:param value="<%=totalCount %>" name="totalCount"/>
			</jsp:include>
	</tr>
</table>
</body>
</html>
<!--
se_BoardSelectList.jsp?searchString=111&searchtype=name&curPage=3
	str 파리미터에 넘길 값 : searchString=111&searchtype=name
-->