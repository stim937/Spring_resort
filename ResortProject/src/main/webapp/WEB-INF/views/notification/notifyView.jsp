<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>공지사항 내용</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<h2>
			공지사항
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-chat-square-text" viewBox="0 0 16 16">
				<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
				<path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z" />
			</svg>

			<c:if test="${sessionScope.loginInfo != null && sessionScope.loginInfo.role == 1}">
				<span class="badge rounded-pill text-bg-warning">관리자 페이지</span>
			</c:if>
		</h2>
		
		<form class="w-75" id="update_data">		
			<c:if test="${not empty message}">
				<div class="alert alert-success">${message}</div>
			</c:if>
			<table class="table table-bordered mt-3">
				<tr>
					<td>번호</td>
					<td>
						<input type="text" class="form-control" name="id" value="${board.id}" readonly>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" class="form-control" name="title" value="${board.title}" readonly>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" class="form-control" name="name" value="${board.name}" readonly>
					</td>
				</tr>
				<tr>
					<td>일자</td>
					<td>${board.date}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${board.viewcnt}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea class="form-control" name="name" rows="7" readonly>${board.content}</textarea>
					</td>
				</tr>
			</table>
			<div class="text-right mt-3">
				<button type="button" class="btn btn-secondary cancel" onclick="location.href='../notifyList/1'">목록</button>
				<c:if test="${sessionScope.loginInfo.role == 1}">
					<button type="button" class="btn btn-primary modify" onclick="editPost(${board.id})">수정</button>
					<button type="button" class="btn btn-danger delete" onclick="deletePost(${board.id})">삭제</button>
				</c:if>
			</div>
		</form>

		<h2>
			댓글
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
 					<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
					<path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z" />
				</svg>
		</h2>
		<table class="table mt-3 w-75">
			<thead>
				<tr>
					<th class="w-25">작성자</th>
					<th class="w-50">댓글 내용</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="comment" items="${board.boardComment}">
					<tr>
						<td>${comment.name}</td>
						<td>
							<pre>${comment.content}</pre>
						</td>
						<td>${comment.date}
							<c:choose>
								<c:when test="${sessionScope.loginInfo.nickname eq comment.name}">
									<!-- Code to execute if the first condition is true -->
									<div class="btn-group ml-3" role="group" aria-label="Basic example">
										<button onclick="showEditForm(${comment.id})" class="btn btn-sm btn-outline-primary">수정</button>
										<button onclick="deleteComment(${comment.id})" class="btn btn-sm btn-outline-danger">삭제</button>
									</div>
								</c:when>
								<c:when test="${sessionScope.loginInfo.role == 1}">
									<button onclick="deleteComment(${comment.id})" class="btn btn-danger btn-sm ml-3">삭제</button>
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr style="display: none;" class="edit-form" id="edit-form-${comment.id}">
						<td colspan="3">
							<form action="/updateComment/${comment.id}" method="post" onsubmit="return confirm('댓글을 수정하시겠습니까?');">
								<input type="hidden" name="rootId" value="${board.id}">
								<div class="form-group">
									<label for="edit-content-${comment.id}">댓글 수정</label>
									<textarea class="form-control" id="edit-content-${comment.id}" name="content">${comment.content}</textarea>
								</div>
								<button type="submit" class="btn btn-primary">수정</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<h2>댓글 작성</h2>
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo}">
				<form action="/SaveComment/${board.id}" method="post">
					<div class="form-group">
						<textarea class="form-control w-75" id="content" name="content" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">작성</button>
				</form>
			</c:when>
			<c:otherwise>
			        댓글을 작성하려면 로그인이 필요합니다.
			    </c:otherwise>
		</c:choose>
		<jsp:include page="../bottom.jsp" />
	</div>


	<script>
        function deletePost(postId) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = "/notifyDelete/" + postId;
            }
        }

        function editPost(postId) {
            location.href = "/notifyEdit/" + postId;
        }

        function deleteComment(commentId) {
            if (confirm("댓글을 삭제하시겠습니까?")) {
                location.href = "/DeleteComment/" + commentId + "?rootId=${board.id}";
            }
        }

        function showEditForm(commentId) {
            var editForms = document.getElementsByClassName('edit-form');
            for (var i = 0; i < editForms.length; i++) {
                editForms[i].style.display = 'none';
            }

            var editForm = document.getElementById('edit-form-' + commentId);
            editForm.style.display = "table-row";
        }
    </script>
</body>
</html>
