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

	  
	  // ��ü üũ Ŭ�� �� �߻��ϴ� �Լ�
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


	  // ���� üũ Ŭ�� �� �߻��ϴ� �Լ�
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
		<h2>�Խ���</h2>
	</td>
</tr>
<tr>
<td  colspan="10" align="left">
<select id="keyfilter" name="keyfilter">
	<option value="key1">����</option>
	<option value="key2">����</option>
	<option value="key3">����+����</option>
	<option value="key4">�ۼ���</option>
	<option value="key5">�۹�ȣ</option>
</select>
<input type="text" id="keyword" name="keyword" placeholder="�˻��� �Է�"><br>
<input type="text" id="startdate" name="startdate" size="12" placeholder="������ ">
~ <input type="text" id="enddate" name="enddate" size="12" placeholder="������">
<button type="button" id="searchBtn">�˻�</button>
</td>
</tr>
<tr>
	<td class="tt">�۹�ȣ</td>
	<td class="tt">����</td>
	<td class="tt">�̸�</td>		
	<td class="tt">����</td>

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