package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.util.Collection;

import jakarta.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data // Lombok annotation to generate getters, setters, and toString method
@NoArgsConstructor // Lombok annotation to generate a no-args constructor
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

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user", fetch = FetchType.LAZY)
	private Collection<BoardItem> boardItem;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user", fetch = FetchType.LAZY)
	private Collection<Reservation> reservation;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user", fetch = FetchType.LAZY)
	private Collection<BoardComment> boardComment;
}
