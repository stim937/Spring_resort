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
public class User {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_code")
    private Long id;

    @Column(unique = true)
    private String loginId;
    
    @Column
    private String password;
    
    @Column
    private String nickname;

    @Column(unique = true)
    private String email;
    
    @Column
    private int role;

	public Long getId() {
		return id;
	}

	public String getLoginId() {
		return loginId;
	}

	public String getPassword() {
		return password;
	}

	public String getNickname() {
		return nickname;
	}

	public String getEmail() {
		return email;
	}

	public int getRole() {
		return role;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="user", fetch = FetchType.LAZY)
	private Collection<BoardItem> boardItem;

	public Collection<BoardItem> getBoardItem() {
		return boardItem;
	}

	public void setBoardItem(Collection<BoardItem> boardItem) {
		this.boardItem = boardItem;
	}
}