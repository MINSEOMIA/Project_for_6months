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
			let res = document.getElementById("res");
		//	res.innerHTML = resVal;	
			res.innerHTML = "flag:"+obj.flag+" / id:"+obj.id;
		}else{
			alert(xhttp.status); //응답코드. 200.이 정상
		}
	}
	
	//요청 객체 오픈, 요청 설정, 서버 페이지경로. 비동기(true)/동기(false) 설정
	xhttp.open("GET", "test1.jsp", true);
	
	//요청 전송
	xhttp.send();

}
</script>
</head>
<body>
<h3>ajax test 페이지</h3>
<input type="button" value="ajax요청" onclick="a()">
<div id="res"></div>


</body>
</html>