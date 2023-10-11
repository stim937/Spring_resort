package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.sql.Date;

import jakarta.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Reservation {

	@EmbeddedId
	private ReservationId id;

	@Column(nullable = false, length = 20)
	private String name;

	@Column(length = 100)
	private String addr;

	@Column(length = 20)
	private String telnum;

	@Column(length = 20)
	private String in_name;

	@Column(columnDefinition = "TEXT")
	private String comment;

	@Column
	private Date write_date;

	@Column(nullable = false)
	private int processing;

	@ManyToOne(optional = false)
	@JoinColumn(name = "user_code")
	private User user;
}
