<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인</h3>
<form action="/aaa/member/loginController" method="post">
<table style="border:solid 1px black">
<tr><th>id</th><td><input type="text" name="id"></td></tr>

<tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
<tr><th>name</th><td><input type="text" name="name"></td></tr>
<tr><th>로그인</th><td><input type="submit" value="login">
		<a href="/aaa/member/JoinController">회원가입</a></td></tr>

</table>
</form>
</body>
</html>
		

