package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.AfterThumnails;
import kr.co.tffp.youtube.vo.WatchLate;


@Transactional
public interface WatchLateService {

	List<AfterThumnails> getAfterByUserNo(int userNo);
	List<AfterThumnails> getAfterListBymap(Map<String, Object> param);
	
	int countAfterByUserNo(int userNo);
	
	void addAfter(Map<String, Object> after);
	void delAfter(Map<String, Object> delafter);
	
	WatchLate getafterByMap(Map<String, Object> after);
}
