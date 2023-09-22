package kr.ac.kopo.ctc.kopo25.resort.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.dto.UserRequestDTO;
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

	// TODO:여기부터하는중
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/user/joinForm"; // JSP 페이지 이름
	}
	
	// 유효성 여부를 검사한 뒤 회원가입 실행
	@PostMapping("/saveUser")
	public String joinProc(@Valid UserRequestDTO userDto, Errors errors, Model model) {		
	
		if (errors.hasErrors()) {
			/* 회원가입 실패시 입력 데이터 값을 유지 */
			model.addAttribute("userDto", userDto);

			/* 유효성 통과 못한 필드와 메시지를 핸들링 */
			Map<String, String> validatorResult = userService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
				model.addAttribute(key, validatorResult.get(key));
			}					
			/* 회원가입 페이지로 다시 리턴 */
			return "/user/joinForm";
		}
		
		// 유효성 검사 이후 아이디, 이메일 중복검사
		if (userService.checkLoginIdDuplication(userDto.getLoginId()) && userService.checkEmailDuplication(userDto.getEmail())) {
			model.addAttribute("userDto", userDto);
			model.addAttribute("valid_loginId", "아이디가 중복되었습니다");
			model.addAttribute("valid_email", "이메일이 중복되었습니다");
			return "/user/joinForm";
		} else if(userService.checkLoginIdDuplication(userDto.getLoginId())){
			model.addAttribute("userDto", userDto);
			model.addAttribute("valid_loginId", "아이디가 중복되었습니다");
			return "/user/joinForm";
		} else if (userService.checkEmailDuplication(userDto.getEmail())){
			model.addAttribute("userDto", userDto);
			model.addAttribute("valid_email", "이메일이 중복되었습니다");
			return "/user/joinForm";
		}
		
		userService.joinUser(userDto);
		return "redirect:/joinResult";
	}
	
	@GetMapping("/joinResult")
	public String joinResult() {
		return "/user/joinResult"; // JSP 페이지 이름
	}

}
