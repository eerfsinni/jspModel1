<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<h1>글쓰기</h1>

<div align = "center">

<form action="bbswriteAf.jsp" method = "post">
	<table border = "1">
	<col width = "200">	<col width = "400">
		<thead>
			<tr>
				<th>id</th>
				<td><input type = "text" name = "id" size="50px" value = "<%= login.getId() %>" readonly="readonly"></td>
			</tr>
		</thead>

		<tbody>
			<tr>
				<th>제목</th>
				<td><input type = "text" name = "title" size="50px" placeholder = "제목을 입력해주세요."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea cols = "50px" rows = "20" placeholder = "내용을 입력해주세요" name = "content"></textarea></td>
			</tr>
		</tbody>
	</table>
	<input type = "submit" value = "글 작성">

</form>
</div>
</body>
</html>