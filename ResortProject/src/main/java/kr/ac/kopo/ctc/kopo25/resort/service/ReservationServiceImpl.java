package kr.ac.kopo.ctc.kopo25.resort.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.domain.ReservationId;
import kr.ac.kopo.ctc.kopo25.resort.dto.ReservationDTO;
import kr.ac.kopo.ctc.kopo25.resort.repository.ReservationRepository;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationRepository reservationRepository;

	@Override
	public String roomInfo(int room, Date date) {
		ReservationId reservationId = createReservationId(room, date);
		Optional<Reservation> reservationOptional = reservationRepository.findById(reservationId);

		if (reservationOptional.isPresent()) {
//			Reservation reservation = reservationOptional.get();
//			return reservation.getName();
			return "예약완료";
		} else {
			return "예약가능";
		}
	}

	@Override
	public String[][] getReservationArray() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[][] resv_arr = new String[5][30];

		for (int i = 0; i < 30; i++) {
			// 일자
			Date date = new Date(calendar.getTimeInMillis());
			resv_arr[0][i] = sdf.format(date);

			// 요일
			resv_arr[1][i] = getDayOfWeek(calendar.get(Calendar.DAY_OF_WEEK));

			// Room1 예약 정보
			resv_arr[2][i] = roomInfo(1, date);
			resv_arr[3][i] = roomInfo(2, date);
			resv_arr[4][i] = roomInfo(3, date);

			// 다음 날짜로 이동
			calendar.add(Calendar.DATE, 1);
		}

		return resv_arr;
	}

	private ReservationId createReservationId(int room, Date date) {
		return new ReservationId(date, room);
	}

	private String getDayOfWeek(int dayOfWeek) {
		switch (dayOfWeek) {
		case Calendar.SUNDAY:
			return "일요일";
		case Calendar.MONDAY:
			return "월요일";
		case Calendar.TUESDAY:
			return "화요일";
		case Calendar.WEDNESDAY:
			return "수요일";
		case Calendar.THURSDAY:
			return "목요일";
		case Calendar.FRIDAY:
			return "금요일";
		case Calendar.SATURDAY:
			return "토요일";
		default:
			return "";
		}
	}

	@Override
	public void saveNewResv(ReservationDTO resvDTO) {
		// TODO Auto-generated method stub
		// DTO에서 엔티티로 매핑하거나 직접 엔티티를 생성하여 저장 로직을 작성합니다.
		Reservation reservation = mapDTOtoEntity(resvDTO);

		// 예약 정보를 데이터베이스에 저장합니다.
		reservationRepository.save(reservation);

	}

	private Reservation mapDTOtoEntity(ReservationDTO resvDTO) {
		Reservation reservation = new Reservation();
		ReservationId reservationId = createReservationId(resvDTO.getRoom(), resvDTO.getResv_date());
		reservation.setId(reservationId);
		reservation.setAddr(resvDTO.getAddr());
		reservation.setComment(resvDTO.getComment());
		reservation.setIn_name(resvDTO.getIn_name());
		reservation.setName(resvDTO.getName());
		reservation.setTelnum(resvDTO.getTelnum());

		Date currentDate = new Date(System.currentTimeMillis());
		reservation.setProcessing(1);
		reservation.setWrite_date(currentDate);
		return reservation;
	}
}
