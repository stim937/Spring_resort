<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리조트 위치안내</title>
<style>
#map {
	height: 500px;
	width: 100%;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<div id="map"></div>
				</div>
				<div class="col-md-6">
					<h2 class="display-5 fw-bolder">오시는 길</h2>
					<p class="lead">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
							<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z" />
							<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						</svg>
						지번 주소 : 강원특별자치도 속초시 대포동 995
					</p>
					<p class="lead">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
								<path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" />
							</svg>
						도로명 주소 : 강원특별자치도 속초시 대포항길 186
					</p>
					<p class="lead">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
							<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
						</svg>
						033-123-4567
					</p>
					<div class="btn-group d-flex" role="group" aria-label="Basic example">
						<button onclick="showCarInfo()" class="btn btn-sm btn-outline-info">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-car-front" viewBox="0 0 16 16">
								<path d="M4 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm10 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM4.862 4.276 3.906 6.19a.51.51 0 0 0 .497.731c.91-.073 2.35-.17 3.597-.17 1.247 0 2.688.097 3.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 10.691 4H5.309a.5.5 0 0 0-.447.276Z" />
								<path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM4.82 3a1.5 1.5 0 0 0-1.379.91l-.792 1.847a1.8 1.8 0 0 1-.853.904.807.807 0 0 0-.43.564L1.03 8.904a1.5 1.5 0 0 0-.03.294v.413c0 .796.62 1.448 1.408 1.484 1.555.07 3.786.155 5.592.155 1.806 0 4.037-.084 5.592-.155A1.479 1.479 0 0 0 15 9.611v-.413c0-.099-.01-.197-.03-.294l-.335-1.68a.807.807 0 0 0-.43-.563 1.807 1.807 0 0 1-.853-.904l-.792-1.848A1.5 1.5 0 0 0 11.18 3H4.82Z" />
							</svg>
							자가용
						</button>
						<button onclick="showPublicTransportInfo()" class="btn btn-sm btn-outline-primary">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-bus-front" viewBox="0 0 16 16">
								<path d="M5 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm8 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-6-1a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2H7Zm1-6c-1.876 0-3.426.109-4.552.226A.5.5 0 0 0 3 4.723v3.554a.5.5 0 0 0 .448.497C4.574 8.891 6.124 9 8 9c1.876 0 3.426-.109 4.552-.226A.5.5 0 0 0 13 8.277V4.723a.5.5 0 0 0-.448-.497A44.303 44.303 0 0 0 8 4Zm0-1c-1.837 0-3.353.107-4.448.22a.5.5 0 1 1-.104-.994A44.304 44.304 0 0 1 8 2c1.876 0 3.426.109 4.552.226a.5.5 0 1 1-.104.994A43.306 43.306 0 0 0 8 3Z" />
								<path d="M15 8a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1V2.64c0-1.188-.845-2.232-2.064-2.372A43.61 43.61 0 0 0 8 0C5.9 0 4.208.136 3.064.268 1.845.408 1 1.452 1 2.64V4a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v3.5c0 .818.393 1.544 1 2v2a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5V14h6v1.5a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-2c.607-.456 1-1.182 1-2V8ZM8 1c2.056 0 3.71.134 4.822.261.676.078 1.178.66 1.178 1.379v8.86a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 11.5V2.64c0-.72.502-1.301 1.178-1.379A42.611 42.611 0 0 1 8 1Z" />
							</svg>
							대중교통
						</button>
					</div>

					<div id="carInfo" class="info-container mt-3 mb-3" style="display: none;">
						<table class="table w-100 text-center">
							<thead class="table-light">
								<tr>
									<th class="w-25">출발지</th>
									<th>이동경로 안내</th>
								</tr>
							</thead>
							<tr>
								<td>서울</td>
								<td>
									서울 - 강일 IC (덕소삼패 IC) - 서울양양고속도로<br /> - 동해고속도로(양양 JC) - 속초 IC – EZ 리조트
								</td>
							</tr>
							<tr>
								<td>부산</td>
								<td>
									부산 – 경부고속도로(구서 IC) – 동해고속도로(근덕 IC)<br /> – 속초 IC – EZ 리조트
								</td>
							</tr>
							<tr>
								<td>광주</td>
								<td>
									광주 - 호남고속도로 - 경부고속도로(회덕 JC)<br /> - 중부고속도로(남이 JC) - 영동고속도로(호법 JC)<br /> - 중앙고속도로(만종 JC) – 서울양양고속도로(춘천 JC)<br /> – 동해고속도로(양양 JC) – 속초 IC - EZ 리조트
								</td>
							</tr>
							<tr>
								<td>대전</td>
								<td>
									대전 - 경부고속도로(회덕 IC) - 중부고속도로(남이 JC)<br /> – 영동고속도로(호법 JC) - 중앙고속도로(만종 JC)<br /> – 홍천 IC – EZ 리조트
								</td>
							</tr>
						</table>
					</div>

					<div id="publicTransportInfo" class="info-container mt-3 mb-3" style="display: none;">
						<h5>고속버스</h5>
						<table class="table w-100 text-center">
							<thead class="table-light">
								<tr>
									<th>출발지</th>
									<th>첫차</th>
									<th>막차</th>
									<th>배차시간</th>
									<th>소요시간</th>
								</tr>
							</thead>
							<tr>
								<td>강남 -> 속초</td>
								<td>6:00</td>
								<td>23:30</td>
								<td>30분</td>
								<td>2시간 30분</td>
							</tr>
							<tr>
								<td>속초 -> 동서울</td>
								<td>6:50</td>
								<td>19:50</td>
								<td>1시간</td>
								<td>2시간 50분</td>
							</tr>
						</table>
						<h5>문의 및 예약확인</h5>
						<table class="table w-100 text-center">
							<thead class="table-light">
								<tr>
									<th>장소</th>
									<th>전화번호</th>
									<th>홈페이지</th>
								</tr>
							</thead>
							<tr>
								<td>속초 고속터미널</td>
								<td>033) 631-3181</td>
								<td>
									<a href="http://www.sokcho-t.co.kr/">홈페이지</a>
								</td>
							</tr>
							<!-- Add more rows for other places -->
						</table>
					</div>

					<ul class="list-unstyled mt-3">
						<li><span class="text-muted">※</span> 소요 시간은 교통 상황에 따라 다를 수 있습니다.</li>
						<li><span class="text-muted">※</span> 예약 또는 기타 자세한 사항은 전화, 또는 홈페이지를 통해 확인하시기 바랍니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="../bottom.jsp" />
	</div>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD14SOb11Ku15oGw3X1gFoRb_YpSA_ca3s"></script>
	<script>
		let marker;
		let map;
		let infowindow;

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 38.18079,
					lng : 128.6121
				},
				zoom : 13
			});

			marker = new google.maps.Marker({
				position : {
					lat : 38.18079,
					lng : 128.6121
				},
				map : map,
				title : 'EZ 리조트'

			});

			// 마커에 마우스 오버 이벤트 추가
			marker.addListener('mouseover', function() {
				infowindow = new google.maps.InfoWindow({
					content : 'EZ 리조트'
				});
				infowindow.open(map, marker);
			});

			// 마커에 마우스 아웃 이벤트 추가
			marker.addListener('mouseout', function() {
				infowindow.close();
			});

			if (marker) {
				marker.addListener('click', function() {
					//중심 위치를 클릭된 마커의 위치로 변경
					map.setCenter(this.getPosition());
					//마커 클릭 시의 줌 변화
					map.setZoom(15);
				});
			}
		}

		function showCarInfo() {
			document.getElementById("carInfo").style.display = "block";
			document.getElementById("publicTransportInfo").style.display = "none";
		}

		// Function to show public transport information and hide car information
		function showPublicTransportInfo() {
			document.getElementById("carInfo").style.display = "none";
			document.getElementById("publicTransportInfo").style.display = "block";
		}

		// 지도 초기화 함수 직접 호출
		initMap();
	</script>
</body>
</html>
