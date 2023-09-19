<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${not empty sessionScope.loginInfo}">
		<b><span style="color: white;"><c:out value="${sessionScope.loginInfo.nickname}" /> 님, 환영합니다.</span></b>
		<button type="button" class="btn btn-danger rounded-pill px-3" onclick="logout()">로그아웃</button>
	</c:when>
	<c:otherwise>
		<button type="button" class="btn btn-outline-light me-2" onclick="openLoginForm()">로그인</button>
		<button type="button" class="btn btn-warning">회원가입</button>
	</c:otherwise>
</c:choose>

<script>
	function openLoginForm() {
	    var returnUrl = window.location.href; // 현재 페이지의 URL을 가져옵니다
	    var loginFormUrl = '/loginForm?returnUrl=' + encodeURIComponent(returnUrl);
	    
	    // 새 창 열기
	    var loginWindow = window.open(loginFormUrl, '_blank', 'width=500,height=500');
	    
	    // 새 창이 차단되었을 경우 알림 표시
	    if (!loginWindow || loginWindow.closed || typeof loginWindow.closed === 'undefined') {
	        alert('팝업 창이 차단되었습니다. 팝업 차단을 해제하고 다시 시도하세요');
	    }
	}
	
	function logout() {
		var confirmed = confirm('로그아웃 하시겠습니까?');
        if (confirmed) {
        	window.location.href = '/logout';
        }   
    }
</script>