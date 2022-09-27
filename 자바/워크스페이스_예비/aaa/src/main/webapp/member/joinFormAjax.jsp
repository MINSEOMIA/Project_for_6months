<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
const a = () => {
	//비동기 요청 객체 생성
	const xhttp = new XMLHttpRequest();
	
	//핸들러 등록: 요청에 대한 응답이 왔을때 자동 호출될 함수 등록
	xhttp.onload = function() {
		//응답 처리 내용
		if(xhttp.status==200){
			let resVal = xhttp.responseText; //텍스트 응답	
			let obj = JSON.parse(resVal); ?//응답 값을 json으로 파싱
			let msg= "사용 불가능한 아이디";
			if(obj.flag){
				msg = "사용 가능한 아이디";
			}else{
				f1.id.value ="";
			}
			let res = document.getElementById("res");
		//	res.innerHTML = resVal;	
			res.innerHTML = msg;
		}else{
			alert(xhttp.status); //응답코드. 200.이 정상
		}
	}
	let id =f1.id.value;
	//post 요청
	//요청 객체 오픈, 요청 설정, 서버 페이지경로. 비동기(true)/동기(false) 설정
	xhttp.open("POST", "/aaa/member/IdCheck2Controller", true);
	xhttp.setRequestHeader('Content-type','application/x-www-form-urlencoded;charset=utf-8');
	let id= f1.id.value;
	let param= "id="+id;
	
	//요청 전송
	xhttp.send(param);
	
	/* get 방식 요청 
	요청 객체 오픈.요청 설정
	xhttp.open("GET", "/aaa/member/IdCheck2Controller?id="+id, true);
	*/
	
	
}
</script>
</head>
<body>
<h3>회원가입</h3>
<form action="/aaa/member/JoinController" method="post" name="f1">
<table style="border:solid 1px black">
<tr><th>id</th>
	<td>
		<input type="text" name="id">
		<input type="button" value="중복체크" onclick="a()">
	</td>
</tr>
<tr><th>pwd</th><td><input type="password" name="pwd"></td></tr>
<tr><th>name</th><td><input type="text" name="name"></td></tr>
<tr><th>email</th><td><input type="email" name="email"></td></tr>
<tr><th>가입</th><td><input type="submit" value="가입"></td></tr>
</table>
</form>
</body>
</html>