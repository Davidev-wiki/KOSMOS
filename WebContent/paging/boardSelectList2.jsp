<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosmos.paging.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT LIST</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<!-- class를 container로 써야 한다!#$!@$@!%@!% -->
<div class="container">
<%
	BoardDAO dao = null;
	dao = new BoardDAO();
	
	// 현재 개수
	int pageSize = 10;
	// 목록 그룹
	int groupSize = 5;
	// 현재 페이지
	int curPage = 5;
	// 전체 글 수
	int totalCount = 0;
	
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
	
	System.out.println("pageSize >>> : " + pageSize);
	System.out.println("curPage >>> : " + curPage);
	
	ArrayList al = dao.selectList(pageSize, curPage);
	
	if(al.size() == 0){
%>
		<table border="1">
			<tr>
				<td width="400" align="center">NO DATA</td>
			</tr>
		</table>
<%
	}else{
		Iterator iter = al.iterator();
%>
<!-- 
https://www.w3schools.com/bootstrap4/bootstrap_tables.asp
 --> 
 		<table class="table-sm table-striped table-hover table-dark">
 			<tr>
 				<td align="center" colspan="13">select된 행의 내용 : 부트스트랩 사용</td>
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
 				<td>페이지</td>
 				<td>전체글수</td>
 			</tr>
<% 
			while(iter.hasNext()){
				HashMap hm = (HashMap)iter.next();
				totalCount = Integer.parseInt((String)hm.get("TOTALCOUNT"));
%>
			<tr>
				<td align="center"> <%= hm.get("mnum") %></td>
				<td align="center"> <%= hm.get("mtitle") %></td>
				<td align="center"> <%= hm.get("mname") %></td>
				<td align="center"> <%= hm.get("memail") %></td>
				<td align="center"> <%= hm.get("marea") %></td>
				<td align="center"> <%= hm.get("mpass") %></td>
				<td align="center"> <%= hm.get("mref") %></td>
				<td align="center"> <%= hm.get("mstep") %></td>
				<td align="center"> <%= hm.get("mdepth") %></td>
				<td align="center"> <%= hm.get("mwriteday") %></td>
				<td align="center"> <%= hm.get("mhits") %></td>
				<td align="center"> <%= hm.get("PAGENO") %></td>
				<td align="center"> <%= hm.get("TOTALCOUNT") %></td>
			</tr>
<%
			}
%>
 		</table>
<%
	}
%>

<jsp:include page="paging.jsp" flush="true">
	<jsp:param value="boardSelectList2.jsp" name="url"/>
	<jsp:param value="" name="str"/>
	<jsp:param value="<%= pageSize %>" name="pageSize"/>
	<jsp:param value="<%= groupSize %>" name="groupSize"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>
	<jsp:param value="<%=totalCount %>" name="totalCount"/>
</jsp:include>
</div>
</body>
</html>
<!--
se_BoardSelectList.jsp?searchString=111&searchtype=name&curPage=3
	str 파리미터에 넘길 값 : searchString=111&searchtype=name
-->