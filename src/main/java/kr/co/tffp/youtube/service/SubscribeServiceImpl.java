package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.SubscribeDao;
import kr.co.tffp.youtube.dao.VideoDao;
import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.dto.Thumbnails;
import kr.co.tffp.youtube.vo.Subscribe;

@Service("SubscribeService")
public class SubscribeServiceImpl implements SubscribeService{

	@Autowired
	private SubscribeDao subscribeDao;
	
	@Autowired
	private VideoDao videoDao; 
	
	@Override
	public List<HomeSubscribeByUserNo> getSubscribeByUserNo(int userNo) {
		
		List<HomeSubscribeByUserNo> getSubscribeByUserNo = subscribeDao.getSubscribeByUserNo(userNo);
		
		return getSubscribeByUserNo;
	}

	@Override
	public int countSubscribe(int userNo) {
		
		int count = subscribeDao.getCountSubscribe(userNo);
		
		return count;
	}

	@Override
	public List<Thumbnails> todayUpload(int userNo) {

		List<Thumbnails> today = videoDao.getTodayUpload(userNo);
		
		return today;
	}

	@Override
	public List<Thumbnails> yesterdayUpload(int userNo) {

		List<Thumbnails> yesterday = videoDao.getYesterdayUpload(userNo);
		
		return yesterday;
	}

	@Override
	public List<Thumbnails> weekUpload(int userNo) {

		List<Thumbnails> week = videoDao.getweekUpload(userNo);
		
		return week;
	}

	@Override
	public List<Thumbnails> monthUpload(int userNo) {
		
		List<Thumbnails> month = videoDao.getMonthUpload(userNo);
		
		return month;
	}

	@Override
	public void addSubscribe(Map<String, Object> mapSubscribe) {

		subscribeDao.insertSubscribe(mapSubscribe);
				
	}

	@Override
	public void deleteSubscribe(Map<String, Object> mapSubscribe) {
		
		subscribeDao.deleteSubscribe(mapSubscribe);
		
	}

	@Override
	public Subscribe getSubscribeByMap(Map<String, Object> mapSubscribe) {

		Subscribe sub = subscribeDao.selectSubscribeByMap(mapSubscribe);
		
		return sub;
	}

	@Override
	public int countsubscribeByChannelNo(int channelNo) {

		int sub = subscribeDao.getCountSubscribeByChannelNo(channelNo);
		
		return sub;
	}

	@Override
	public List<HomeSubscribeByUserNo> getMySubscribe(int userNo) {
		System.out.println("dhodksdjk");
		return subscribeDao.getSubscribeByUserNo(userNo);
	}

}
