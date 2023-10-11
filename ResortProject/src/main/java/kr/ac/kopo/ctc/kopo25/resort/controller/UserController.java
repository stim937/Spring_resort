package kr.ac.kopo.ctc.kopo25.resort.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
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
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    @PostMapping("/authenticate")
    public String login(@RequestParam("id") String loginId, @RequestParam("password") String password,
                        HttpSession session, Model model) {

        if (userService.authenticateUser(loginId, password)) {
            User loginInfo = userRepository.findByLoginId(loginId);
            session.setAttribute("loginInfo", loginInfo);
            return "redirect:/loginForm";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다");
            session.setAttribute("loginResult", "failure");
            return "loginForm";
        }
    }

    @GetMapping("/logout")
    public String logoutForm(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/main";
    }

    @GetMapping("/joinForm")
    public String joinForm(Model model) {
        model.addAttribute("userDto", new UserRequestDTO());
        return "/user/joinForm";
    }

    @PostMapping("/saveUser")
    public String joinProc(@Valid UserRequestDTO userDto, Errors errors, Model model) {
    	model.addAttribute("userDto", userDto);
    	
    	if (errors.hasErrors()) {
            Map<String, String> validatorResult = userService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            return "/user/joinForm";
        }

        if (userService.checkLoginIdAndEmailDuplication(userDto.getLoginId(), userDto.getEmail())) {           
            if (userService.isLoginIdDuplicated(userDto.getLoginId())) {
                model.addAttribute("valid_loginId", "아이디가 중복되었습니다");
            }
            if (userService.isEmailDuplicated(userDto.getEmail())) {
                model.addAttribute("valid_email", "이메일이 중복되었습니다");
            }
            return "/user/joinForm";
        }

        userService.joinUser(userDto);
        return "redirect:/joinResult";
    }

    @GetMapping("/joinResult")
    public String joinResult() {
        return "/user/joinResult";
    }

    @GetMapping("/userInfo")
    public String viewBoardItem(Model model, HttpSession session) {
        User loginInfo = (User) session.getAttribute("loginInfo");
        if (loginInfo != null) {
            loginInfo = userRepository.findById(loginInfo.getId()).orElse(null);
            model.addAttribute("reservations", loginInfo.getReservation());
            model.addAttribute("notices", loginInfo.getBoardItem());
            model.addAttribute("noticeComments", loginInfo.getBoardComment());
            return "/user/userInfo";
        } else {
            model.addAttribute("message", "로그인이 필요합니다");
            return "errorPage";
        }
    }
}
