package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.CmtEmotionDao;
import kr.co.tffp.youtube.vo.CmtEmotion;
import kr.co.tffp.youtube.vo.SubCmtEmotion;

@Service
public class CmtEmotionServiceImpl implements CmtEmotionService {
	
	@Autowired
	private CmtEmotionDao cmtEmotionDao;

	@Override
	public void CmtEmotionInsert(CmtEmotion cmtEmotion) {
		cmtEmotionDao.insertCmtEmotion(cmtEmotion);
	}
	
	@Override
	public void SubCmtEmotionInsert(SubCmtEmotion subCmtEmotion) {
		cmtEmotionDao.insertSubCmtEmotion(subCmtEmotion);
	}

	@Override
	public void CmtEmotionUpdate(CmtEmotion cmtEmotion) {
		cmtEmotionDao.updateCmtEmotion(cmtEmotion);
	}

	@Override
	public CmtEmotion CmtEmotionUserNo(Map<String, Integer> cmtEmotionMap) {
		CmtEmotion cmtEmotion = cmtEmotionDao.getCmtEmotionByUserNo(cmtEmotionMap);
		return cmtEmotion;
	}

	@Override
	public void SubCmtEmotionUpdate(SubCmtEmotion subCmtEmotion) {
		cmtEmotionDao.updateSubCmtEmotion(subCmtEmotion);
	}

	@Override
	public SubCmtEmotion SubCmtEmotionUserNo(Map<String, Integer> subCmtEmotionMap) {
		SubCmtEmotion subCmtEmotion = cmtEmotionDao.getSubCmtEmotionByUserNo(subCmtEmotionMap);
		return subCmtEmotion;
	}

}
