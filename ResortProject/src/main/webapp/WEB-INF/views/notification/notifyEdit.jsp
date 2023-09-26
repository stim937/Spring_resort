<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 수정</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	
	<div class="container">
		<h2>공지사항 수정</h2>
		<form class="mt-3" action="/pushEdit" method="post" onsubmit="return validateForm()">
			<div class="form-group">
				<label for="postId">글 번호</label> 
				<input type="text" class="form-control border-black w-50" id="boardId" name="boardId" value="${board.id}" readonly>
			</div>
			
			<div class="form-group mt-3">
				<label for="title">제목</label> 
				<input type="text" class="form-control border-black w-50" id="title" name="title" value="${board.title}" required>
			</div>
			
			<div class="form-group mt-3">
				<label for="content">내용</label>
				<textarea class="form-control border-black w-50" id="content" name="content" rows="5" required>${board.content}</textarea>
			</div>
			
			<div class="text-right mt-3">
				<button type="submit" class="btn btn-primary modify">저장</button>		
				<button type="button" class="btn btn-secondary cancel" onclick="location.href='/notifyView/${board.id}'">취소</button>			
			</div>
		</form>
		<jsp:include page="../bottom.jsp" />
	</div>
	
	<script>
		function validateForm() {
			var titleInput = document.getElementById('title').value.trim();
			var contentInput = document.getElementById('content').value.trim();

			// 이전에 저장된 글과 수정된 글이 모두 동일한지 비교
			var prevTitle = "${board.title}";
			var prevContent = "${board.content}";

			if (titleInput === prevTitle && contentInput === prevContent) {
				alert('수정된 내용이 없습니다. 새로운 내용을 입력해주세요.');
				return false; // 폼 제출 막음
			} else if (titleInput === '') {
				alert('제목을 입력해주세요.');
				return false; // 폼 제출 막음
			} else if (contentInput === '') {
				alert('내용을 입력해주세요.');
				return false; // 폼 제출 막음
			}

			// 모든 조건을 만족하면 폼 제출 허용
			return true;
		}
	</script>
</body>
</html>
