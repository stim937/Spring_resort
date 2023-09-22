<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약자 관리 페이지</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	
	<div class="container mt-3">
		<h2>
			예약 상세
			<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
				<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
			</c:if>
		</h2>
		
		<c:if test="${not empty message}">
			<div class="alert alert-success">${message}</div>
		</c:if>
		
		<!-- Check if reservation is found -->
		<c:if test="${not empty reservation}">
			<!-- Display reservation information -->
			<p>이름: ${reservation.name}</p>
			<p>주소: ${reservation.addr}</p>
			<p>전화번호: ${reservation.telnum}</p>
			<p>입금자명: ${reservation.in_name}</p>
			<p>남기실 말: ${reservation.comment}</p>
			<p>예약일: ${reservation.write_date}</p>
			<p>입금 상태: ${reservation.processing}</p>
			
			<!-- Add other reservation fields as needed -->
		</c:if>
	
		<!-- Check if reservation is not found -->
		<c:if test="${reservationNotFound}">
			<p>예약정보가 존재하지 않습니다</p>
		</c:if>
		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>