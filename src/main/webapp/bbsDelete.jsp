<%@page import="dto.bbsDto"%>
<%@page import="dao.bbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt(request.getParameter("seq"));

	bbsDao dao = bbsDao.getInstance();
	boolean isS = dao.delBbs(seq);

	if (isS) {
		%>
		<script>
		alert("게시글 삭제 성공");
		location.href = "bbslist.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert("게시글 삭제 실패");
		location.href = "bbslist.jsp";
		</script>
		<%		
	}
%>
