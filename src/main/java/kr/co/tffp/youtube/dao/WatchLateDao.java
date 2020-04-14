package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.AfterThumnails;
import kr.co.tffp.youtube.vo.WatchLate;


public interface WatchLateDao {

	List<AfterThumnails> getAfterByUserNo(int userNo);
	List<AfterThumnails> getAfterListBymap(Map<String, Object> param);
	List<Integer> getwatchlateList(int no);
	
	WatchLate selectAfterByMap(Map<String, Object> after);
	
	int countAfterByUserNo(int userNo);

	void deletewatchLate(Map<String, Object> watchLateInfoMap);
	void delWatchLateByVideoNo(int videoNo);
	void insertAfter(Map<String, Object> after);
}
