<%@page import="java.net.URLEncoder"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	// back-end
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(id, pwd, name, email, 0);
	boolean isS = dao.addMember(dto);
	
	if (isS) {
		%>
			<script type="text/javascript">
			alert("성공적으로 가입되었습니다.");
			location.href = "login.jsp";
			</script>
		<%
	} else {
		%>
			<script type="text/javascript">
			alert("가입 정보를 다시 입력해주세요..");
			location.href = "regi.jsp";
			</script>
		<%
	} 
%>
