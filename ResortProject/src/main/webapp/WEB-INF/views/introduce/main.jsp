<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

</head>
<body class="bg-light">
	<div>
		<jsp:include page="../top.jsp" />
	</div>

	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/img/main_1.jpg" class="d-block w-100" alt="...">
				<div class="container">
					<div class="carousel-caption text-start">
						<h1>Welcom! EZ RESORT</h1>
						<h5>EZ리조트의 특별한 혜택과 멋진 여행 경험을 놓치지 마세요. 회원이 되어서 더 많은 혜택을 누리세요.</h5>
						<p>
							<a class="btn btn-lg btn-primary" href="/notifyList">
								공지 확인
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
								</svg>						
							</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/img/main_2.jpg" class="d-block w-100" alt="...">
				<div class="container">
					<div class="carousel-caption">
						<h1>주변 관광지</h1>
						<p>리조트 주변 자연경관 및 관광시설을 즐겨보세요</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">
								보러가기
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
								</svg>
							</a>
						</p>
					</div>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/img/main_3.jpg" class="d-block w-100" alt="...">
				<div class="container">
					<div class="carousel-caption text-end">
						<h1>생생한 이용 후기</h1>
						<p>실제 고객님들의 생생한 이용후기를 만나보세요.</p>
						<p>
							<a class="btn btn-lg btn-primary" href="#">
							보러가기
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
  									<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
								</svg>
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container-fluid">
		<div class="row gx-4 gx-lg-5 mt-3">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<h3 class="card-header">VIP룸</h3>
					<div class="card-body">
						<h5 class="card-title">가격</h5>
						<h6 class="card-subtitle text-muted">1,500,000 원~</h6>
					</div>
					<img src="${pageContext.request.contextPath}/img/room/VIP_1.jpg" class="d-block w-100" alt="VIP Room 1">
					<div class="card-body">
						<h3 class="card-title">품격과 고급스러움을 경험할 VIP룸</h3>
						<p class="card-text">
							VIP룸은 고급스러운 인테리어와 넓은 공간을 자랑합니다. <br />품격 있는 서비스와 높은 프라이버시를 경험하세요.
						</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="/room_01">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<h3 class="card-header">디럭스룸</h3>
					<div class="card-body">
						<h5 class="card-title">가격</h5>
						<h6 class="card-subtitle text-muted">1,000,000 원~</h6>
					</div>
					<img src="${pageContext.request.contextPath}/img/room/Deluxe_1.jpg" class="d-block w-100" alt="Deluxe Room 1">
					<div class="card-body">
						<h3 class="card-title">편안한 공간, 디럭스룸</h3>
						<p class="card-text">디럭스룸은 편안하고 아늑한 분위기로 여행객들에게 편안한 휴식을 제공합니다. 다양한 편의 시설을 갖춘 이 공간에서 특별한 시간을 보내세요.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="/room_02">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<h3 class="card-header">스탠다드룸</h3>
					<div class="card-body">
						<h5 class="card-title">가격</h5>
						<h6 class="card-subtitle text-muted">600,000 원~</h6>
					</div>
					<img src="${pageContext.request.contextPath}/img/room/Standard_1.jpg" class="d-block w-100" alt="Standard Room 1">
					<div class="card-body">
						<h3 class="card-title">합리적인가격, 스탠다드룸</h3>
						<p class="card-text">스탠다드룸은 합리적인 가격에 편안하고 심플한 분위기로 여행객들에게 편안한 휴식을 제공합니다. 다양한 편의 시설로 편안한 휴식을 경험하세요.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="/room_03">자세히 보기</a>
					</div>
				</div>
			</div>

			<jsp:include page="../bottom.jsp" />
		</div>
	</div>
</body>
</html>