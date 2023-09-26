<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

</head>
<body class="bg-light">
	<div class="mb-6">
		<jsp:include page="../top.jsp" />
	</div>

	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/img/main_1.png" class="d-block w-100" alt="...">
				<div class="carousel-caption text-start">
					<h1>EZ리조트에 오신것을 환영합니다</h1>
					<p class="opacity-75">Some representative placeholder content for the first slide of the carousel.</p>
					<p>
						<a class="btn btn-lg btn-primary" href="#">Sign up today</a>
					</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="5000">
				<img src="${pageContext.request.contextPath}/img/main_2.png" class="d-block w-100" alt="...">
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
						<h5 class="card-title">Special title treatment</h5>
						<h6 class="card-subtitle text-muted">Support card subtitle</h6>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle">
			   			<rect width="100%" height="100%" fill="#868e96"></rect>
			   			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
					</svg>
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<h3 class="card-header">디럭스룸</h3>
					<div class="card-body">
						<h5 class="card-title">Special title treatment</h5>
						<h6 class="card-subtitle text-muted">Support card subtitle</h6>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle">
			   			<rect width="100%" height="100%" fill="#868e96"></rect>
			   			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
					</svg>
					<div class="card-body">
						<h2 class="card-title">Card One</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<h3 class="card-header">스탠다드룸</h3>
					<div class="card-body">
						<h5 class="card-title">Special title treatment</h5>
						<h6 class="card-subtitle text-muted">Support card subtitle</h6>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size: 1.125rem; text-anchor: middle">
			   			<rect width="100%" height="100%" fill="#868e96"></rect>
			   			<text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
					</svg>
					<div class="card-body">
						<h2 class="card-title">굿</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
					</div>
					<div class="card-footer">
						<a class="btn btn-primary btn-sm" href="#!">More Info</a>
					</div>
				</div>
			</div>
			<jsp:include page="../bottom.jsp" />
		</div>
	</div>
</body>
</html>