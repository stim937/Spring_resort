<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>선택 내용 보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">
		<c:if test="${not empty message}">
			<div class="alert alert-success w-25">${message}</div>
		</c:if>

		<form class="w-75" id="update_data">
			<table class="table table-bordered mt-3">
				<tr>
					<td>번호</td>
					<td colspan="3">
						<input type="text" class="form-control" name="id" value="${board.id}" readonly>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" class="form-control" name="title" value="${board.title}" readonly>
					</td>
				</tr>
				<tr>
					<td>일자</td>
					<td colspan="3">${board.date}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td colspan="3">${board.viewcnt}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<pre>${board.content}</pre>
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

		<div class="w-75">
			<h2>댓글</h2>
			<table class="table mt-3 w-75">
				<thead>
					<tr>
						<th>작성자</th>
						<th>댓글 내용</th>
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
										<div class="btn-group" role="group" aria-label="Basic example">
											<button onclick="showEditForm(${comment.id})" class="btn btn-primary btn-sm">수정</button>
											<button onclick="deleteComment(${comment.id})" class="btn btn-danger btn-sm">삭제</button>
										</div>
									</c:when>
									<c:when test="${sessionScope.loginInfo.role == 1}">
										<button onclick="deleteComment(${comment.id})" class="btn btn-danger btn-sm">삭제</button>
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
					<form action="/SaveComment/${board.id}" method="post" onsubmit="return validateForm()">
						<div class="form-group">
							<textarea class="form-control" id="content" name="content" required></textarea>
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
	</div>

	<script>
        function deletePost(postId) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = "/board/Delete/" + postId;
            }
        }

        function editPost(postId) {
            location.href = "/board/Edit/" + postId;
        }

        function deleteComment(commentId) {
            if (confirm("댓글을 삭제하시겠습니까?")) {
                location.href = "/DeleteComment/" + commentId + "?rootId=${board.id}";
            }
        }

        function validateForm() {

            var confirmMessage = "댓글을 작성하시겠습니까?";
            if (!confirm(confirmMessage)) {
                return false;
            }

            return true;
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
