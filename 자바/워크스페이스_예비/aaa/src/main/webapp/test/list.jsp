<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품목록</h3>
<a href="">상품추가</a><br/> <!-- 추가폼을 보여줌 -->
<table border="1">
<tr><th>num</th><th>name</th><th>입출고</th></tr>
<c:forEach var="p" items="${list }">
<tr>
<td>${p.num }</td>
<td><a href="/aaa/product/EditController?num=${p.num }">${p.name }</a></td><!-- 제품명 클릭하면 상세페이지이동. 상세페이지에 수정 삭제 버튼 있음. 수정/삭제 처리 뒤 목록으로 -->
<td><a href="">입출고</a></td> <!-- 입출고 페이지로 이동. 입고/출고 선택, 입출고수량입력. 완료버튼 누르면 입출고 처리 뒤 목록으로 -->
</tr>
</c:forEach>
</table>
</body>
</html>