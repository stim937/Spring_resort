package kr.ac.kopo.ctc.kopo25.resort.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.repository.BoardItemRepository;

@Service
public class BoardItemServiceImpl implements BoardItemService {

    @Autowired
    private BoardItemRepository boardItemRepository;

    // 페이지네이션을 통한 모든 게시글 조회
    @Override
    @Transactional
    public Page<BoardItem> findAllWithPagination(int curPage, int itemsPerPage) {
        int totalItems = (int) boardItemRepository.count();
        int maxPage = (int) Math.ceil((double) totalItems / itemsPerPage);

        if (curPage > maxPage) {
            curPage = maxPage;
        } else if (curPage < 1) {
            curPage = 1;
        }

        // 페이지네이션 정보와 정렬 조건 설정
        Pageable pageable = PageRequest.of(curPage - 1, itemsPerPage, Sort.by(new Order(Direction.DESC, "id")));
        return boardItemRepository.findAll(pageable);
    }

    // 게시글 상세 정보 조회 및 조회수 증가 처리
    @Override
    @Transactional
    public String viewBoardItem(long id, Model model, HttpSession session) {
        Optional<BoardItem> boardItemOptional = boardItemRepository.findById(id);

        if (boardItemOptional.isPresent()) {
            BoardItem boardItem = boardItemOptional.get();
            int viewCount = boardItem.getViewcnt();

            // 현재 로그인한 사용자 정보 가져오기
            User loginInfo = (User) session.getAttribute("loginInfo");
            List<Long> viewedPostIds = (List<Long>) session.getAttribute("viewedPostIds");

            // 현재 사용자가 해당 게시글을 아직 조회하지 않았을 경우 조회수 증가 및 세션에 추가
            if (loginInfo != null && viewedPostIds != null && !viewedPostIds.contains(id)) {
                boardItem.setViewcnt(viewCount + 1);
                boardItemRepository.save(boardItem);

                // 조회한 게시글 ID를 세션에 추가하여 중복 조회 방지
                viewedPostIds.add(id);
                session.setAttribute("viewedPostIds", viewedPostIds);
            }

            model.addAttribute("board", boardItem);
            return "/notification/notifyView";
        } else {
            // 해당 게시글이 존재하지 않을 경우 에러 페이지 반환
            return "error_page";
        }
    }

    // 새로운 게시글 저장
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
            newPost.setUser(loginInfo);
        } else {
            // Handle the case where name is not available
            newPost.setName("Unknown"); // Set a default name or handle accordingly
        }

        boardItemRepository.save(newPost);
    }

    // 게시글 업데이트
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

    // 게시글 삭제
    @Override
    @Transactional
    public void deleteBoardItem(long postId) {
        // TODO: 해당 글 삭제
        boardItemRepository.deleteById(postId);
    }

    // 키워드 검색을 통한 페이지네이션
    @Override
    @Transactional
    public Page<BoardItem> searchWithPagination(int curPage, int itemsPerPage, String keyword) {
        int totalItems = (int) boardItemRepository.count();
        int maxPage = (int) Math.ceil((double) totalItems / itemsPerPage);

        if (curPage > maxPage) {
            curPage = maxPage;
        } else if (curPage < 1) {
            curPage = 1;
        }

        // 페이지네이션 정보와 정렬 조건 설정
        Pageable pageable = PageRequest.of(curPage - 1, itemsPerPage, Sort.by(new Order(Direction.DESC, "id")));
        return boardItemRepository.findByTitleContaining(keyword, pageable);
    }
}

