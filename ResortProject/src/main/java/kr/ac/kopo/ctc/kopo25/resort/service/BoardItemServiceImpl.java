package kr.ac.kopo.ctc.kopo25.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardItemRepository;

@Service
public class BoardItemServiceImpl implements BoardItemService {

	@Autowired
	BoardItemRepository boardItemRepository;

	@Override
	@Transactional
	public Page<BoardItem> findAllWithPagination(int curPage, int itemsPerPage) {
		// TODO Auto-generated method stub
		int totalItems = (int) boardItemRepository.count();
		int maxPage = (int) Math.ceil((double) totalItems / itemsPerPage);

		if (curPage > maxPage) {
			curPage = maxPage;
		} else if (curPage < 1) {
			curPage = 1;
		}

		Pageable pageable = PageRequest.of(curPage - 1, itemsPerPage, Sort.by(new Order(Direction.DESC, "id")));
		return boardItemRepository.findAll(pageable);
	}

	// TODO:이거 수정요함
	@Override
	public String viewBoardItem(long id, Model model, HttpSession session) {
		// TODO Auto-generated method stub
		// 세션에 저장된 게시글 ID 리스트 가져오기
		List<Long> viewedPostIds = (List<Long>) session.getAttribute("viewedPostIds");
		if (viewedPostIds == null) {
			viewedPostIds = new ArrayList<>();
		}

		// 해당 글의 ID가 세션에 없을 때만 조회수 증가 처리
		if (!viewedPostIds.contains(id)) {
			Optional<BoardItem> boardItemOptional = boardItemRepository.findById(id);
			if (boardItemOptional.isPresent()) {
				BoardItem boardItem = boardItemOptional.get();

				// 뷰 카운트 증가 및 세션에 해당 글 ID 추가
				boardItem.setViewcnt(boardItem.getViewcnt() + 1);
				boardItemRepository.save(boardItem); // 변경된 뷰 카운트를 데이터베이스에 저장
				viewedPostIds.add(id);
				session.setAttribute("viewedPostIds", viewedPostIds);

				model.addAttribute("board", boardItem);
			} else {
				// 글이 존재하지 않으면 에러 페이지 또는 다른 처리를 하거나 리다이렉트 등을 할 수 있습니다.
				return "error_page";
			}
		} else {
			// 이미 조회한 글일 경우 조회수 증가 없이 조회 페이지로 이동
			Optional<BoardItem> boardItemOptional = boardItemRepository.findById(id);
			if (boardItemOptional.isPresent()) {
				BoardItem boardItem = boardItemOptional.get();
				model.addAttribute("board", boardItem);
			} else {
				// 글이 존재하지 않으면 에러 페이지 또는 다른 처리를 하거나 리다이렉트 등을 할 수 있습니다.
				return "error_page";
			}
		}
		return "/notification/notifyView";
	}

	@Override
	@Transactional
	public void saveNewPost(String title, String content, HttpSession session) {
		BoardItem newPost = new BoardItem();
		newPost.setTitle(title);
		newPost.setContent(content);
		newPost.setDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		
	    // Retrieve loginInfo from session
	    User loginInfo = (User) session.getAttribute("loginInfo");

	    // Check if loginInfo is not null and it has a name
	    if (loginInfo != null && loginInfo.getNickname() != null) {
	        newPost.setName(loginInfo.getNickname());
	    } else {
	        // Handle the case where name is not available
	        newPost.setName("Unknown"); // Set a default name or handle accordingly
	    }
		
		boardItemRepository.save(newPost);
	}

	@Override
	@Transactional
	public void updateBoardItem(long postId, String title, String content) {
		Optional<BoardItem> existingBoardItemOptional = boardItemRepository.findById(postId);
		if (existingBoardItemOptional.isPresent()) {
			// 기존 게시글을 찾은 경우
			BoardItem existingBoardItem = existingBoardItemOptional.get();
			// 새로운 제목과 내용으로 업데이트
			existingBoardItem.setTitle(title);
			existingBoardItem.setContent(content);
			// 기존 게시글 업데이트
			boardItemRepository.save(existingBoardItem);
		} else {
			throw new IllegalArgumentException("해당 아이디의 게시글이 존재하지 않습니다.");
		}
	}

	@Override
	@Transactional
	public void deleteBoardItem(long postId) {
		// TODO Auto-generated method stub
		// 해당 글 삭제
		boardItemRepository.deleteById(postId);
	}

	@Override
	@Transactional
	public Page<BoardItem> searchWithPagination(@RequestParam int curPage, int itemsPerPage, String keyword) {
		int totalItems = (int) boardItemRepository.count();
		int maxPage = (int) Math.ceil((double) totalItems / itemsPerPage);

		if (curPage > maxPage) {
			curPage = maxPage;
		} else if (curPage < 1) {
			curPage = 1;
		}

		Pageable pageable = PageRequest.of(curPage - 1, itemsPerPage, Sort.by(new Order(Direction.DESC, "id")));
		return boardItemRepository.findByTitleContaining(keyword, pageable);
	}


}
