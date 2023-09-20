package kr.ac.kopo.ctc.kopo25.resort.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	// 메인 페이지 이동
	@GetMapping("/main")
	public String mainPage() {
		return "/introduce/main"; // JSP 페이지 이름
	}

	// VIP 룸 페이지 이동
	@GetMapping("/room_01")
	public String RoomPage1() {
		return "/introduce/room_1"; // JSP 페이지 이름
	}

	// 디럭스 룸 페이지 이동
	@GetMapping("/room_02")
	public String RoomPage2() {
		return "/introduce/room_2"; // JSP 페이지 이름
	}

	// 스탠다드 룸 페이지 이동
	@GetMapping("/room_03")
	public String RoomPage3() {
		return "/introduce/room_3"; // JSP 페이지 이름
	}

}
