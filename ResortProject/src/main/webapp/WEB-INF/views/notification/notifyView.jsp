<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>선택 내용 보기</title>
<style>
.headTD {
	/* 원하는 스타일 속성들을 추가 */
	font-weight: bold;
	background-color: #f2f2f2;
	/* 기타 원하는 스타일 속성들을 추가 */
}

.alert {
	color: #721c24; /* Red text color */
	font-weight: bold; /* Set the text to bold */
}

.cancel 
{
	padding: 5px 10px; /* Add some padding for better appearance */
	border-radius: 3px; /* Round the corners */
	cursor: pointer;
}

.delete 
{
	color: #fff; /* Text color (white) */
	background-color: #dc3545; /* Red background color */
	padding: 5px 10px; /* Add some padding for better appearance */
	border-radius: 3px; /* Round the corners */
	cursor: pointer;
}

.modify
{
	padding: 5px 10px; /* Add some padding for better appearance */
	border-radius: 3px; /* Round the corners */
	cursor: pointer;
}

.showCommentEdit{
	background-color: transparent; /* 배경 투명하게 설정 */
	font-size: 20px; /* 아이콘 크기 조정 */
	cursor: pointer;
	padding: 2px 7px; /* 아이콘 주위 여백 조정 */
	font-weight: bold;
	border-radius: 3px;
}

input[type="text"], textarea {
	
	padding: 6px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	
	vertical-align: top; /* 텍스트 영역을 상단에 맞추기 */	
}

/* 텍스트 영역에 세로 스크롤 표시 */
textarea {
	width: 200px;
	height: 30px;
	resize: vertical; /* 텍스트 영역의 세로 크기 조절을 허용 */
	overflow-y: auto;
}

.pre-container {
	padding: 8px; /* 원하는 패딩 값 설정 */
	border: 1px solid #ccc; /* 선택적으로 테두리 추가 */
	font-size: 13px; /* 원하는 글자 크기 설정 */
    line-height: 1.2; /* 원하는 줄 간격 설정 */
}
</style>
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
			// 삭제 버튼 클릭 시 해당 댓글이 속한 원본 글의 아이디를 파라미터로 전달하여 삭제합니다.
			location.href = "/board/DeleteComment/" + commentId + "?rootId=${board.id}";
		}
	}
	
	function validateForm() {
        // 제목과 내용을 가져옵니다.
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;

        // 제목과 내용이 비어있는지 검사합니다.
        if (title.trim() === "" || content.trim() === "") {
            alert("댓글 제목과 내용을 모두 입력해주세요.");
            return false; // 폼 제출을 막습니다.
        }

     	// 댓글 제목과 내용이 모두 입력되었을 경우 사용자에게 확인 메시지를 보여줍니다.
        var confirmMessage = "댓글을 작성하시겠습니까?";
        if (!confirm(confirmMessage)) {
            return false; // 폼 제출을 막습니다.
        }
        
        // 폼이 제대로 작성되었으면 true를 반환하여 폼을 제출합니다.
        return true;
    }
	
	function showEditForm(commentId) {
		// 모든 기존 수정 폼을 숨깁니다 (있는 경우)
		var editForms = document.getElementsByClassName('edit-form');
		for (var i = 0; i < editForms.length; i++) {
			editForms[i].style.display = 'none';
		}

		// 선택한 댓글에 대한 수정 폼을 보여줍니다
		var editForm = document.getElementById('edit-form-' + commentId);
		editForm.style.display = "table-row";
	}
    </script>
<%-- import 및 변수 설정 부분은 삭제 --%>
</head>
<body>
	<h2>선택 내용 보기</h2>
	<c:if test="${not empty message}">
		<div class="alert">${message}</div>
	</c:if>
	<form id="update_data">
		<table cellspacing="0" width="800" border="1">
			<tr>
				<td class="headTD">번호</td>
				<td colspan="3"><input type="text" name="id" value="${board.id}" readonly></td>
			</tr>
			<tr>
				<td class="headTD">제목</td>
				<td colspan="3"><input type="text" name="title" value="${board.title}" style="width: 500px;" readonly></td>
			</tr>
			<tr>
				<td class="headTD">일자</td>
				<td colspan="3">${board.date}</td>
			</tr>
			<tr>
				<td class="headTD">조회수</td>
				<td colspan="3">${board.viewcnt}</td>
			</tr>
			<tr>
				<td class="headTD">내용</td>
				<td colspan="3">
					<div class="pre-container">
						<pre>${board.content}</pre>
					</div>
				</td>
			</tr>
			<%-- 기타 필요한 정보들을 출력하는 부분들은 삭제 --%>
		</table>
		<table cellspacing="0" width="800" border="0">
			<tr>
				<td style="text-align: right;">
					<input class="cancel" type="button" value="목록" onclick="location.href='../List/1'">
					<input class="modify" type="button" value="수정" onclick="editPost(${board.id})"> 
					<input class="delete" type="button" value="삭제" onclick="deletePost(${board.id})">
				</td>
			</tr>
		</table>
	</form>

	<h2>댓글</h2>
	<table cellspacing="0" width="800" border="1">
		<thead>
			<tr class="headTD">
				<th width="25%">댓글 제목</th>
				<th>댓글 내용</th>
				<th width="25%">댓글 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="comment" items="${board.boardComment}">
				<tr>
					<td>${comment.title}</td>
					<td><pre>${comment.content}</pre></td>
					<td>${comment.date}						
						<button onclick="showEditForm(${comment.id})" class="showCommentEdit">&#x21E9;</button>	
						<button onclick="deleteComment(${comment.id})" class="delete">삭제</button>				
					</td>
				</tr>
				<tr style="display: none;" class="edit-form" id="edit-form-${comment.id}">
					<td colspan="3">
						<form action="/board/updateComment/${comment.id}" method="post" onsubmit="return confirm('댓글을 수정하시겠습니까?');">
							<input type="hidden" name="rootId" value="${board.id}"> 
							<label for="edit-title-${comment.id}">댓글 제목:</label> 
							<input type="text" id="edit-title-${comment.id}" name="title" value="${comment.title}"> 
							<label for="edit-content-${comment.id}">댓글 내용:</label>
							<textarea id="edit-content-${comment.id}" name="content">${comment.content}</textarea>
							<input type="submit" value="수정">							
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<h2>댓글 작성</h2>
	<form action="/board/SaveComment/${board.id}" method="post" onsubmit="return validateForm()">
		<label for="title">댓글 제목:</label> 
		<input type="text" id="title" name="title"> 
		<label for="content">댓글 내용:</label>
		<textarea id="content" name="content"></textarea>
		<input type="submit" value="작성">
	</form>

</body>
</html>
