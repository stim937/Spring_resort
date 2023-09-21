package kr.ac.kopo.ctc.kopo25.resort.service;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;

public interface BoardItemService {
	// READ
	Page<BoardItem> findAllWithPagination(int curPage, int itemsPerPage);
	Page<BoardItem> searchWithPagination(int curPage, int itemsPerPage, String keyword);
	String viewBoardItem(long id, Model model, HttpSession session);

	// CREATE
	void saveNewPost(String title, String content, HttpSession session);

	// UPDATE
	void updateBoardItem(long postId, String title, String content);

	// DELETE
	
	void deleteBoardItem(long postId);

	
	

}
