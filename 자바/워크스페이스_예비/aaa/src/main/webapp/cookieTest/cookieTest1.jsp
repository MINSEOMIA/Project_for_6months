<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>��Ű ����</h3>
	<%  //��ũ��Ʈ��: JSP���� �ڹ� �ڵ� �ۼ� ����
		Cookie cookie1 = new Cookie("name", "aaa");
		Cookie cookie2 = new Cookie("age", "12");

		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
	%>

	<a href="readCookie.jsp">��Ⱚ �б�</a>
</body>
</html>