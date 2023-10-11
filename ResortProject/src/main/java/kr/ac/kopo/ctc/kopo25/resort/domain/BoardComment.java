package kr.ac.kopo.ctc.kopo25.resort.domain;

import jakarta.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class BoardComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String name;
	private String date;
	private String content;

	@ManyToOne(optional = false)
	@JoinColumn(name = "root_id")
	private BoardItem boardItem;

	@ManyToOne(optional = false)
	@JoinColumn(name = "user_code")
	private User user;
}