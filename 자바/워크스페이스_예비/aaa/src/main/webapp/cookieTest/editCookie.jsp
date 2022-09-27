<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 수정</h3>
	<%
		Cookie cookie1 = new Cookie("name", "bbb");
		Cookie cookie2 = new Cookie("age", "23");

		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>

	<a href="readCookie.jsp">쿠기값 읽기</a>

</body>
</html>