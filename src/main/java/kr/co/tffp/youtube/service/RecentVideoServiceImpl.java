package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.RecentVideoDao;
import kr.co.tffp.youtube.dto.RecentListDto;
import kr.co.tffp.youtube.vo.RecentVideo;

@Service("RecentVideoService")
public class RecentVideoServiceImpl implements RecentVideoService{

	@Autowired
	private RecentVideoDao recentVideoDao;
	
	@Override
	public List<RecentListDto> getRecentDtoByUserNo(int userNo) {
		
		List<RecentListDto> recentList = recentVideoDao.getRecentDtoByUserNo(userNo);
		
		return recentList;
	}

	@Override
	public List<RecentListDto> getToday(int userNo) {
		
		List<RecentListDto> todaylist = recentVideoDao.getRecentDtoByUserNoToday(userNo);
		
		return todaylist;
	}

	@Override
	public List<RecentListDto> getYesterday(int userNo) {
		
		List<RecentListDto> yesterdaylist = recentVideoDao.getRecentDtoByUserNoYesterday(userNo);
		
		return yesterdaylist;
	}

	@Override
	public List<RecentListDto> getWeek(int userNo) {

		List<RecentListDto> weeklist = recentVideoDao.getRecentDtoByUserNoWeek(userNo);
		
		return weeklist;
	}

	@Override
	public List<RecentListDto> getMonth(int userNo) {
		
		List<RecentListDto> monthlist = recentVideoDao.getRecentDtoByUserNoMonth(userNo);
		
		return monthlist;
	}

	@Override
	public void delRecent(Map<String, Object> param) {
		
		recentVideoDao.delRecentVideo(param);
		
	}

	@Override
	public void RecentVideoInsert(RecentVideo recentVideo) {
		recentVideoDao.insertRecentVideo(recentVideo);
	}

}
