package kr.ac.kopo.ctc.kopo25.resort.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.dto.ReservationDTO;
import kr.ac.kopo.ctc.kopo25.resort.service.ReservationService;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;

	@GetMapping("/resvInfo")
	public String showReservationPage(Model model, @RequestParam(value = "message", required = false) String message,
			HttpSession session) {
		// 서비스를 통해 데이터를 가져오고 JSP에 전달
		String[][] resv_arr = reservationService.getReservationArray(session); // 예약 정보 배열을 가져오는 메서드
		if (message != null) {
			model.addAttribute("message", message);
		}
		model.addAttribute("resv_arr", resv_arr);

		return "reservation/resvList"; // JSP 페이지 이름
	}

	@GetMapping("/resvRoom")
	public String showReservationPage(Model model, @RequestParam String date, @RequestParam int room) {
		model.addAttribute("selectedDate", date);
		model.addAttribute("selectedRoom", room);
		// 예약 페이지로 이동
		return "reservation/resvNew"; // 예약 페이지의 JSP 이름
	}

	@PostMapping("/resvSave")
	public String processReservation(@ModelAttribute("reservationDTO") ReservationDTO reservationDTO,
			RedirectAttributes redirectAttributes, HttpSession session) {
		// DTO를 통해 정보 전달 후 데이터베이스에 저장
		reservationService.saveNewResv(reservationDTO, session);

		String roomKind = "";
		int room = reservationDTO.getRoom();
		if (room == 1) {
			roomKind = "VIP Room";
		} else if (room == 2) {
			roomKind = "Deluxe Room";
		} else {
			roomKind = "Standard Room";
		}
		// 예약완료 메세지와 함께 정보를 포함하여 메세지 전달
		String message = "예약이 성공적으로 완료되었습니다. " + reservationDTO.getResv_date() + ", " + roomKind;

		redirectAttributes.addFlashAttribute("message", message);

		return "redirect:/resvInfo"; // 결과를 보여줄 페이지의 URL로 리다이렉트
	}

	// 예약 수정 및 취소를 위해 관리자 권한에서 해당 정보 불러오기
	@GetMapping("/resvView")
	public String showReservation(Model model, @RequestParam Date date, @RequestParam int room) {
		Reservation reservation = reservationService.getResvInfo(room, date);

		if (reservation != null) {
			model.addAttribute("reservation", reservation);
			model.addAttribute("room", room); // 방 정보 전달
			model.addAttribute("resvDate", date); // 날짜 정보 전달
		} else {
			model.addAttribute("reservationNotFound", true);
		}
		return "reservation/resvView";
	}

	// 예약 수정 폼으로 이동
	@GetMapping("/resvEdit")
	public String editReservation(Model model, @RequestParam Date date, @RequestParam int room) {

		Reservation reservation = reservationService.getResvInfo(room, date);

		if (reservation != null) {
			model.addAttribute("reservation", reservation);
			model.addAttribute("room", room); // 방 정보 전달
			model.addAttribute("resvDate", date); // 날짜 정보 전달
		} else {
			model.addAttribute("reservationNotFound", true);
		}
		return "reservation/resvEdit";
	}

	@PostMapping("/resvEdit")
	public String editResult(@ModelAttribute("reservationDTO") ReservationDTO reservationDTO,
			RedirectAttributes redirectAttributes) {
		// DTO를 통해 정보 전달 후 데이터베이스에 저장
		reservationService.updateReservation(reservationDTO);

		String roomKind = "";
		int room = reservationDTO.getRoom();
		if (room == 1) {
			roomKind = "VIP Room";
		} else if (room == 2) {
			roomKind = "Deluxe Room";
		} else {
			roomKind = "Standard Room";
		}
		// 예약완료 메세지와 함께 정보를 포함하여 메세지 전달
		String message = "예약 수정이 성공적 으로 완료되었습니다. " + reservationDTO.getResv_date() + ", " + roomKind;

		redirectAttributes.addFlashAttribute("message", message);

		return "redirect:/resvInfo"; // 결과를 보여줄 페이지의 URL로 리다이렉트
	}
	
	
	// 예약 취소
	@PostMapping("/resvCancel")
	public String cancelReservation(@RequestParam("resvDate") Date resvDate, @RequestParam("room") int room,
			RedirectAttributes redirectAttributes) {
		reservationService.cancelReservation(room, resvDate);

		String roomKind = "";
		if (room == 1) {
			roomKind = "VIP Room";
		} else if (room == 2) {
			roomKind = "Deluxe Room";
		} else {
			roomKind = "Standard Room";
		}

		String message = "예약이 취소되었습니다." + resvDate.toString() + ", " + roomKind;
		redirectAttributes.addAttribute("message", message);
		return "redirect:/resvInfo"; // Redirect to the view page
	}

}
