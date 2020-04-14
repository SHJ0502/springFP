package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.vo.VideoEmotion;

@Transactional
public interface VideoEmotionService {

	void updateVideoEmotion(VideoEmotion emotion);
	
	VideoEmotion getVideoEmotionNo(Map<String, Integer> videoEmotionMap);
	
	void insertVideoEmotion(VideoEmotion videoEmotion);
}
