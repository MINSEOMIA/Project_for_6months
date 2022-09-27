<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
const del = (num) => {
	location.href="/aaa/board/DelController=?num="+num;
}
</script>
</head>
<body>
<c:if test="${sessionScope.id != b.writer }">
<c:set var="readAttr">readonly</c:set>  <!-- 변수선언태그 -->
</c:if>
<h3>상세페이지</h3>
<a href="/aaa/board/ListController">글목록</a><br/>
<form action="/aaa/board/DetailController" method="post">
<table border="1">
<tr><th>num</th><td><input type="text" name="num" value="${b.num }" readonly></td></tr>
<tr><th>w_date</th><td><input type="text" value="${b.w_date }" readonly></td></tr>
<tr><th>writer</th><td><input type="text" name="writer" value="${b.writer }" readonly></td></tr>
<tr><th>title</th><td><input type="text" name="title" value="${b.title }" ${readAttr }></td></tr>
<tr><th>content</th><td><textarea rows="15" cols="20" name="content" ${readAttr }>${b.content }</textarea></td></tr>
<c:if test="${sessionScope.id == b.writer }">
<tr><th>편집</th><td><input type="submit" value="수정"><input type="button" value="삭제" onclick="del(${b.num })"></td></tr>
</c:if>
</table>
</form>
</body>
</html>