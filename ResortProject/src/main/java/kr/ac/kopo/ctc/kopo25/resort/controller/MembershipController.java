package kr.ac.kopo.ctc.kopo25.resort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.kopo.ctc.kopo25.resort.service.UserService;

@Controller
public class MembershipController {

	@Autowired
	UserService membershipService;

	// 회원가입 페이지 이동
	@GetMapping("/joinMembership")
	public String showMemberJoinPage() {
		return "membership/join"; // JSP 페이지 이름
	}

	

//	// 아이디 중복확인
//	@PostMapping("/check_login_id")
//	public String checkLoginId(@RequestParam("loginId") String loginId, Model model) {
//	    int idCheckResult = membershipService.checkLoginId(loginId);
//	    model.addAttribute("IdCheck", idCheckResult);
//	    return "redirect:/joinMembership";
//	}
//
//	// 닉네임 중복확인
//	@PostMapping("/check_nickname")
//	public String checkNickname(@RequestParam("nicknameHidden") String nicknameHidden, Model model) {
//		int NicknameCheckResult = membershipService.checkNickname(nicknameHidden);
//		model.addAttribute("NicknameCheck", NicknameCheckResult);
//		return "redirect:/membership/join";
//	}

}
