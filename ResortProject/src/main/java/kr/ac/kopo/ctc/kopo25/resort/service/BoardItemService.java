package kr.ac.kopo.ctc.kopo25.resort.service;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;

public interface BoardItemService {
	// 페이지네이션을 통한 모든 게시글 조회
	Page<BoardItem> findAllWithPagination(int curPage, int itemsPerPage);

	// 키워드 검색을 통한 페이지네이션
	Page<BoardItem> searchWithPagination(int curPage, int itemsPerPage, String keyword);

	// 게시글 상세 정보 조회 및 조회수 증가 처리
	String viewBoardItem(long id, Model model, HttpSession session);

	// 새로운 게시글 저장
	void saveNewPost(String title, String content, HttpSession session);

	// 게시글 업데이트
	void updateBoardItem(long postId, String title, String content);

	// 게시글 삭제
	void deleteBoardItem(long postId);
}