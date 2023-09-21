<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<!-- Favicons -->
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="${pageContext.request.contextPath}/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="${pageContext.request.contextPath}/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="${pageContext.request.contextPath}/img/favicons/manifest.json">
<link rel="mask-icon" href="${pageContext.request.contextPath}/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="${pageContext.request.contextPath}/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">
<meta name="theme-color" content="#712cf9">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}
</style>

<!-- HTML link 태그를 활용한 BootStrap 연동 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-xl">
			<a class="navbar-brand" href="/main"><img src="${pageContext.request.contextPath}/img/resort_logo.jpg" alt="Logo" width="40" height="40"> </a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample07XL">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">리조트 소개</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/main">EZ 리조트</a></li>
							<li><a class="dropdown-item" href="/room_01">VIP Room</a></li>
							<li><a class="dropdown-item" href="/room_02">Deluxe Room</a></li>
							<li><a class="dropdown-item" href="/room_03">Standard Room</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">찾아오기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/main.html">찾아오는길</a></li>
							<li><a class="dropdown-item" href="#">대중교통 이용</a></li>
							<li><a class="dropdown-item" href="#">자가용 이용</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">주변여행지</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/main.html">높아산</a></li>
							<li><a class="dropdown-item" href="#">조아 해수욕장</a></li>
							<li><a class="dropdown-item" href="#">따끈온천</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">예약하기</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/resvInfo">예약상황</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">리조트소식</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/notifyList">공지사항</a></li>
							<li><a class="dropdown-item" href="#">리뷰</a></li>
						</ul></li>
				</ul>

				<div class="text-end">
					<jsp:include page="./userStatus.jsp" />
				</div>
			</div>
		</div>
	</nav>	
</body>
</html>