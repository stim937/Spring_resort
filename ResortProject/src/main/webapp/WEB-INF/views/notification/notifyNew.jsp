<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 작성</title>
</head>
<body>
	<div>
		<jsp:include page="../top.jsp" />
	</div>
	<div class="container mt-3">>
		<h2 class="mt-5">공지사항 작성</h2>
		<form class="mt-4" method="post" action="/saveNew" onsubmit="return validateForm()">
			<div class="form-group">
				<label for="title">제목</label> 
				<input type="text" class="form-control border-black w-50" id="title" name="title" required s>
			</div>
			<div class="form-group mt-3">
				<label for="content">내용</label>
				<textarea class="form-control border-black w-50" id="content" name="content" rows="5" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary mt-3">저장</button>		
			<button type="button" class="btn btn-secondary mt-3" onclick="goToBoardList()">취소</button>
		</form>
		<jsp:include page="../bottom.jsp" />
	</div>

	<script>
		function validateForm() {
			var titleInput = document.getElementById("title");
			var contentInput = document.getElementById("content");

			if (titleInput.value.trim() === ""
					|| contentInput.value.trim() === "") {
				alert("제목과 내용을 모두 입력해주세요.");
				return false; // 폼 제출을 막습니다.
			}
			return true; // 폼 제출을 허용합니다.
		}

		function goToBoardList() {
			// 전체 목록 페이지로 이동
			window.location.href = "../notifyList";
		}
	</script>
</body>
</html>
