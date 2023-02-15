<%@page import="dao.bbsDao"%>
<%@page import="dto.bbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	bbsDao dao = bbsDao.getInstance();
	boolean isS = dao.addBbs(new bbsDto(id, title, content));
	
	if (isS) {
		%>
			<script type="text/javascript">
			alert("글을 포스팅했습니다..");
			location.href = "bbslist.jsp";
			</script>
		<%
	} else {
		%>
			<script type="text/javascript">
			alert("글 포스팅에 실패했습니다.");
			location.href = "bbswrite.jsp";
			</script>
		<%
	} 
%>