package kr.ac.kopo.ctc.kopo25.resort.service;

public interface BoardCommentService {
	void deleteBoardComment(long postId);
	void saveNewComment(String title, String content, long boardId);
	void updateComment(long commentId, String title, String content);
}
