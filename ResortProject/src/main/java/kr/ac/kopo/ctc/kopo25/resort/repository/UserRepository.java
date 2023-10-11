package kr.ac.kopo.ctc.kopo25.resort.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.ac.kopo.ctc.kopo25.resort.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByLoginId(String loginId);
	boolean existsByLoginId(String nickname);
	boolean existsByEmail(String email);
}
