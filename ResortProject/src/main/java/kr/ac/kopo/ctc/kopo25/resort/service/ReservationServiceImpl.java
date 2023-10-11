package kr.ac.kopo.ctc.kopo25.resort.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.domain.ReservationId;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.dto.ReservationDTO;
import kr.ac.kopo.ctc.kopo25.resort.repository.ReservationRepository;

@Service
public class ReservationServiceImpl implements ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    @Override
    public String roomInfo(int room, Date date, HttpSession session) {
        ReservationId reservationId = createReservationId(room, date);
        Optional<Reservation> reservationOptional = reservationRepository.findById(reservationId);

        if (reservationOptional.isPresent()) {
            if (session.getAttribute("loginInfo") != null && ((User) session.getAttribute("loginInfo")).getRole() == 1) {
                Reservation reservation = reservationOptional.get();
                return reservation.getName();
            } else {
                return "예약불가";
            }
        } else {
            return "예약가능";
        }
    }

    @Override
    public String[][] getReservationArray(HttpSession session) {
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
            resv_arr[2][i] = roomInfo(1, date, session);
            resv_arr[3][i] = roomInfo(2, date, session);
            resv_arr[4][i] = roomInfo(3, date, session);

            // 다음 날짜로 이동
            calendar.add(Calendar.DATE, 1);
        }

        return resv_arr;
    }

    @Override
    public Reservation getResvInfo(int room, Date date) {
        ReservationId reservationId = createReservationId(room, date);
        Optional<Reservation> reservationOptional = reservationRepository.findById(reservationId);
        return reservationOptional.orElse(null);
    }

    @Override
    public void saveNewResv(ReservationDTO resvDTO, HttpSession session) {
        Reservation reservation = mapDTOtoEntity(resvDTO, session);
        reservationRepository.save(reservation);
    }

    @Override
    @Transactional
    public void updateReservation(ReservationDTO resvDTO) {
        ReservationId reservationId = createReservationId(resvDTO.getRoom(), resvDTO.getResv_date());
        Optional<Reservation> reservationOptional = reservationRepository.findById(reservationId);

        if (reservationOptional.isPresent()) {
            Reservation existingReservation = reservationOptional.get();

            // 업데이트할 필드들을 가져와서 업데이트한다.
            updateReservationFields(existingReservation, resvDTO);

            // 업데이트된 예약 정보를 저장
            reservationRepository.save(existingReservation);
        } else {
            throw new RuntimeException("예약 정보를 찾을 수 없습니다.");
        }
    }

    @Override
    @Transactional
    public void cancelReservation(int room, Date date) {
        ReservationId reservationId = createReservationId(room, date);
        Optional<Reservation> reservationOptional = reservationRepository.findById(reservationId);

        if (reservationOptional.isPresent()) {
            // 예약 정보가 존재하면 삭제한다.
            reservationRepository.deleteById(reservationId);
        } else {
            throw new RuntimeException("예약 정보를 찾을 수 없습니다.");
        }
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

    private Reservation mapDTOtoEntity(ReservationDTO resvDTO, HttpSession session) {
        Reservation reservation = new Reservation();
        ReservationId reservationId = createReservationId(resvDTO.getRoom(), resvDTO.getResv_date());
        reservation.setId(reservationId);
        updateReservationFields(reservation, resvDTO);

        Date currentDate = new Date(System.currentTimeMillis());
        reservation.setProcessing(1);
        reservation.setWrite_date(currentDate);

        User loginInfo = (User) session.getAttribute("loginInfo");
        reservation.setUser(loginInfo);

        return reservation;
    }

    private void updateReservationFields(Reservation reservation, ReservationDTO resvDTO) {
        reservation.setAddr(resvDTO.getAddr());
        reservation.setComment(resvDTO.getComment());
        reservation.setIn_name(resvDTO.getIn_name());
        reservation.setName(resvDTO.getName());
        reservation.setTelnum(resvDTO.getTelnum());
    }
}

