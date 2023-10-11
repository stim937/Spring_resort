package kr.ac.kopo.ctc.kopo25.resort.service;

import jakarta.servlet.http.HttpSession;

public interface BoardCommentService {

	// 새로운 댓글을 저장
	void saveNewComment(String name, String content, long boardId, HttpSession session);
	
	// 기존 댓글을 수정
	void updateComment(long commentId, String name, String content);
	
	// 특정 게시글의 댓글을 삭제
	void deleteBoardComment(long postId);
}
