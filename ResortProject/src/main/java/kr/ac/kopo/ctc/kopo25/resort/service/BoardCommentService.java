package kr.ac.kopo.ctc.kopo25.resort.service;

public interface BoardCommentService {
	void deleteBoardComment(long postId);
	void saveNewComment(String name, String content, long boardId);
	void updateComment(long commentId, String name, String content);
}
