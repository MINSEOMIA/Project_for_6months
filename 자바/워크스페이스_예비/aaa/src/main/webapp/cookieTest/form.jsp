<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>정보입력</h3>
<form action="/aaa/MyCookie1" method="post">
name:<input type="text" name="name"><br/>
age:<input type="number" name="age"><br/>
hobby:<input type="checkbox" name="hobby" value="1">수영
<input type="checkbox" name="hobby" value="2">배구
<input type="checkbox" name="hobby" value="3">농구
<input type="checkbox" name="hobby" value="4">축구
<br/><input type="submit" value="등록">
</form>
</body>
</html>