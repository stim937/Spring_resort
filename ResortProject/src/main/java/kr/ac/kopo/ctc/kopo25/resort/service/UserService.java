package kr.ac.kopo.ctc.kopo25.resort.service;

public interface UserService {
//	boolean checkLoginId(String loginId);
//	boolean checkNickname(String nickname);
//	
//	void join(JoinDTO req);
	
	boolean authenticateUser(String loginId, String password);
}
