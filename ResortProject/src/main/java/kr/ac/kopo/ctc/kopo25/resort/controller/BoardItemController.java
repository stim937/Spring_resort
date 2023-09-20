package kr.ac.kopo.ctc.kopo25.resort.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardComment;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardItemRepository;
import kr.ac.kopo.ctc.kopo25.resort.service.BoardCommentService;
import kr.ac.kopo.ctc.kopo25.resort.service.BoardItemService;

@Controller
public class BoardItemController {

	@Autowired
	BoardItemService boardItemService;

	@Autowired
	BoardItemRepository boardItemRepository;

	@Autowired
	BoardCommentService boardCommentService;

	// 공지사항 이동
	@GetMapping("/notifyList")
	public String notification() {
		return "redirect:/notifyList/1"; // JSP 페이지 이름
	}

	// 게시판 리스트 보기
	@GetMapping(value = "/notifyList/{curPage}")
	public String listBoardItem(Model model, @PathVariable Integer curPage) {
		int itemsPerPage = 5;
		Page<BoardItem> page = boardItemService.findAllWithPagination(curPage, itemsPerPage);
		model.addAttribute("page", page);
		return "/notification/notifyList";
	}

	// 선택한 한개 글 보기
	@GetMapping(value = "/View/{id}")
	public String viewBoardItem(@PathVariable("id") long id, Model model, HttpSession session) {
		return boardItemService.viewBoardItem(id, model, session);
	}

	// 새 글 입력 폼 보기
	@GetMapping(value = "/New")
	public String showNewForm(Model model) {
		model.addAttribute("board", new BoardItem());
		return "/notification/notifyNew";
	}

	// 새 글 입력하기
	@PostMapping("/saveNew")
	public String saveNewPost(@RequestParam("title") String title, @RequestParam("content") String content,
			RedirectAttributes redirectAttributes) {
		boardItemService.saveNewPost(title, content);
		redirectAttributes.addFlashAttribute("message", "글 입력이 성공적으로 완료되었습니다.");
		return "redirect:/notifyList/1";
	}

	// 글 수정 폼 보기
	@RequestMapping(value = "/Edit/{postId}", method = RequestMethod.GET)
	public String showEditForm(@PathVariable long postId, Model model) {
		Optional<BoardItem> optionalBoardItem = boardItemRepository.findById(postId);
		BoardItem boardItem = optionalBoardItem.orElse(null);
		model.addAttribute("board", boardItem);
		return "Edit"; // 수정 페이지를 보여주는 JSP 페이지 이름
	}

	// 글 수정하기
	@PostMapping("/Edit/{postId}")
	public String handleEditForm(@PathVariable("postId") long postId, @RequestParam("title") String title,
			@RequestParam("content") String content, RedirectAttributes redirectAttributes) {
		boardItemService.updateBoardItem(postId, title, content);
		redirectAttributes.addFlashAttribute("message", "글 수정이 완료되었습니다.");
		return "redirect:/board/View/" + postId;
	}

	// 댓글 수정을 처리하는 메서드
	@PostMapping("/updateComment/{commentId}")
	public String updateComment(@PathVariable Long commentId, @ModelAttribute BoardComment updatedComment,
			@RequestParam Long rootId) {
		// 댓글 업데이트 로직
		boardCommentService.updateComment(commentId, updatedComment.getTitle(), updatedComment.getContent());
		// 수정된 댓글의 상세 페이지로 리다이렉트
		return "redirect:/board/View/" + rootId;
	}

	// 글 삭제 처리
	@RequestMapping(value = "/Delete/{postId}", method = RequestMethod.GET)
	public String deletePost(@PathVariable long postId, RedirectAttributes redirectAttributes) {
		// 해당 글과 관련된 댓글들도 함께 삭제하는 서비스 메서드 호출
		boardItemService.deleteBoardItem(postId);
		redirectAttributes.addFlashAttribute("message", "글 삭제가 완료되었습니다.");
		return "redirect:/board/List/1";
	}

	// 댓글 삭제
	@GetMapping("/DeleteComment/{commentId}")
	public String deleteComment(@PathVariable Long commentId, @RequestParam Long rootId,
			RedirectAttributes redirectAttributes) {
		boardCommentService.deleteBoardComment(commentId);
		redirectAttributes.addFlashAttribute("message", "댓글 삭제가 완료되었습니다.");
		// 원본 글의 아이디에 해당하는 뷰 페이지로 리다이렉트합니다.
		return "redirect:/board/View/" + rootId;
	}

	// 댓글 작성
	@PostMapping("/SaveComment/{boardId}")
	public String saveComment(@RequestParam("title") String title, @RequestParam("content") String content,
			RedirectAttributes redirectAttributes, @PathVariable Long boardId) {
		// 댓글 작성 폼에서 제출된 댓글 정보를 CommentService를 통해 저장합니다.
		boardCommentService.saveNewComment(title, content, boardId);
		redirectAttributes.addFlashAttribute("message", "댓글 입력이 성공적으로 완료되었습니다.");
		// 댓글 저장이 완료되면, 다시 원래의 게시물 페이지로 돌아갑니다.
		return "redirect:/board/View/" + boardId;
	}

	// 제목을 기준으로 검색
	@RequestMapping(value = "/Search", method = RequestMethod.GET)
    public String search(@RequestParam(name = "keyword") String keyword,
                         @RequestParam(name = "page", defaultValue = "1") Integer curPage,
                         Model model) {
        int itemsPerPage = 10;
        Page<BoardItem> searchResultPage = boardItemService.searchWithPagination(curPage, itemsPerPage, keyword);
        // 검색 결과를 모델에 추가하여 JSP 페이지에서 접근할 수 있도록 합니다.
        model.addAttribute("page", searchResultPage);
        // Search.jsp 페이지를 반환합니다.
        return "Search";
    }

}
