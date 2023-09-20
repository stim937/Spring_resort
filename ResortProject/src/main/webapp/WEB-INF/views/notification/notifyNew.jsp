<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>새 글 입력</title>
<!-- 필요한 CSS, JavaScript 파일 로드 -->
</head>
<body>
	<h2>새 글 입력</h2>
	<form method="post" action="/saveNew" onsubmit="return validateForm()">
		<label>제목: <input type="text" name="title" id="title" /></label><br /> 
		<label>내용: <textarea name="content" id="content" rows="5" cols="50"></textarea></label><br />
		<input type="submit" value="저장" />
		<button type="button" onclick="goToBoardList()">취소</button>
	</form>

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
			window.location.href = "../board/List/1";
		}
	</script>
</body>
</html>