<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Google Maps 마커 추가 예제</title>
<style>
#map {
	height: 400px;
	width: 100%;
}
</style>
</head>
<body>
	<div id="map"></div>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvXOlzUgH_iEujxraixXW1NnNZo8WEyPU"></script>
	<script>
		function initMap() {
			const map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.7749,
					lng : -122.4194
				}, // 초기 지도 중심 좌표 (San Francisco, CA)
				zoom : 12
			// 초기 줌 레벨
			});

			// 마커 추가
			const marker = new google.maps.Marker({
				position : {
					lat : 37.7749,
					lng : -122.4194
				}, // 마커 위치 (San Francisco, CA)
				map : map,
				title : 'San Francisco'
			});
		}

		// 지도 초기화 함수 호출
		google.maps.event.addDomListener(window, 'load', initMap);
	</script>
</body>
</html>