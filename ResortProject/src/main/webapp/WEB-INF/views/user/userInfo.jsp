<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보 페이지</title>
</head>
<body class="bg-light">
	<div>
		<jsp:include page="../top.jsp" />
	</div>
<div class="container my-5">
		<h2 class="mb-4">예약정보</h2>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Name</th>
					<th>Comment</th>
					<th>Room</th>
					<th>Room date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty reservations}">
						<tr>
							<td colspan="4" class="text-center"><h3>예약 정보가 없습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="reservation" items="${reservations}">
							<tr>
								<td>${reservation.name}</td>
								<td>
									<pre>${reservation.comment}</pre>
								</td>
								<td>${reservation.id.room}</td>
								<td>${reservation.id.resvDate}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<h2 class="mt-5 mb-4">작성한 공지사항</h2>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>title</th>
					<th>date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${notices}">
					<tr>
						<td>${notice.title}</td>
						<td>${notice.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<h2 class="mt-5 mb-4">공지사항 댓글</h2>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>공지사항 번호</th>
					<th>공지사항 제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>댓글 내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="noticeComment" items="${noticeComments}">
					<tr>
						<td>${noticeComment.boardItem.id}</td>
						<td>${noticeComment.boardItem.title}</td>
						<td>${noticeComment.name}</td>
						<td>${noticeComment.date}</td>
						<td>
							<pre>${noticeComment.content}</pre>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>