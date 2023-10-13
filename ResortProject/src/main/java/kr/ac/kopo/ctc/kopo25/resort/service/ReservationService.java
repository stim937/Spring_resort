package kr.ac.kopo.ctc.kopo25.resort.service;

import java.sql.Date;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.dto.ReservationDTO;

public interface ReservationService {
	// 한달 예약 정보 조회
	String[][] getReservationArray(HttpSession session);

	// 선택 예약정보 확인
	Reservation getResvInfo(int room, Date date);

	// 예약하기
	void saveNewResv(ReservationDTO resvDTO, HttpSession session);

	// 예약 수정
	void updateReservation(ReservationDTO resvDTO);

	// 예약 취소
	void cancelReservation(int room, Date date);
}
