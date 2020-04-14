package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.RecentListDto;
import kr.co.tffp.youtube.vo.RecentVideo;

@Transactional
public interface RecentVideoService {

	List<RecentListDto> getRecentDtoByUserNo(int userNo);
	List<RecentListDto> getToday(int userNo);
	List<RecentListDto> getYesterday(int userNo);
	List<RecentListDto> getWeek(int userNo);
	List<RecentListDto> getMonth(int userNo);
	
	void RecentVideoInsert(RecentVideo recentVideo);
	
	void delRecent(Map<String, Object> param);
}
