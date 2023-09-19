package kr.ac.kopo.ctc.kopo25.resort.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.ctc.kopo25.resort.domain.User;
import kr.ac.kopo.ctc.kopo25.resort.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

//	@Override
//	public boolean checkLoginId(String loginId) {
//		// TODO Auto-generated method stub
//		return userRepository.existsByLoginId(loginId);
//	}
//
//	@Override
//	public boolean checkNickname(String nickname) {
//		// TODO Auto-generated method stub
//		return userRepository.existsByNickname(nickname);
//	}
//
////	/**
////	 * 회원가입 기능 1 화면에서 JoinRequest(loginId, password, nickname)을 입력받아 User로 변환 후 저장
////	 * loginId, nickname 중복 체크는 Controller에서 진행 => 에러 메세지 출력을 위해
////	 */
////	public void join(JoinDTO req) {
////		userRepository.save(req.toEntity());
////	}
//
//	@Override
//	public User authenticateUser(String id, String password) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void join(JoinDTO req) {
//		// TODO Auto-generated method stub
//		
//	}
	public boolean authenticateUser(String loginId, String password) {
        User user = userRepository.findByLoginId(loginId);
        return user != null && user.getPassword().equals(password);   
	}
	
}
