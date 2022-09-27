<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = () =>{
	if(${empty id}){//joinForm.jsp에서 왔냐?
		document.f2.id.value = opener.document.f1.id.value;
	}else{		
		let res = document.getElementById("res");
		let msg = "중복된 아이디";
		if(${flag}){
			msg = "사용가능한 아이디<input type='button' value='이id사용' onclick='b()'>";
		}
		res.innerHTML=msg;
	}
}
const b = () => {
	opener.document.f1.id.value = document.f2.id.value;
	window.close();
}
</script>
</head>
<body>
<h4>id 중복체크</h4>

<form action="/aaa/member/IdCheckController" method="post" name="f2">
id:<input type="text" name="id" value="${id }"><br/>
<input type="submit" value="중복체크">
</form>
<div id="res"></div>
</body>
</html>