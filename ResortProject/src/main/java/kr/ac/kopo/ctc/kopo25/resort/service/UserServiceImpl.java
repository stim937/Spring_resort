package kr.ac.kopo.ctc.kopo25.resort.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import jakarta.servlet.http.HttpSession;
import kr.ac.kopo.ctc.kopo25.resort.domain.Reservation;
import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.dto.UserRequestDTO;
import kr.ac.kopo.ctc.kopo25.resort.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
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
        User user = convertToUser(userDto);
        userRepository.save(user);
    }

    @Override
    public boolean isLoginIdDuplicated(String loginId) {
        return userRepository.existsByLoginId(loginId);
    }

    @Override
    public boolean isEmailDuplicated(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean checkLoginIdAndEmailDuplication(String loginId, String email) {
        return isLoginIdDuplicated(loginId) || isEmailDuplicated(email);
    }

    private User convertToUser(UserRequestDTO userDto) {
        User user = new User();
        user.setLoginId(userDto.getLoginId());
        user.setPassword(userDto.getPassword());
        user.setNickname(userDto.getNickname());
        user.setEmail(userDto.getEmail());
        user.setRole(2);
        return user;
    }
}
