<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 삭제</h3>
	<%
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
	//		if (cookies[i].getName().equals("name") || cookies[i].getName().equals("age")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
		//	}
		}
	
	%>
	<a href="readCookie.jsp">쿠기 읽기</a>
</body>
</html>