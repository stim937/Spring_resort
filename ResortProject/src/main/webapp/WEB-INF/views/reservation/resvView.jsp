<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약자 관리 페이지</title>
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
		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>

		<!-- Check if reservation is found -->
		<c:if test="${not empty reservation}">
			<!-- Display reservation information -->
			<h2>
				<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
					예약 정보 
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
  						<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
  						<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
					</svg>

					<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
				</c:if>
			</h2>
			<div class="card w-75">
				<div class="card-body">
					<table class="table">
						<tbody>
							<tr>
								<th class="w-25" scope="row">날짜</th>
								<td>${resvDate}</td>
							</tr>
							<tr>
								<th scope="row">방 종류</th>
								<td>
									<c:choose>
										<c:when test="${room == 1}">
		                                	VIP Room
		                            	</c:when>
										<c:when test="${room == 2}">
		                                	Deluxe Room
		                            	</c:when>
										<c:otherwise>
		                                	Standard Room
		                            	</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>${reservation.name}</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td>${reservation.addr}</td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td>${reservation.telnum}</td>
							</tr>
							<tr>
								<th scope="row">입금자명</th>
								<td>${reservation.in_name}</td>
							</tr>
							<tr>
								<th scope="row">남기실 말</th>
								<td>${reservation.comment}</td>
							</tr>
							<tr>
								<th scope="row">예약일</th>
								<td>${reservation.write_date}</td>
							</tr>
							<tr>
								<th scope="row">입금 상태</th>
								<td>${reservation.processing}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn-group d-flex justify-content-end mt-3">
					<form id="cancelForm" action="resvCancel" method="post" class="m-1">
						<input type="hidden" name="resvDate" value="${resvDate}" />
						<input type="hidden" name="room" value="${room}" />
						<button type="button" class="btn btn-danger" onclick="confirmReservationCancellation()">예약 취소</button>
					</form>
					<form action="resvEdit" method="get" class="m-1">
						<input type="hidden" name="date" value="${resvDate}" />
						<input type="hidden" name="room" value="${room}" />
						<button type="submit" class="btn btn-primary">예약 수정</button>
					</form>
					<form action="resvInfo" method="get" class="m-1">
						<button type="submit" class="btn btn-secondary">목록</button>
					</form>
				</div>
			</div>
		</c:if>

		<!-- Check if reservation is not found -->
		<c:if test="${reservationNotFound}">
			<div class="alert alert-warning mt-3">예약정보가 존재하지 않습니다</div>
		</c:if>
		<jsp:include page="../bottom.jsp" />
	</div>

	<script>
	    function confirmReservationCancellation() {
	        // 날짜, 방 종류, 예약자명을 가져옴
	        var resvDate = "${resvDate}";
	        var roomType = "";
	        switch (${room}) {
	            case 1:
	                roomType = "VIP Room";
	                break;
	            case 2:
	                roomType = "Deluxe Room";
	                break;
	            default:
	                roomType = "Standard Room";
	        }
	        var reservationName = "${reservation.name}";
	
	        // 경고창 표시
	        var confirmation = confirm("날짜: " + resvDate + "\n방 종류: " + roomType + "\n예약자명: " + reservationName + "\n예약을 취소하시겠습니까?");
	        if (confirmation) {
	            // 예약 취소를 수행하는 코드
	            document.getElementById("cancelForm").submit();
	        }
	    }
	</script>
</body>
</html>