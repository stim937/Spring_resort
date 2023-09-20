<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 폼</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<style>
html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	margin-bottom: 10px;
}
</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="/authenticate" method="post">
			<img class="mb-4" src="${pageContext.request.contextPath}/img/bootstrap-icons@2x.png" alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>

			<c:if test="${not empty error}">
				<div class="alert alert-danger" role="alert" style="font-size: 13px;">${error}</div>
			</c:if>

			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력..." required> <label for="id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd" name="password" placeholder="비밀번호" required> <label for="pwd">비밀번호</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me"> 아이디 저장
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2023 Company, Inc</p>
		</form>
	</main>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload = function() {
			if (${sessionScope.loginInfo != null}) {
		        // 부모 창 새로 고침
		        window.opener.location.reload();	
		        // 현재 창 닫기
		        window.close();
			}		   
		};
    </script>
</body>
</html>
