<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8">
<!-- HTML link 태그를 활용한 BootStrap 연동 -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
	<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="/main">
							EZ RESORT <span class="visually-hidden">(current)</span>
						</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Room</a>
						<div class="dropdown-menu bg-light">
							<a class="dropdown-item" href="/room_01">VIP Room</a>
							<a class="dropdown-item" href="/room_02">Deluxe Room</a>
							<a class="dropdown-item" href="/room_03">Standard Room</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">오시는길</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주변 관광지</a></li>
					<li class="nav-item"><a class="nav-link" href="/resvInfo">예약현황</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">리조트소식</a>
						<div class="dropdown-menu bg-light">
							<a class="dropdown-item" href="/notifyList">공지사항</a>
							<a class="dropdown-item" href="#">이용후기</a>
						</div></li>
				</ul>
				<div class="text-end">
					<jsp:include page="./userStatus.jsp" />
				</div>
			</div>
		</div>
	</nav>
</header>
