package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.dto.Thumbnails;
import kr.co.tffp.youtube.vo.Subscribe;

@Transactional
public interface SubscribeService {

	void addSubscribe(Map<String, Object> mapSubscribe);
	void deleteSubscribe(Map<String, Object> mapSubscribe);
	
	int countSubscribe(int userNo);
	int countsubscribeByChannelNo(int channelNo);
	
	Subscribe getSubscribeByMap(Map<String, Object> mapSubscribe);
	
	List<HomeSubscribeByUserNo> getSubscribeByUserNo(int userNo);
	List<Thumbnails> todayUpload(int userNo);
	List<Thumbnails> yesterdayUpload(int userNo);
	List<Thumbnails> weekUpload(int userNo);
	List<Thumbnails> monthUpload(int userNo);
	List<HomeSubscribeByUserNo> getMySubscribe(int userNo);
	
}
