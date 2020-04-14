package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.GoodListByUserNo;
import kr.co.tffp.youtube.vo.VideoEmotion;

public interface VideoEmotionDao {

	void updateVideoEmotion(VideoEmotion emotion);
	void delVideoEmotionByVideoNo(int videoNo);
	
	int countVideoEmotionByUserNo(int userNo);
	
	List<GoodListByUserNo> getEmotionVideoByUserNo(int userNo);
	
	VideoEmotion getVideoEmotionByUserNo(Map<String, Integer> videoEmotionMap);
	
	void insertVideoEmotion(VideoEmotion videoEmotion);
}
