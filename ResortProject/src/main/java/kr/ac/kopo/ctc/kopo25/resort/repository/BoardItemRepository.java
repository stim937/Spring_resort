package kr.ac.kopo.ctc.kopo25.resort.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import kr.ac.kopo.ctc.kopo25.resort.domain.BoardItem;

public interface BoardItemRepository extends JpaRepository<BoardItem, Long>{
	Page<BoardItem> findByTitleContaining(String titleKeyword, Pageable pageable);	
}

