package kr.co.tffp.youtube.dao;

import java.util.Map;

public interface CommunityEmotionDao {

	void insertCmntEmotion(Map<String, Object> mapEmotion);
	void deleteCmntEmotion(Map<String, Object> mapEmotion);
	
	Map<String, Object> cmntEmotionCnt(int cmntNo);
	
	
	
	

}
