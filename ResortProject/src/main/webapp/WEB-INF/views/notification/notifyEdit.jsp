<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글 수정</title>
<style>
.head {
	/* 원하는 스타일 속성들을 추가 */
	font-weight: bold;
	background-color: #f2f2f2;
	/* 기타 원하는 스타일 속성들을 추가 */
}
</style>
</head>
<body>
	<h2>글 수정</h2>
	<form action="/notifyEdit/${board.id}" method="post" onsubmit="return validateForm()">
		<table cellspacing="0" width="550" border="1">
			<tr>
				<td class="head">제목</td>
				<td colspan="3">
					<input type="text" name="title" id="title" value="${board.title}" style="width: 502px;">
				</td>
			</tr>
			<tr>
				<td class="head">내용</td>
				<td colspan="3">
					<textarea name="content" id="content" rows="10" cols="68">${board.content}</textarea>
				</td>
			</tr>
			<%-- 기타 필요한 정보들을 출력하는 부분들은 삭제 --%>
		</table>
		<table cellspacing="0" width="550" border="0">
			<tr>
				<td style="text-align: right;">
					<input type="submit" value="저장"> <input type="button" value="취소" onclick="location.href='/board/View/${board.id}'">
				</td>
			</tr>
		</table>
	</form>
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
