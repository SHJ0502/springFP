package kr.co.tffp.youtube.dao;

import java.util.List;

import kr.co.tffp.youtube.vo.User;

public interface UserDao {

	void insertUser(User user);
	User getUserById(String userId);
	User getUserByNo(int userNo);
	
	void updateUser(User user);
	List<User> getUserList();
	List<User> getUserListByText(String searchText);
}
