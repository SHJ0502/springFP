package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.CommunityEmotionDao;

@Service
public class CommunityEmotionServiceImpl implements CommunityEmotionService{

	@Autowired
	private CommunityEmotionDao cmntEmotionDao;
	
	@Override
	public Map<String, Object> changeEmntEmotion(Map<String, Object> mapEmotion) {
		String work = (String) mapEmotion.get("work");
		System.out.println(mapEmotion);
		
		if ("ADD".equals(work)) {
			cmntEmotionDao.deleteCmntEmotion(mapEmotion);
			cmntEmotionDao.insertCmntEmotion(mapEmotion);
		} else if ("DELETE".equals(work)){
			cmntEmotionDao.deleteCmntEmotion(mapEmotion);
		}
		return cmntEmotionDao.cmntEmotionCnt((Integer) mapEmotion.get("channelCmntNo"));
	}


}
