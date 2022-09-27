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
<h3>게시판</h3>
<c:if test="${empty sessionScope.id }">
<a href="/aaa/member/LoginController">로그인</a>
</c:if>
<c:if test="${not empty sessionScope.id }">
<a href="/aaa/member/DetailController">내정보확인</a><br/>
<a href="">로그아웃</a><br/>
<a href="">탈퇴</a><br/>
<a href="">로그아웃</a><br/>
</c:if>
</body>
</html>