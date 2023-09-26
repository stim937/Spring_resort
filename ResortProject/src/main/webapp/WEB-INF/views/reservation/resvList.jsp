<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<style>
</style>

</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container-fluid mt-3">
		<h2>
			예약현황
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
  				<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
  				<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
			</svg>

			<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
				<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
			</c:if>
		</h2>
		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>
		<table class="table table-hover mt-3">
			<thead class="table-light">
				<tr>
					<th scope="col">일자</th>
					<th scope="col">요일</th>
					<th scope="col" class="room-column">VIP Room</th>
					<th scope="col" class="room-column">Deluxe Room</th>
					<th scope="col" class="room-column">Standard Room</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach var="i" begin="0" end="29">
					<tr>
						<td>
							<c:out value="${resv_arr[0][i]}" />
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[1][i] eq '일요일'}">
									<span style="color: red;">${resv_arr[1][i]}</span>
								</c:when>
								<c:otherwise>
									<c:out value="${resv_arr[1][i]}" />
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[2][i] eq '예약가능'}">
									<button type="button" class="btn btn-outline-success" onclick="handleReservation('${resv_arr[0][i]}', 1)">${resv_arr[2][i]}</button>
								</c:when>
								<c:when test="${resv_arr[2][i] eq '예약불가'}">
									<button type="button" class="btn btn-outline-danger" disabled>${resv_arr[2][i]}</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-outline-danger" onclick="editResv('${resv_arr[0][i]}', 1)">${resv_arr[2][i]}</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[3][i] eq '예약가능'}">
									<button type="button" class="btn btn-outline-success" onclick="handleReservation('${resv_arr[0][i]}', 2)">${resv_arr[3][i]}</button>
								</c:when>
								<c:when test="${resv_arr[3][i] eq '예약불가'}">
									<button type="button" class="btn btn-outline-danger" disabled>${resv_arr[3][i]}</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-outline-danger" onclick="editResv('${resv_arr[0][i]}', 2)">${resv_arr[3][i]}</button>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[4][i] eq '예약가능'}">
									<button type="button" class="btn btn-outline-success" onclick="handleReservation('${resv_arr[0][i]}', 3)">${resv_arr[4][i]}</button>
								</c:when>
								<c:when test="${resv_arr[4][i] eq '예약불가'}">
									<button type="button" class="btn btn-outline-danger" disabled>${resv_arr[4][i]}</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-outline-danger" onclick="editResv('${resv_arr[0][i]}', 3)">${resv_arr[4][i]}</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../bottom.jsp" />
	</div>

	<script type="text/javascript">
	
		// 세션 존재 여부 검사
		function handleReservation(date, room) { 
			// Check if loginInfo session is available
			if (${sessionScope.loginInfo != null}) {
				// 존재하면 예약페이지로
				const url = '/resvRoom?date=' + date + '&room=' + room;
				window.location.href = url;
			} else {
				// 존재하지않으면 로그인페이지로
				alert('로그인이 필요합니다.');
				openLoginForm();
			}
		}
		
		function editResv(date, room) { 
			const url = '/resvView?date=' + date + '&room=' + room;
			window.location.href = url;
		}
		
		function openLoginForm() {
		    var loginFormUrl = '/loginForm';
		    
		    // 새 창 열기
		    var loginWindow = window.open(loginFormUrl, '_blank', 'width=500,height=500');
		    
		    // 새 창이 차단되었을 경우 알림 표시
		    if (!loginWindow || loginWindow.closed || typeof loginWindow.closed === 'undefined') {
		        alert('팝업 창이 차단되었습니다. 팝업 차단을 해제하고 다시 시도하세요.');
		    }
		}
	</script>
</body>
</html>
