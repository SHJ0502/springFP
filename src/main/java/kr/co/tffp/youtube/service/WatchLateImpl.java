package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.WatchLateDao;
import kr.co.tffp.youtube.dto.AfterThumnails;
import kr.co.tffp.youtube.vo.WatchLate;


@Service
public class WatchLateImpl implements WatchLateService{

	@Autowired
	private WatchLateDao watchLateDao;
	
	@Override
	public List<AfterThumnails> getAfterByUserNo(int userNo) {
		
		List<AfterThumnails> afters = watchLateDao.getAfterByUserNo(userNo);
		
		return afters;
	}

	@Override
	public int countAfterByUserNo(int userNo) {
		
		int countAfter = watchLateDao.countAfterByUserNo(userNo);
		
		return countAfter;
	}

	@Override
	public void addAfter(Map<String, Object> after) {
		
		watchLateDao.insertAfter(after);
		
	}

	@Override
	public WatchLate getafterByMap(Map<String, Object> after) {
		System.out.println("서비스맵확인" + after);
		WatchLate watchLate = watchLateDao.selectAfterByMap(after);
		System.out.println("서비스확인" + watchLate);
		
		return watchLate;
	}

	@Override
	public void delAfter(Map<String, Object> delafter) {

		watchLateDao.deletewatchLate(delafter);
		
	}

	@Override
	public List<AfterThumnails> getAfterListBymap(Map<String, Object> param) {
		
		List<AfterThumnails> listByMap = watchLateDao.getAfterListBymap(param);
		
		return listByMap;
	}

	
}
