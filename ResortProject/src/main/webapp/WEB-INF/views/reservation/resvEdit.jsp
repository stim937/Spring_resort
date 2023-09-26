<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 수정</title>
<style>
body {
	margin: 0;
	padding-top: 70px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>

	<div class="container mt-3">
		<h2>
			예약 정보 수정
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
				<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
				<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
			</svg>

			<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
				<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
			</c:if>
		</h2>

		<c:choose>
			<c:when test="${not empty reservation}">
				<form action="resvEdit" method="post" class="w-50" onsubmit="return validateForm()">
					<input type="hidden" name="reservationId" value="${reservation.id}" required readonly />
					<div class="form-group">
						<label for="resv_date">예약 날짜:</label>
						<input type="text" class="form-control" id="resv_date" name="resv_date" value="${resvDate}" required readonly />
					</div>

					<input type="hidden" id="room" name="room" value="${room}">
					<div class="form-group">
						<label for="room">방 종류:</label>
						<input type="text" class="form-control" id="roomDisplay" required readonly />
					</div>
					<div class="form-group">
						<label for="name">이름:</label>
						<input type="text" class="form-control" id="name" name="name" value="${reservation.name}" required readonly />
					</div>
					<div class="form-group">
						<label for="addr">주소:</label>
						<input type="text" class="form-control" id="addr" name="addr" value="${reservation.addr}" required />
					</div>
					<div class="form-group">
						<label for="telnum">전화번호:</label>
						<input type="text" class="form-control" id="telnum" name="telnum" value="${reservation.telnum}" required />
					</div>
					<div class="form-group">
						<label for="in_name">입금자명:</label>
						<input type="text" class="form-control" id="in_name" name="in_name" value="${reservation.in_name}" required />
					</div>
					<div class="form-group">
						<label for="comment">남기실 말:</label>
						<textarea class="form-control" id="comment" name="comment" rows="4" cols="50" required>${reservation.comment}</textarea>
					</div>
					<div class="form-group">
						<label for="write_date">예약일:</label>
						<input type="text" class="form-control" id="write_date" name="write_date" value="${reservation.write_date}" required readonly />
					</div>
					<div class="form-group">
						<label for="processing">입금 상태:</label>
						<input type="text" class="form-control" id="processing" name="processing" value="${reservation.processing}" required readonly />
					</div>
					<div class="d-flex justify-content-end mt-3">
						<button type="submit" class="btn btn-primary">예약 정보 수정</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<p>예약정보가 존재하지 않습니다</p>
			</c:otherwise>
		</c:choose>

		<jsp:include page="../bottom.jsp" />
	</div>

	<script>
		// selectedRoom 값을 가져와서 해당 값을 설정
		var selectedRoom = "${room}";
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

		function validateForm() {
			var telnum = document.getElementById("telnum").value;
			var in_name = document.getElementById("in_name").value;
			var addr = document.getElementById("addr").value;

			// 전화번호 유효성 검사 (최대 길이: 20)
			var telnumPattern = /^\d{1,11}$/;
			if (!telnumPattern.test(telnum)) {
				alert("전화번호는 최대 11자리의 숫자로만 이루어져야 합니다.");
				return false;
			}
			// 입금자명 유효성 검사 (최대 길이: 20)
			if (in_name.length > 20) {
				alert("입금자명은 최대 20자여야 합니다.");
				return false;
			}

			// 주소 유효성 검사 (최대 길이: 100)
			if (addr.length > 100) {
				alert("주소는 최대 100자여야 합니다.");
				return false;
			}

			// 입금자명 유효성 검사 (한글로만 이루어져야 함)
			var koreanPattern = /^[가-힣]+$/;
			if (!koreanPattern.test(in_name)) {
				alert("올바른 한글 이름을 입력해 주세요.");
				return false;
			}
			return true; // 폼이 유효함
		}
	</script>
</body>
</html>
