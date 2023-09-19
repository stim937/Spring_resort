package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

public class ReservationId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Date resvDate;
	private int room;

	public ReservationId() {
	}

	public ReservationId(Date date, int room) {
		this.resvDate = date;
		this.room = room;
	}

	@Override
	public int hashCode() {
		return Objects.hash(resvDate, room);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		ReservationId that = (ReservationId) obj;
		return Objects.equals(resvDate, that.resvDate) && Objects.equals(room, that.room);
	}
}
