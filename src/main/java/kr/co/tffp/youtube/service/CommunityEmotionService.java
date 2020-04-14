package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CommunityEmotionService {

	Map<String, Object> changeEmntEmotion(Map<String, Object> mapEmotion);
	
	
}
