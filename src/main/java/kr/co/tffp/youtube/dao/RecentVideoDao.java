package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.RecentListDto;
import kr.co.tffp.youtube.vo.RecentVideo;

public interface RecentVideoDao {

	List<RecentListDto> getRecentDtoByUserNo(int userNo);
	List<RecentListDto> getRecentDtoByUserNoToday(int userNo);
	List<RecentListDto> getRecentDtoByUserNoYesterday(int userNo);
	List<RecentListDto> getRecentDtoByUserNoWeek(int userNo);
	List<RecentListDto> getRecentDtoByUserNoMonth(int userNo);
	
	void insertRecentVideo(RecentVideo recentVideo);
	
	void delRecentVideo(Map<String, Object> param);
	
}
