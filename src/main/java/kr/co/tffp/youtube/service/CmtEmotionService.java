package kr.co.tffp.youtube.service;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.vo.CmtEmotion;
import kr.co.tffp.youtube.vo.SubCmtEmotion;

@Transactional
public interface CmtEmotionService {
	
	void CmtEmotionInsert(CmtEmotion cmtEmotion);
	
	void SubCmtEmotionInsert(SubCmtEmotion subCmtEmotion);
	
	void CmtEmotionUpdate(CmtEmotion cmtEmotion);
	
	void SubCmtEmotionUpdate(SubCmtEmotion subCmtEmotion);
	
	CmtEmotion CmtEmotionUserNo(Map<String, Integer> cmtEmotionMap);
	
	SubCmtEmotion SubCmtEmotionUserNo(Map<String, Integer> subCmtEmotionMap);



}
