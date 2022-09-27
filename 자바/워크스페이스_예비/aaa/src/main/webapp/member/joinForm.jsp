<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>ajax test 페이지</h3>
<input type="button" value="ajax요청" onclick="a()">
<div id="res"></div>

</head>
<body>
<h3>회원가입</h3>
<form action="/aaa/member/JoinController" method="post">
<table style="border:solid 1px black">
<tr><th>	
	<td>
		<input type="text" name="id">
		<input type="button" value="중복체크" onclick="a()">
	</td>
</tr>

<tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
<tr><th>name</th><td><input type="text" name="name"></td></tr>
<tr><th>email</th><td><input type="email" name="email"></td></tr>
<tr><th>가입</th><td><input type="submit" name="가입"></td></tr>

</table>
</form>
</body>
</html>



