<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키에 path와 유효시간 설정</h3>
	<%
		Cookie cookie1 = new Cookie("c1", "v1");
		Cookie cookie2 = new Cookie("c2", "v2");

		cookie1.setPath("/");
		cookie1.setMaxAge(60 * 60);

		cookie2.setPath("/ch9/cookieTest");
		cookie2.setMaxAge(60 * 60 * 24);

		response.addCookie(cookie1);
		response.addCookie(cookie2);
	%>
		cookie1 name: <%= cookie1.getName() %><br>
		cookie1 value: <%= cookie1.getValue() %><br>
		cookie1 path: <%= cookie1.getPath() %><br>
		cookie1 max age: <%= cookie1.getMaxAge() %><br><br>
		
		cookie2 name: <%= cookie2.getName() %><br>
		cookie2 value: <%= cookie2.getValue() %><br>
		cookie2 path: <%= cookie2.getPath() %><br>
		cookie2 max age: <%= cookie2.getMaxAge() %><br>
	
</body>
</html>