<%@page import="dao.bbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	boolean isS = bbsDao.getInstance().updBbs(seq, title, content);
	
	if (isS) {
	%>
	<script>
	alert('글 수정 성공');
	location.href="bbslist.jsp";
	</script>
	<%
	} else {
	%>
	<script>
	alert('글 수정 실패');
	location.href="bbslist.jsp";
	</script>
	<%
	}
%>
