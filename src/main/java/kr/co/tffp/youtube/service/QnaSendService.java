package kr.co.tffp.youtube.service;

import java.util.List;

import kr.co.tffp.youtube.vo.Qna;

public interface QnaSendService {

	void insertQna(Qna qna) throws Exception;

	List<Qna> getAllMail();

	Qna getMailByNo(int mailNo);

	void updateReadMail(int no);

	List<Qna> getFourQna();

}
