<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>공지사항 검색결과</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	
	<div class="container mt-3">
		<h2 align="center">공지사항 검색 결과</h2>
		
		<c:if test="${not empty message}">
			<div class="alert alert-success w-25">${message}</div>
		</c:if>
		<h5>총 ${page.totalElements}건</h5>
			
		<div style="display: flex; justify-content: space-between;">
			<form name="searchForm" action="/notifySearch" method="get" style="flex: 1;">
				<div class="input-group mb-3">
					<input type="text" class="form-control-sm" name="keyword" placeholder="검색어를 입력하세요" aria-label="검색창" aria-describedby="button-addon2" required> 
					<input class="btn btn-primary" type="submit" id="button-addon2" value="검색">
				</div>
			</form>

			<div style="flex: 0;">
				<c:if test="${sessionScope.loginInfo.role == 1}">
					<form action='/New'>
						<input class="btn btn-outline-secondary" type='submit' value='공지사항 작성'>
					</form>
				</c:if>
			</div>
		</div>

		<c:if test="${not empty page.content}">	
			<!-- 검색 결과가 있는 경우 -->
			<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${page.content}" varStatus="loop">
					<tr>
						<td>${board.id}</td>
						<td align="left">
							<a href="/notifyView/${board.id}">${board.title}</a>
						</td>
						<td>${board.name}</td>
						<td>${board.viewcnt}</td>
						<td>${board.date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="notifyList pagination">
		    <ul class="pagination justify-content-center pagination-sm">
		        <!-- 첫 페이지로 가는 링크 -->
		        <c:if test="${page.number > 0}">
		            <li class="page-item"><a class="page-link" href="/notifySearch?page=1&keyword=${param.keyword}">&lt;&lt;</a></li>
		        </c:if>
		
		        <!-- 이전 페이지 링크 -->
		        <c:if test="${page.number > 0}">
		            <li class="page-item"><a class="page-link" href="/notifySearch?page=${page.number - 1}&keyword=${param.keyword}">&lt;</a></li>
		        </c:if>
		
		        <!-- 페이지 번호 순회 -->
		        <c:set var="startPage" value="${page.number - 4}" />
		        <c:set var="endPage" value="${page.number + 5}" />
		
		        <!-- startPage와 endPage가 범위를 벗어나는 경우 조정 -->
		        <c:if test="${startPage lt 0}">
		            <c:set var="startPage" value="0" />
		            <c:set var="endPage" value="9" />
		        </c:if>
		        <c:if test="${endPage ge page.totalPages}">
		            <c:set var="startPage" value="${page.totalPages - 10}" />
		            <c:set var="endPage" value="${page.totalPages - 1}" />
		        </c:if>
		        <c:choose>
		            <c:when test="${startPage < 0}">
		                <c:set var="startPage" value="0" />
		            </c:when>
		            <c:when test="${endPage >= page.totalPages}">
		                <c:set var="endPage" value="${page.totalPages - 1}" />
		            </c:when>
		        </c:choose>
		
		        <!-- 범위 내의 페이지 번호 표시 -->
		        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
		            <c:choose>
		                <c:when test="${page.number eq pageNum}">
		                    <li class="page-item active" aria-current="page"><span class="page-link">${pageNum + 1}</span></li>
		                </c:when>
		                <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="/notifySearch?page=${pageNum + 1}&keyword=${param.keyword}">${pageNum + 1}</a></li>
		                </c:otherwise>
		            </c:choose>
		        </c:forEach>
		
		        <!-- 다음 페이지 링크 -->
		        <c:if test="${page.number < page.totalPages - 1}">
		            <li class="page-item"><a class="page-link" href="/notifySearch?page=${page.number + 2}&keyword=${param.keyword}">&gt;</a></li>
		        </c:if>
		
		        <!-- 마지막 페이지로 가는 링크 -->
		        <c:if test="${page.number < page.totalPages - 1}">
		            <li class="page-item"><a class="page-link" href="/notifySearch?page=${page.totalPages}&keyword=${param.keyword}">&gt;&gt;</a></li>
		        </c:if>
		    </ul>
		</nav>
		</c:if>
			<c:if test="${empty page.content}">
				<!-- 검색 결과가 없는 경우 -->
				<p>검색 결과가 없습니다.</p>
		</c:if>

		<form action='/notifyList'>
			<input type='submit' class="btn btn-outline-secondary" value='전체목록'>
		</form>
	
		<jsp:include page="../bottom.jsp" />
	</div>
</body>
</html>
