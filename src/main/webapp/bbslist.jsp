<%@page import="dao.MemberDao"%>
<%@page import="dto.bbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.bbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// 답글의 화살표 함수
public String arrow(int depth) {
	String img = "<img src = './images/arrow.png' width = '20px', height = '20px' />";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	
	for (int i = 0 ; i < depth; i++) {
		ts += nbsp;
	}
	return depth==0?"":ts + img;
}


%> 

<%
	MemberDto login = (MemberDto) session.getAttribute("login");

	if(login == null) {
		%>
		<script>
			alert('로그인해주십시오.');
			location.href = "login.jsp";
		</script>
		<%
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String choice = request.getParameter("choice");
String search = request.getParameter("search");

if(choice == null) {
	choice = "";	
}

if (search == null) {
	search = "";
}

bbsDao dao = bbsDao.getInstance();

//페이지 넘버
String sPageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(sPageNumber != null && !sPageNumber.equals("")){
	pageNumber = Integer.parseInt(sPageNumber);
}
//글의 총수
int count = dao.getAllBbs(choice, search);

//페이지의 총수
int pageBbs = count / 10;		// 10개씩 총글의 수를 나눔		26 / 10 -> 2
if((count % 10) > 0){	// 6
	pageBbs = pageBbs + 1;		// 2 + 1	
}

// List<bbsDto> list = dao.getBbsList();
// List<bbsDto> list = dao.getBbsSearchList(choice, search);
List<bbsDto> list = dao.getBbsPageList(choice, search, pageNumber);
%>


<h1>게시판</h1>

<div align = "center">

	<table border = "1">
	<col width = "70"><col width = "600"><col width = "100"><col width = "150">
	<thead>
	</thead>
		<tr>
			<th>번호</th> <th>제목</th> <th>조회수</th> <th>작성자</th>
		</tr>

	<tbody>
	
	<%
	if(list == null || list.size()==0) {
		%>
		<tr>
			<td colspan="4">작성된 글이 없습니다</td>
		</tr>
		<%
	} else {
		for(int i = 0; i < list.size(); i++) {
			bbsDto dto = list.get(i);
			
			if(dto.getDel() == 1) {
		%>
			<tr>
				<th><%= i+1 %></th>
				<td>
					<%= arrow(dto.getDepth()) %>
				삭제된 글입니다.
				</td>
				<td><%= dto.getReadcount() %></td>
				<td><%= dto.getId() %></td>
			</tr>
		<%
		} else {
			%>
			<tr>
				<th><%= i+1 %></th>
				<td>
					<%= arrow(dto.getDepth()) %>
					<a href = "bbsdetail.jsp?seq=<%=dto.getSeq()%>">
				<%= dto.getTitle() %>
					</a>
				</td>
 				<td><%= dto.getReadcount() %></td>
				<td><%= dto.getId() %></td>
			</tr>
		<%	
		}
	  }
	}
	%>
	</tbody>
	</table>
	<br>
	
	<%
		for(int i = 0;i < pageBbs; i++){
			if(pageNumber == i){	// 현재 페이지
				%>
				<span style="font-size: 15pt;color: #0000ff;font-weight: bold;">
					<%=i+1 %>
				</span>
				<%
			} else{					// 그밖에 다른 페이지
				%>
				<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
					style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none;">
					[<%=i+1 %>]
				</a>			
				<%
			}		
		}
	%>
	
	<br><br>
	<br><br>
	<select id = "choice">
		<option value = "">검색</option>
		<option value = "title">제목</option>
		<option value = "content">내용</option>
		<option value = "writer">작성자</option>
	</select>
	<input type = "text" id = "search" value = "<%=search%>">
	<button type = "button" onclick = "searchBtn()">검색</button>
	
	
	<br><br>
	<a href = "bbswrite.jsp">글쓰기</a>
</div>

<script type="text/javascript">
let search = "<%=search%>";
console.log(search);

if (search != "") {
	document.getElementById("choice").value = "<%=choice%>";
// 	let obj = document.getElementById("choice");
// 	obj.value = ;
}

function searchBtn() {
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
// 	if(choice == "") {
// 		alert("카테고리를 선택해주세요.");
// 		return;
// 	}
	
// 	if(search.trim() == "") {
// 		alert("검색어를 입력해주세요.");
// 		return;
// 	}
	
	location.href = "bbslist.jsp?choice=" + choice + "&search=" + search;
}

function goPage( pageNumber ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;	
}

</script>

</body>
</html>