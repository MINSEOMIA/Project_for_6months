<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
const del = (num) => {
	location.href="/aaa/product/DelController?num="+num;
}
</script>
</head>
<body>
<h3>상품 상세 페이지</h3>
<form action="/aaa/product/EditController" method="post">
<table border="1">
<tr><th>상품번호</th><td><input type="text" name="num" value="${p.num }" readonly></td></tr>
<tr><th>상품명</th><td><input type="text" name="name" value="${p.name }"></td></tr>
<tr><th>수량</th><td><input type="number" name="amount" value="${p.amount }" readonly></td></tr>
<tr><th>가격</th><td><input type="number" name="price" value="${p.price }"></td></tr>
<tr><th>편집</th><td><input type="submit" value="수정"><input type="button" value="삭제" onclick="del(${p.num })"></td></tr>
</table>
</form>
</body>
</html>