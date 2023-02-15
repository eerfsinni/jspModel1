<%@page import="dto.MemberDto"%>
<%@page import="dao.bbsDao"%>
<%@page import="dto.bbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	String id = request.getParameter("id");
	bbsDao dao = bbsDao.getInstance();
	bbsDto dto = dao.getBbs(seq);
	
	MemberDto login = (MemberDto) session.getAttribute("login");

	if(login == null) {
		%>
		<script>
			alert('로그인해주십시오.');
			location.href = "login.jsp";
		</script>
		<%
	}
	
	boolean isS = dao.readCountPlus(seq);
	if (isS) {
		%>
		<script>
			alert('조회수 갱신 성공');
		</script>
		<%
		} else {
		%>
		<script>
			alert('조회수 갱신 실패');
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
<div align = "center">
<table border = "1">
<col width = 200><col width = 500> 
	<tr>
		<th>작성자</th><td><%= dto.getId() %></td>
	</tr>
	
	<tr>
		<th>제목</th><td><%= dto.getTitle() %></td>
	</tr>

	<tr>
		<th>작성일</th><td><%= dto.getWdate() %></td>
	</tr>	

	<tr>
		<th>조회수</th><td><%= dto.getReadcount() %></td>
	</tr>	

	<tr>
		<th>답글정보</th><td><%= dto.getRef()%> - <%= dto.getStep() %> - <%= dto.getDepth() %></td>
	</tr>	
	
	<tr>
		<th>내용</th><td><%= dto.getContent() %></td>
	</tr>		
</table>
<br>
<span>
	<button type = "button" onclick = "answerBbs(<%=dto.getSeq()%>)">답글</button>
	<button type = "button" onclick = "location.href='bbslist.jsp'">글 목록</button>
<%
 	if(dto.getId().equals(login.getId())) { 
	%>		
	<button type = "button" onclick = "updateBbs(<%=dto.getSeq()%>)">수정</button>
	<button type = "button" onclick = "deleteBbs(<%=dto.getSeq()%>)">글 삭제</button>	
	<%
 	}
%>
</span>
</div>

<script type="text/javascript">
function answerBbs(seq) {
	location.href = "answer.jsp?seq=" + seq;
}

function updateBbs(seq) {
	location.href = "bbsUpdate.jsp?seq=" + seq; // writer랑 제목 내용 다 보여줘야지
}

function deleteBbs(seq) {
	location.href = "bbsDelete.jsp?seq=" + seq; // update해야 함 : del = 1
}

//readcount 증가
</script>

</body>
</html>