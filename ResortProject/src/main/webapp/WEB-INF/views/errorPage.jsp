<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>
	<div>
		<jsp:include page="./top.jsp" />
	</div>
	<div class="container mt-3">
		<c:if test="${not empty message}">
			<div>${message}</div>
		</c:if>
		<jsp:include page="./bottom.jsp" />
	</div>
</body>
</html>