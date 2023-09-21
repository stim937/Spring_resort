package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.util.Collection;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class BoardItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	long id;

	@Column
	String title;

	@Column
	String date;

	@Column(columnDefinition = "TEXT")
	String content;
	
	@Column
	String name;
	
	@Column
	int viewcnt;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="boardItem", fetch = FetchType.LAZY)
	private Collection<BoardComment> boardComment;


	public Collection<BoardComment> getBoardComment() {
		return boardComment;
	}

	public void setBoardComment(Collection<BoardComment> boardComment) {
		this.boardComment = boardComment;
	}
	
}
