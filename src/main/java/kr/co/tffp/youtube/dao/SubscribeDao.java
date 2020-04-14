package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.vo.Subscribe;

public interface SubscribeDao {
	
	void deleteSubscribe(Map<String, Object> mapSubscribe);
	void insertSubscribe(Map<String, Object> mapSubscribe);
	
	int getCountSubscribe(int userNo);
	int getCountSubscribeByChannelNo(int channelNo);
	
	Subscribe selectSubscribeByMap(Map<String, Object> mapSubscribe);
	
	List<HomeSubscribeByUserNo> getSubscribeByUserNo(int userNo);
}
