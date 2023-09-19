package kr.ac.kopo.ctc.kopo25.resort.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.domain.ReservationId;

public interface ReservationRepository extends JpaRepository<Reservation, ReservationId> {
	Optional<Reservation> findById(ReservationId reservationId);
	boolean existsById(ReservationId reservationId);
}
