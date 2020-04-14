package kr.co.tffp.youtube.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.AdminDao;
import kr.co.tffp.youtube.dao.ChannelDao;
import kr.co.tffp.youtube.dao.PlayListDao;
import kr.co.tffp.youtube.dao.UserDao;
import kr.co.tffp.youtube.vo.Admin;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.User;

@Service("UserService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ChannelDao channelDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private PlayListDao playlistDao;
	

	@Override
	public boolean addNewUser(User user) {
		
		User prevUser = userDao.getUserById(user.getId());
		if(prevUser != null) {
			return false;
		}
		
		String shaPassword = DigestUtils.sha1Hex(user.getPassword());
		user.setPassword(shaPassword);
		userDao.insertUser(user);

		Channel channel = new Channel();
		channel.setUserNo(user.getNo());
		channel.setTitle(user.getId());		
		
		channelDao.insertChannel(channel);
		
		PlayList playList = new PlayList();
		playList.setNo(playlistDao.getPlayListSeq());
		playList.setUserNo(user.getNo());
		playList.setTitle("Default");
		
		playlistDao.addPlayList(playList);
				
		return true;
	}

	@Override
	public User login(String userId, String password) {
		
		User user = userDao.getUserById(userId);
		if(userId == null) {
			return null;
		}
		
		String shaPassword = DigestUtils.sha1Hex(password);
		if(!user.getPassword().equals(shaPassword)) {
			return null;
		}
		
		return user;
	}

	@Override
	public Admin login(String adminId, String password, int option) {
		
		Admin admin = adminDao.getAdminById(adminId);
		
		if(adminId == null) {
			return null;
		}
		
		if(!admin.getPassword().equals(password)) {
			return null;
		}
		
		return admin;
	}

	@Override
	public User getUserByNo(int userNo) {
		
		User user = userDao.getUserByNo(userNo);
		
		return user;
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public List<User> getUserList() {
		return userDao.getUserList();
	}

	@Override
	public List<User> getUserList(String searchText) {
		return userDao.getUserListByText(searchText);
	}

	
}
