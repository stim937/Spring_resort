<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관광정보 안내</title>
<style>
#map {
	height: 400px;
	width: 100%;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<h2>
			추천 여행지
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-map" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
			</svg>
		</h2>
		<div class="row mt-3">
			<div class="border-end bg-white col-lg-2">
				<div class="card mb-4">
					<div class="card-header">
						추천 여행지 리스트
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo" viewBox="0 0 16 16">
  							<path fill-rule="evenodd" d="M8 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zM4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z" />
						</svg>
					</div>
					<div class="card-body" id="button-container"></div>
					<div class="card-footer d-flex justify-content-end">
						<button class="btn btn-info" onclick="window.location.reload()">전체보기</button>
					</div>
				</div>
			</div>

			<div class="col-lg-10">
				<div class="card mb-4">
					<div class="card-header">
						<div id="map"></div>
					</div>

					<div class="card-body">
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">속초 해수욕장</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 속초시 해오름로 190
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										033-639-2027
									</div>
									<p class="card-text mb-auto">속초 해수욕장입니다.</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_1.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">청초수물회</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 속초시 엑스포로 12-36
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										0507-1425-5051
									</div>
									<p class="card-text mb-auto">대한민국 최초 물회 전문점. 대한민국 1등 물회</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_2.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">바다정원</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 고성군 토성면 버리깨길 23
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										033-636-1096
									</div>
									<p class="card-text mb-auto">바다풍경이 멋진 카페</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_3.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">속초 중앙시장</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 속초시 중앙로147번길 16
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										033-801-0900
									</div>
									<p class="card-text mb-auto">먹거리가 가득한 속초의 전통 재래시장</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_4.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">설악산</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 양양군 서면 오색리
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										033-801-0900
									</div>
									<p class="card-text mb-auto">강원도를 대표하는 산</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_5.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">설악산 케이블카</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 속초시 설악산로 1085
									</div>
									<div class="mb-1 text-body-secondary">033-636-4300</div>
									<p class="card-text mb-auto">설악산 절경을 한눈에 볼 수 있는 케이블카</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_6.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>
						<div class="divs" style="display: none;">
							<div class="row col-md-12">
								<div class="col-6">
									<strong class="d-inline-block mb-2 text-primary-emphasis">추천 여행지</strong>
									<h2 class="mb-0">낙산사</h2>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
											<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
											<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										</svg>
										강원 양양군 강현면 낙산사로 100
									</div>
									<div class="mb-1 text-body-secondary">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
											<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
										</svg>
										033-672-2447
									</div>
									<p class="card-text mb-auto">바닷가를 마주보는 사찰</p>
								</div>

								<div class="col-6">
									<img src="${pageContext.request.contextPath}/img/tour/tour_7.jpg" class="d-block w-100" alt="...">
								</div>
							</div>
						</div>


						<div class="divs">리조트 근처 유명 여행지 리스트입니다.</div>

					</div>
				</div>

			</div>
		</div>
		<jsp:include page="../bottom.jsp" />
	</div>



	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD14SOb11Ku15oGw3X1gFoRb_YpSA_ca3s"></script>
	<script>
		let map;

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 38.18079,
					lng : 128.6121
				},
				zoom : 11
			});

			const locations = [ {
				place : "속초 해수욕장",
				lat : 38.19078,
				lng : 128.6035
			}, {
				place : "청초수물회",
				lat : 38.19224,
				lng : 128.5906
			}, {
				place : "바다정원",
				lat : 38.23148,
				lng : 128.5826
			}, {
				place : "속초 중앙시장",
				lat : 38.20478,
				lng : 128.5904
			}, {
				place : "설악산",
				lat : 38.12019,
				lng : 128.4654
			}, {
				place : "설악산 케이블카",
				lat : 38.17329,
				lng : 128.4892
			}, {
				place : "낙산사",
				lat : 38.12480,
				lng : 128.6280
			}, ];

			for (let i = 0; i < locations.length; i++) {
				const marker = new google.maps.Marker({
					map : map,
					label : locations[i].place,
					position : new google.maps.LatLng(locations[i].lat,
							locations[i].lng),
				});
			}

			const buttonContainer = document.getElementById('button-container');
			const divs = document.querySelectorAll('.divs');
			console.log(divs);

			for (let i = 0; i < locations.length; i++) {
				const location = locations[i];
				const button = document.createElement('button');
				button.innerText = location.place;
				button.classList.add('btn', 'focus-location');
				button.setAttribute('data-lat', location.lat);
				button.setAttribute('data-lng', location.lng);
				button.setAttribute('data-index', i); // Add index information

				button.addEventListener('click', function() {
					const lat = parseFloat(this.getAttribute('data-lat'));
					const lng = parseFloat(this.getAttribute('data-lng'));

					// 버튼을 누르면 해당 위치 포커스
					map.setCenter({
						lat : lat,
						lng : lng
					});
					map.setZoom(14);

					const index = parseInt(this.getAttribute('data-index'));
					for (let j = 0; j < divs.length; j++) {
						if (j === index) {
							divs[j].style.display = 'block';
						} else {
							divs[j].style.display = 'none';
						}
					}

				});

				buttonContainer.appendChild(button);
			}
		}

		// 지도 초기화 함수 직접 호출
		initMap();
	</script>
</body>
</html>
