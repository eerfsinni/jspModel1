<%@page import="dto.bbsDto"%>
<%@page import="dao.bbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// DB에 넣기 전엔 반드시 확인할 것
	request.setCharacterEncoding("utf-8");
	
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	bbsDao dao = bbsDao.getInstance();
	
	boolean isS = dao.answer(seq, new bbsDto(id, title, content));
	
	if(isS) {
		%>
		<script>
		alert("답글 입력 성공");
		location.href = "bbslist.jsp";
		</script>
		<%
	} else {
		%>
		<script>
		alert("답글 입력 실패");
		location.href = "bbslist.jsp";
		</script>
		<%		
	}
%>

