<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 생성</h3>
	<%  //스크립트릿: JSP에서 자바 코드 작성 영역
		Cookie cookie1 = new Cookie("name", "aaa");
		Cookie cookie2 = new Cookie("age", "12");

		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
	%>

	<a href="readCookie.jsp">쿠기값 읽기</a>
</body>
</html>