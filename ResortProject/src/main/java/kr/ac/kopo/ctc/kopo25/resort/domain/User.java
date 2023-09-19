package kr.ac.kopo.ctc.kopo25.resort.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {

    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long id;

    @Column
    private String loginId;
    
    @Column
    private String password;
    
    @Column
    private String nickname;

    @Column
    private UserRole role;

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

	public UserRole getRole() {
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

	public void setRole(UserRole role) {
		this.role = role;
	}
    
    
}