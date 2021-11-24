<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.kosmos.sugang.vo.KosmosSugangVO" %> 
<%@ page import="java.util.List" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
const dataLists = [
    {id : 1, data : "aaa"},
    {id : 2, data : "bbb"},
    {id : 3, data : "ccc"}
]

const CheckBox = () => {
	  const [checkedList, setCheckedLists] = useState([]);

	  
	  // 전체 체크 클릭 시 발생하는 함수
/*	  const onCheckedAll = useCallback(
	    (checked) => {
	      if (checked) {
	        const checkedListArray = [];

	        dataLists.forEach((list) => checkedListArray.push(list));

	        setCheckedLists(checkedListArray);
	      } else {
	        setCheckedLists([]);
	      }
	    },
	    [dataLists]
	  );
*/


	  // 개별 체크 클릭 시 발생하는 함수
	  const onCheckedElement = useCallback(
	    (checked, list) => {
	      if (checked) {
	        setCheckedLists([...checkedList, list]);
	      } else {
	        setCheckedLists(checkedList.filter((el) => el !== list));
	      }
	    },
	    [checkedList]
	  );
	};
	
	return (
		      <input
		        type="checkbox"
		        onChange={(e) => onCheckedAll(e.target.checked)}
		        checked={
		          checkedList.length === 0
		            ? false
		            : checkedList.length === dataLists.length
		            ? true
		            : false
		        }
		      />
		        {dataLists.map((list) => (
		            <input
		            key={list.id}
		              type="checkbox"
		              onChange={(e) => onCheckedElement(e.target.checked, list)}
		              checked={checkedList.includes(list) ? true : false}
		            />
		        ))}g
		    )}
		  </CartListContainer>
		);
		
  </script>
  
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%

	Object obj = request.getAttribute("listAll");
	List<KosmosSugangVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("nCnt >>> : " + nCnt);	
%>

<table border="1" align="center">
<thead>
<tr>
	<td colspan="10" align="center">
		<h2>게시판</h2>
	</td>
</tr>
<tr>
<td  colspan="10" align="left">
<select id="keyfilter" name="keyfilter">
	<option value="key1">제목</option>
	<option value="key2">내용</option>
	<option value="key3">제목+내용</option>
	<option value="key4">작성자</option>
	<option value="key5">글번호</option>
</select>
<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일 ">
~ <input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
<button type="button" id="searchBtn">검색</button>
</td>
</tr>
<tr>
	<td class="tt">글번호</td>
	<td class="tt">제목</td>
	<td class="tt">이름</td>		
	<td class="tt">내용</td>

</tr>
</thead>
<%

for(int i=0; i<nCnt; i++){		
	KosmosSugangVO svo = list.get(i);	
	
%>		 			
<tbody>
<tr>
	<td align="center">
		<input type="checkbox" name="sbnum" id="sbnum" class="sbnum" value=<%= svo.getSbnum() %> >
	</td>		
	<td class="tt"><%= svo.getSbnum() %> </td>
	<td class="tt"><%= svo.getSbsubject() %> </td>
	<td class="tt"><%= svo.getSbname() %> </td>
	<td class="tt"><%= svo.getSbcontent() %> </td>
</tr>	
<%
}//end of for
%>		

</body>
</html>