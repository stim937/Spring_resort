package kr.ac.kopo.ctc.kopo25.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardComment;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardCommentRepository;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardItemRepository;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	BoardCommentRepository boardCommentRepository;
	
	@Autowired
	BoardItemRepository boardItemRepository;	
	
	@Override
	public void deleteBoardComment(long postId) {
		// TODO Auto-generated method stub
		boardCommentRepository.deleteById(postId);
	}
	
	@Override
	@Transactional
	public void saveNewComment(String name, String content, long boardId) {
	    BoardComment newComment = new BoardComment();
	    newComment.setName(name);
	    newComment.setContent(content);
	    newComment.setDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
	    
	    // 댓글이 어떤 원본 글에 속하는지 설정해주기 위해 boardItem 필드에 해당 원본 글을 설정합니다.    
	    BoardItem boardItem = boardItemRepository.findById(boardId).orElse(null);
	    newComment.setBoardItem(boardItem);

	    boardCommentRepository.save(newComment);
	}
	
	@Override
	@Transactional
	public void updateComment(long commentId, String name, String content) {
	    Optional<BoardComment> existingCommentOptional = boardCommentRepository.findById(commentId);
	    if (existingCommentOptional.isPresent()) {
	        // 기존 댓글을 찾은 경우
	        BoardComment existingComment = existingCommentOptional.get();
	        
	        // 새로운 제목과 내용으로 업데이트
	        existingComment.setName(name);
	        existingComment.setContent(content);
	       
	        // 기존 댓글 업데이트
	        boardCommentRepository.save(existingComment);
	    } else {
	        throw new IllegalArgumentException("해당 아이디의 댓글이 존재하지 않습니다.");
	    }
	}
	
	
	
}
