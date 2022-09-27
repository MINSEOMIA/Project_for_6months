<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>내 정보</h3>
<form action="/aaa/member/DetailController" method="post">
<table style="border:solid 1px black">
<tr><th>id</th><td><input type="text" name="id" value="${m.id}" readonly></td></tr>
<tr><th>pwd</th><td><input type="text" name="pwd"value="${m.pwd} "></td></tr>
<tr><th>name</th><td><input type="text" name="name" value="${m.name} " readonly></td></tr>
<tr><th>email</th><td><input type="email" name="email" value="${m.email} "></td></tr>
<tr><th>가입</th><td><input type="submit" name="가입" value="수정">
				<a href="/aaa/boardindex.jsp">메뉴로 돌아감</a></td></tr>

</table>

</form>


</body>
</html>