package kr.ac.kopo.ctc.kopo25.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardComment;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardCommentRepository;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardItemRepository;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentRepository boardCommentRepository;

	@Autowired
	private BoardItemRepository boardItemRepository;
	
	// 특정 게시글의 댓글을 삭제
	@Override
	@Transactional
	public void saveNewComment(String name, String content, long boardId, HttpSession session) {
		// 새로운 댓글 생성
		BoardComment newComment = new BoardComment();
		newComment.setName(name);
		newComment.setContent(content);
		newComment.setDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

		// 해당 원본 글 찾아서 댓글에 연결
		BoardItem boardItem = boardItemRepository.findById(boardId).orElse(null);
		newComment.setBoardItem(boardItem);

		// 현재 로그인한 사용자 정보 가져오기
		User loginInfo = (User) session.getAttribute("loginInfo");
		newComment.setUser(loginInfo);

		// 댓글 저장
		boardCommentRepository.save(newComment);
	}
	
	// 새로운 댓글을 저장
	@Override
	@Transactional
	public void updateComment(long commentId, String name, String content) {
		Optional<BoardComment> existingCommentOptional = boardCommentRepository.findById(commentId);
		if (existingCommentOptional.isPresent()) {
			// 기존 댓글 찾기
			BoardComment existingComment = existingCommentOptional.get();

			// 새로운 정보로 업데이트
			existingComment.setName(name);
			existingComment.setContent(content);

			// 댓글 업데이트
			boardCommentRepository.save(existingComment);
		} else {
			throw new IllegalArgumentException("해당 아이디의 댓글이 존재하지 않습니다.");
		}
	}
	
	// 댓글 삭제
	@Override
	@Transactional
	public void deleteBoardComment(long commentId) {
		boardCommentRepository.deleteById(commentId);
	}
}
