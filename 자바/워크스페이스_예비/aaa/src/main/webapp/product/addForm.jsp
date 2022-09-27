<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품추가</h3>
<form action="/aaa/product/AddController" method="post">
<table border="1">
<tr><th>상품명</th><td><input type="text" name="name"></td></tr>
<tr><th>수량</th><td><input type="number" name="amount"></td></tr>
<tr><th>가격</th><td><input type="number" name="price"></td></tr>
<tr><th>추가</th><td><input type="submit" value="추가"></td></tr>
</table>
</form>
</body>
</html>