package kr.ac.kopo.ctc.kopo25.resort.service;

import java.util.Map;

import org.springframework.validation.Errors;

import kr.ac.kopo.ctc.kopo25.resort.dto.UserRequestDTO;

public interface UserService {	
	
	// DB의 아이디 비밀번호가 맞는지 체크
	boolean authenticateUser(String loginId, String password);
	
	// 아이디, 이메일 중복 체크
	boolean checkLoginIdAndEmailDuplication(String loginId, String email);
	boolean isLoginIdDuplicated(String loginId);
	boolean isEmailDuplicated(String email);
	
	// 회원가입 유효성 체크
	Map<String, String> validateHandling(Errors errors);
	
	// 회원가입 데이터 저장
	void joinUser(UserRequestDTO userDto);
}
