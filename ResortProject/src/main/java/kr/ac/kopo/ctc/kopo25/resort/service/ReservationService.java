package kr.ac.kopo.ctc.kopo25.resort.service;

import java.sql.Date;

import kr.ac.kopo.ctc.kopo25.resort.dto.ReservationDTO;

public interface ReservationService {
    // 기타 필요한 메서드 선언
	String roomInfo(int room, Date date);
    String[][] getReservationArray();
    
    //예약하기
    void saveNewResv(ReservationDTO resvDTO);
}
