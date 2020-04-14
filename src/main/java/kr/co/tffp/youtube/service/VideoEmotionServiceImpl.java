package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.VideoEmotionDao;
import kr.co.tffp.youtube.vo.VideoEmotion;

@Service("VideoEmotionService")
public class VideoEmotionServiceImpl implements VideoEmotionService{

	@Autowired
	private VideoEmotionDao videoEmotionDao;
	
	@Override
	public void updateVideoEmotion(VideoEmotion emotion) {
		
		videoEmotionDao.updateVideoEmotion(emotion);
		
	}

	@Override
	public VideoEmotion getVideoEmotionNo(Map<String, Integer> videoEmotionMap) {
		VideoEmotion videoEmotion = videoEmotionDao.getVideoEmotionByUserNo(videoEmotionMap);
		return videoEmotion;
	}

	@Override
	public void insertVideoEmotion(VideoEmotion videoEmotion) {
		videoEmotionDao.insertVideoEmotion(videoEmotion);
		
	}

}
