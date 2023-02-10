<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">

.center {
	margin : auto;
	width :  60%;
	border : solid 3px #ff0000;
	padding : 10px;
}

</style>

</head>
<body>

<h2>login page</h2>
<div class = "center">
	<form action="loginAf.jsp" method = "post">
	<table border = "1">
		<tr>
			<th>아이디</th>
			<td>
			<input type = "text" id = "id" size = "20"><br>
			<input type = "checkbox" id = "chk_save_id"> id저장
			</td>
		</tr>

		<tr>
			<th>패스워드</th>
			<td>
			<input type = "password" id = "pwd" size = "20"><br>
			</td>
		</tr>	

		<tr>
			<td colspan = "2">
				<input type = "submit" value="log-in">
				<a href = "regi.jsp">회원가입</a>
			</td>
		</tr>
	</table>
	</form>
</div>

<script type="text/javascript">
/*
 	cookie : id저장, pw저장 == String client
 	session : login 정보 == Object server
 */
 
 let user_id = $.cookie("user_id");
 
 if(user_id != null) { // 저장한 아이디가 있다면
	 $("#id").val(user_id);
	 $("#chk_save_id").prop("checked", true);
 }

 $("#chk_save_id").click(function(){
	 
	 if($("#chk_save_id").is(":checked")) {
		 
		if($("#id").val().trim() == ""){
			alert('id를 입력해주십시오');
			$("#chk_save_id").prop("checked", false);
		} else { // cookie 저장
			$.cookie("user_id", $("#id").val().trim(), {expires : 7, path : './'});
		}
		 
	 } else {
		 // cookie를 삭제
		 $.removeCookie("user_id", {path : './'})
	 }
	 
 });


</script>

</body>
</html>