package kr.co.tffp.youtube.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.vo.Admin;
import kr.co.tffp.youtube.vo.User;

@Transactional
public interface UserService {
	
	boolean addNewUser(User user);
	User login(String userId, String password);
	Admin login(String userId, String password, int option);
	User getUserByNo(int userNo);
	
	void updateUser(User user);
	List<User> getUserList();
	List<User> getUserList(String searchText);
}
