package kr.ac.kopo.ctc.kopo25.resort.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.repository.UserRepository;
import kr.ac.kopo.ctc.kopo25.resort.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	UserRepository userRepository;

	// 로그인 페이지에 이전 url 정보 저장
	@GetMapping("/loginForm")
	public String loginForm() {
		return "loginForm"; // JSP 페이지 이름
	}

	@PostMapping("/authenticate")
	public String login(@RequestParam("id") String loginId, @RequestParam("password") String password,
			HttpSession session, Model model) {

		// 서비스의 비밀번호 인증 매소드 사용
		if (userService.authenticateUser(loginId, password)) {
			// 인증이 성공한 경우
			User loginInfo = userRepository.findByLoginId(loginId);
			session.setAttribute("loginInfo", loginInfo);
			System.out.println("login success!!");
			return "redirect:/loginForm";
		} else {
			// 인증 실패경우
			model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다");
			session.setAttribute("loginResult", "failure");
			return "loginForm"; // 오류메세지와 함께 로그인 폼으로
		}
	}

	@GetMapping("/logout")
	public String logoutForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // 세션값을 지우고 main페이지로 리다이렉트
		}
		return "redirect:/main";
	}

}
