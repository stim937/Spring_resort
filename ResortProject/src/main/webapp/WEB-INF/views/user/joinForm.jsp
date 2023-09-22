<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<h1>회원가입 페이지</h1>
		<form action="/saveUser" method="post" class="needs-validation w-50" novalidate>
			<div class="input-group">
				<div class="input-group-text col-2">ID</div>
				<input type="text" class="form-control" name="loginId" value="${userDto.loginId}" placeholder="아이디를 입력해주세요" required>
				<br>
			</div>
			<div class="text-danger">${valid_loginId}</div>

			<div class="input-group">
				<div class="input-group-text col-2">비밀번호</div>
				<input type="password" class="form-control" name="password" value="${userDto.password}" placeholder="비밀번호를 입력해주세요" required>
			</div>
			<div class="text-danger">${valid_password}</div>

			<div class="input-group">
				<div class="input-group-text col-2">닉네임</div>
				<input type="text" class="form-control" name="nickname" value="${userDto.nickname}" placeholder="이름을 입력해주세요" required>
			</div>
			<div class="text-danger">${valid_nickname}</div>

			<div class="input-group">
				<div class="input-group-text col-2">이메일</div>
				<input type="email" class="form-control" id="email" name="email" value="${userDto.email}" placeholder="이메일을 입력해주세요" required>
			</div>
			<div class="text-danger">${valid_email}</div>

			<div class="d-flex justify-content-end mt-3">
				<button class="btn btn-primary" type="submit" id="submitButton">가입</button>
			</div>
		</form>

		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>
