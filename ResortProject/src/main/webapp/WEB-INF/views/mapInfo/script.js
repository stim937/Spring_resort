function initMap() {
  const map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 37.7749, lng: -122.4194 },  // 초기 지도 중심 좌표 (San Francisco, CA)
    zoom: 12  // 초기 줌 레벨
  });

  // 마커 추가
  const marker = new google.maps.Marker({
    position: { lat: 37.7749, lng: -122.4194 },  // 마커 위치 (San Francisco, CA)
    map: map,
    title: 'San Francisco'
  });
}

// 지도 초기화 함수 호출
google.maps.event.addDomListener(window, 'load', initMap);
