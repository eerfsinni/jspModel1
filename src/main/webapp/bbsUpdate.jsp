<%@page import="dto.bbsDto"%>
<%@page import="dao.bbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));

	bbsDao dao = bbsDao.getInstance();
	bbsDto dto = dao.getBbs(seq);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="bbsUpdateAf.jsp" method = "post">
<div align = "center">
<h2>글 수정</h2> <br>
	<table border = "2">
	<col width = "200"><col width = "500">
		<tr>
			<th>작성자</th>
			<td><%= dto.getId() %></td>
		</tr>

		<tr>
			<th>제목</th>
			<td>
				<textarea rows = "2" cols = "50" name = "title"><%=dto.getTitle() %></textarea>
				<input type = "hidden" name = "seq" value = "<%= dto.getSeq() %>">
			</td>
		</tr>
	
		<tr>
			<th>내용</th>
			<td>
				<textarea rows = "20" cols = "50" name = "content"><%=dto.getContent() %></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan = "2" align = "center">
			<button type = "submit">수정하기</button>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>