<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
	    <h1>예약 페이지</h1>
	    <form action="resvSave" method="POST">
	        <label for="date">날짜:</label>
	        <input type="date" id="date" name="resv_date" required value="${selectedDate}" readonly>
	        <br> <br> <label for="room">룸:</label>
	        
	        <!-- 이 부분에서는 실제 값은 hidden 필드로 넘기고 사용자에게는 표시만 하도록 설정 -->
	        <input type="hidden" id="room" name="room" value="${selectedRoom}">
	        <input type="text" id="roomDisplay" required readonly>
	        
	        <br> <br> <label for="name">성명:</label>
	        <input type="text" id="name" name="name" required value="${sessionScope.loginInfo.nickname}" readonly>
	        <br> <br> <label for="addr">주소:</label>
	        <input type="text" id="addr" name="addr">
	        <br> <br> <label for="telnum">연락처:</label>
	        <input type="text" id="telnum" name="telnum">
	        <br> <br> <label for="in_name">입금자명:</label>
	        <input type="text" id="in_name" name="in_name">
	        <br> <br> <label for="comment">남기실 말:</label><br>
	        <textarea id="comment" name="comment" rows="4" cols="50"></textarea>
	        <br> <br>
	
	        <input type="submit" value="예약하기">
	    </form>
	    <jsp:include page="../bottom.jsp" />
	</div>
	
    <script>
        // selectedRoom 값을 가져와서 해당 값을 설정
        var selectedRoom = "${selectedRoom}";
        var roomDisplay = document.getElementById("roomDisplay");
        
        // selectedRoom 값을 기반으로 적절한 룸 이름을 표시
        switch (selectedRoom) {
            case "1":
                roomDisplay.value = "VIP Room";
                break;
            case "2":
                roomDisplay.value = "Deluxe Room";
                break;
            case "3":
                roomDisplay.value = "Standard Room";
                break;
        }
    </script>
</body>
</html>
