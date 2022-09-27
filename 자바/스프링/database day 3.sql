<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원가입</h3>
<form action="" method="">
<table border="1">
<tr><th>id</th><td><input type="text" name="id"></td></tr>
<tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
<tr><th>email</th><td><input type="text" name="email"></td></tr>
<tr><th>gender</th><td><input type="radio" name="gen" value="f">여 <input type="radio" name="gen" value="m">남</td></tr>
<tr><th>학년</th><td><select name="grade"><option>1</option><option>2</option><option>3</option>
<option>4</option></select></td></tr>
<tr><th>취미</th><td><input type="checkbox" name="hobby" value="1">낚시 
					<input type="checkbox" name="hobby" value="2">운동
					<input type="checkbox" name="hobby" value="3">등산
					<input type="checkbox" name="hobby" value="4">수영
					</td></tr>
<tr><th>가입인사</th><td><textarea rows="5" cols="15"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
</table>
</form>
</body>
</html>