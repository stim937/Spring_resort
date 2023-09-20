<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Spring JPA 게시판</title>
<style type="text/css">
.head {
	/* 원하는 스타일 속성들을 추가 */
	font-weight: bold;
	background-color: #f2f2f2;
	/* 기타 원하는 스타일 속성들을 추가 */
}

.tooltip {
	position: absolute;
	z-index: 3;
	background: #E8E8E8;
	border: 1px solid #434343;
	padding: 3px;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: blue;
}

.pagination .current {
	font-weight: bold;
	color: red;
}

li { /*li 태그 스타일 설정*/
	display: inline; /*가로로 진행되는 인라인 형식으로 변경*/
	font-size: 20px; /* 글꼴 크기 */
}
</style>
<script>
	function validateSearchForm() {
		var keywordInput = document.forms["searchForm"]["keyword"].value;
		if (keywordInput.trim() === "") {
			alert("검색어를 입력하세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div style="width: 600px;">
		<div style="float: center;">
			<H3 align="center">
				Spring Data JPA 게시판<br>(검색 결과)
			</H3>
			<h5>총 ${page.totalElements}건</h5>
			<form name="searchForm" action="Search" method="get"
				onsubmit="return validateSearchForm();">
				<input type="text" name="keyword" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
			<c:if test="${not empty page.content}">
				<!-- 검색 결과가 있는 경우 -->
				<table cellspacing="0" width="600" border="1" align="left">
					<tr align="center" class="head">
						<td width=10%>번호</td>
						<td width=55%>제목</td>
						<td width=15%>조회수</td>
						<td width=20%>등록일</td>
					</tr>
					<c:forEach var="board" items="${page.content}" varStatus="loop">
						<tr align="center">
							<td>${board.id}</td>
							<td align="left"><a href="/board/View/${board.id}">${board.title}</a></td>
							<td>${board.viewcnt}</td>
							<td>${board.date}</td>
						</tr>
					</c:forEach>
				</table>

				<div class="pagination">
					<ul>
						<!-- 첫 페이지로 가는 링크 -->
						<c:if test="${page.number > 0}">
							<li><a href="/board/Search?page=1&keyword=${param.keyword}">&lt;&lt;</a></li>
						</c:if>

						<!-- 이전 페이지 링크 -->
						<c:if test="${page.number > 0}">
							<li><a
								href="/board/Search?page=${page.number}&keyword=${param.keyword}">&lt;</a></li>
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
									<li><span class="current">${pageNum + 1}</span></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="/board/Search?page=${pageNum + 1}&keyword=${param.keyword}">${pageNum + 1}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 다음 페이지 링크 -->
						<c:if test="${page.number < page.totalPages - 1}">
							<li><a
								href="/board/Search?page=${page.number + 2}&keyword=${param.keyword}">&gt;</a></li>
						</c:if>

						<!-- 마지막 페이지로 가는 링크 -->
						<c:if test="${page.number < page.totalPages - 1}">
							<li><a
								href="/board/Search?page=${page.totalPages}&keyword=${param.keyword}">&gt;&gt;</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			<c:if test="${empty page.content}">
				<!-- 검색 결과가 없는 경우 -->
				<p>검색 결과가 없습니다.</p>
			</c:if>

			<div style="float: right;">
				<form action='New'>
					<input type='submit' value='신규'>
				</form>
			</div>
			<form action='/board/List/1'>
				<input type='submit' value='전체목록'>
			</form>
		</div>
		<c:if test="${not empty message}">	
			<div class="alert">${message}</div>
		</c:if>
	</div>
</body>
</html>
