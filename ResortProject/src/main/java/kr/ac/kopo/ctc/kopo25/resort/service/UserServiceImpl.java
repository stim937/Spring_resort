package kr.ac.kopo.ctc.kopo25.resort.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.dto.UserRequestDTO;
import kr.ac.kopo.ctc.kopo25.resort.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	public boolean authenticateUser(String loginId, String password) {
		User user = userRepository.findByLoginId(loginId);
		return user != null && user.getPassword().equals(password);
	}

	@Override
	public Map<String, String> validateHandling(Errors errors) {
		Map<String, String> validatorResult = new HashMap<>();

		for (FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		return validatorResult;
	}

	@Override
	public void joinUser(UserRequestDTO userDto) {
		User user = new User();
		user.setLoginId(userDto.getLoginId());
		user.setPassword(userDto.getPassword());
		user.setNickname(userDto.getNickname());
		user.setEmail(userDto.getEmail());
		user.setRole(2);
		userRepository.save(user);
	}

	@Transactional(readOnly = true)
	@Override
	public boolean checkLoginIdDuplication(String loginId) {
		// TODO Auto-generated method stub
		boolean loginIdDuplicate = userRepository.existsByLoginId(loginId);
		return loginIdDuplicate;
	}
	
	@Transactional(readOnly = true)
	@Override
	public boolean checkEmailDuplication(String email) {
		// TODO Auto-generated method stub
		boolean emailDuplicate  = userRepository.existsByEmail(email);
		return emailDuplicate ;
	}
}
