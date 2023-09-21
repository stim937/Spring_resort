<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<style>
body {
	margin: 10 auto; /* 가운데 정렬을 위한 자동 마진 설정 */
	text-align: center; /* 텍스트를 가운데 정렬 */
}

.room-column {
	width: 20%; /* 각 칼럼의 너비를 33%로 설정하여 동일한 너비로 만듭니다. */
}
</style>

</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<h2>예약현황</h2>
		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>
		<table class="table table-hover">
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
									<button type="button" onclick="handleReservation('${resv_arr[0][i]}', 1)">예약가능</button>
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: red;">${resv_arr[2][i]}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[3][i] eq '예약가능'}">
									<button type="button" onclick="handleReservation('${resv_arr[0][i]}', 2)">예약가능</button>
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: red;">${resv_arr[3][i]}</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${resv_arr[4][i] eq '예약가능'}">
									<button type="button" onclick="handleReservation('${resv_arr[0][i]}', 3)">예약가능</button>
								</c:when>
								<c:otherwise>
									<span style="font-weight: bold; color: red;">${resv_arr[4][i]}</span>
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
