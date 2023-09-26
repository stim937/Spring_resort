<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body {
	margin: 0; 
	padding-top: 70px;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<h2>
			예약 페이지
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
  				<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
  				<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
			</svg>

			<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
				<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
			</c:if>
		</h2>
		<form class="w-50" action="resvSave" method="POST">
			<div class="form-group">
				<label for="date">날짜:</label>
				<input type="date" id="date" name="resv_date" required value="${selectedDate}" readonly class="form-control">
			</div>

			<!-- 이 부분에서는 실제 값은 hidden 필드로 넘기고 사용자에게는 표시만 하도록 설정 -->
			<input type="hidden" id="room" name="room" value="${selectedRoom}">
			<div class="form-group">
				<label for="room">룸:</label>
				<input type="text" id="roomDisplay" required readonly class="form-control">
			</div>

			<div class="form-group">
				<label for="name">성명:</label>
				<input type="text" id="name" name="name" required value="${sessionScope.loginInfo.nickname}" readonly class="form-control">
			</div>

			<div class="form-group">
				<label for="addr">주소:</label>
				<input type="text" id="addr" name="addr" class="form-control">
			</div>

			<div class="form-group">
				<label for="telnum">연락처:</label>
				<input type="text" id="telnum" name="telnum" class="form-control">
			</div>

			<div class="form-group">
				<label for="in_name">입금자명:</label>
				<input type="text" id="in_name" name="in_name" class="form-control">
			</div>

			<div class="form-group">
				<label for="comment">남기실 말:</label><br>
				<textarea id="comment" name="comment" rows="4" cols="50" class="form-control"></textarea>
			</div>

			<div class="d-flex justify-content-end mt-3">
				<input type="submit" value="예약하기" class="btn btn-primary">
			</div>
		</form>
		<jsp:include page="../bottom.jsp" />
	</div>

	<script>
		// selectedRoom 값을 가져와서 해당 값을 설정
		var selectedRoom = "${selectedRoom}";
		var roomDisplay = document.getElementById("roomDisplay");

		// selectedRoom 값을 기반으로 적절한 룸 이름을 표시
		switch (selectedRoom) {
		case "1":
			roomDisplay.value = "VIP Room";
			break;
		case "2":
			roomDisplay.value = "Deluxe Room";
			break;
		case "3":
			roomDisplay.value = "Standard Room";
			break;
		}
	</script>
</body>
</html>
