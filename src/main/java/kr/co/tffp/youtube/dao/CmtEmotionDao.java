package kr.co.tffp.youtube.dao;

import java.util.Map;

import kr.co.tffp.youtube.vo.CmtEmotion;
import kr.co.tffp.youtube.vo.SubCmtEmotion;

public interface CmtEmotionDao {

	void insertCmtEmotion(CmtEmotion cmtEmotion);
	
	void insertSubCmtEmotion(SubCmtEmotion subCmtEmotion);
	
	void updateCmtEmotion(CmtEmotion cmtEmotion);
	
	void updateSubCmtEmotion(SubCmtEmotion subCmtEmotion);
	
	CmtEmotion getCmtEmotionByUserNo(Map<String, Integer> cmtEmotionMap);
	
	SubCmtEmotion getSubCmtEmotionByUserNo(Map<String, Integer> subCmtEmotionMap);
	
}
