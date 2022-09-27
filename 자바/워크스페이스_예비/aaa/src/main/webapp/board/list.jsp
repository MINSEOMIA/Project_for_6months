<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const a = (num) => {
	
	
	
	
	
	
	
	
	let div = document.getElementById("detail");
	div.innerHTML = "";
}

const b = () => {
	
	
}
</script>
</head>
<body>
<h3>글목록</h3>

<a href="/aaa/board/AddController">글작성</a><br/>
<table border="1">
<tr><th>num</th><th>title</th><th>writer</th></tr>
<c:forEach var="b" items="${list }">
<tr>
<td>${b.num }</td><td><a href="/aaa/board/DetailController?num=${b.num }" onmouseover="a({${b.num}})" onmouseout="b()">$</a></td>
</tr>
</c:forEach>
</table>
<div id="detatil"
</body>
</html>