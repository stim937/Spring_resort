<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 소개</title>
</head>
<body class="bg-light">
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/img/room/VIP_1.jpg" class="d-block w-100" alt="VIP Room 1">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/room/VIP_2.jpg" class="d-block w-100" alt="VIP Room 2">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/room/VIP_3.jpg" class="d-block w-100" alt="VIP Room 3">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/room/VIP_4.jpg" class="d-block w-100" alt="VIP Room 4">
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/img/room/VIP_5.jpg" class="d-block w-100" alt="VIP Room 5">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>