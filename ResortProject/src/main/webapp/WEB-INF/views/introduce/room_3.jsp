<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 소개</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>

	<header class="bg-primary py-5">
		<div class="container px-5">
			<div class="row gx-5 align-items-center justify-content-center">
				<div class="col-lg-8 col-xl-7 col-xxl-6">
					<div class="my-5 text-center text-xl-start">
						<h1 class="display-5 fw-bolder text-white mb-2">스탠다드 룸</h1>
						<p class="lead fw-normal text-white-50 mb-4">
						스탠다드 룸은 합리적인 가격에 높은 품질의 휴식을 제공합니다.<br/> 
						편안하고 심플한 디자인으로 휴식을 취할 수 있는 이 공간은 <br/> 
						고객님들에게 편안함과 간편함을 제공합니다. <br/> 
						합리적인 가격에 최상의 경험을 누릴 수 있는 스탠다드 룸에서 <br/> 
						여행의 휴식을 즐겨보세요.<br/> 
						</p>
						<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
							<a class="btn btn-info btn-lg px-4 me-sm-3" href="/resvInfo">예약현황</a>
						</div>
					</div>
				</div>
				<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
					<div id="carouselExampleIndicators" class="carousel slide">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="${pageContext.request.contextPath}/img/room/Standard_1.jpg" class="d-block w-100" alt="Standard Room 1">
							</div>
							<div class="carousel-item">
								<img src="${pageContext.request.contextPath}/img/room/Standard_2.jpg" class="d-block w-100" alt="Standard Room 2">
							</div>
							<div class="carousel-item">
								<img src="${pageContext.request.contextPath}/img/room/Standard_3.jpg" class="d-block w-100" alt="Standard Room 3">
							</div>
							<div class="carousel-item">
								<img src="${pageContext.request.contextPath}/img/room/Standard_4.jpg" class="d-block w-100" alt="Standard Room 4">
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
			</div>
		</div>
	</header>

	<div class="container px-4 py-5" id="featured-3">
		<h2 class="pb-2 border-bottom">제공 서비스</h2>
		<div class="row g-4 py-5 row-cols-1 row-cols-lg-4">
			<div class="feature col">
				<div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
					<img src="${pageContext.request.contextPath}/img/room/bed.png" class="d-block w-100" alt="bed">
				</div>
				<h3 class="fs-2 text-body-emphasis">침실/거실</h3>
				<p>침대, 책상, 책상 의자, TV, 라탄의자</p>
			</div>
			<div class="feature col">
				<div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
					<img src="${pageContext.request.contextPath}/img/room/bathroom.png" class="d-block w-100" alt="bathroom">
				</div>
				<h3 class="fs-2 text-body-emphasis">욕실</h3>
				<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데, 헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
			</div>
			<div class="feature col">
				<div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
					<img src="${pageContext.request.contextPath}/img/room/kitchen.png" class="d-block w-100" alt="kitchen">
				</div>
				<h3 class="fs-2 text-body-emphasis">주방</h3>
				<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
			</div>
			<div class="feature col">
				<div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
					<img src="${pageContext.request.contextPath}/img/room/other.png" class="d-block w-100" alt="other">
				</div>
				<h3 class="fs-2 text-body-emphasis">추가 제공 물품</h3>
				<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지, 편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
			</div>
		</div>
		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>