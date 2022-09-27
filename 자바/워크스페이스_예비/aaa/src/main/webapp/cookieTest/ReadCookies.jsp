<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h3>쿠키값 읽기</h3> <%-- ${cookie.이름.name}쿠키이름 / ${cookie.이름.value}값 --%>
${cookie.name.name }: ${cookie.name.value }<br/>
${cookie.age.name }: ${cookie.age.value }<br/>
${cookie.hobby.name }: ${cookie.hobby.value }<br/>
</body>
</html>