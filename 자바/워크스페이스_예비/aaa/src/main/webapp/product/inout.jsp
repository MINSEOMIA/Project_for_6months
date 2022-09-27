<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>입출고 페이지</h3>
<form action="/aaa/product/InOutController" method="post">
<table border="1">
<tr><th>상품번호</th><td><input type="text" name="num" value="${p.num }" readonly></td></tr>
<tr><th>상품명</th><td><input type="text" name="name" value="${p.name }" readonly></td></tr>
<tr><th>재고량</th><td><input type="number" name="amount" value="${p.amount }" readonly></td></tr>
<tr><th>입/출고 선택</th>
<td><input type="radio" name="inout" value="in">입고 <input type="radio" name="inout" value="out">출고</td></tr>
<tr><th>입/출고 수량</th><td><input type="number" name="cnt"></td></tr>
<tr><th>완료</th><td><input type="submit" value="완료"></td></tr>
</table>
</form>
</body>
</html>