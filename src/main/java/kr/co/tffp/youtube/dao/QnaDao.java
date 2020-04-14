package kr.co.tffp.youtube.dao;

import java.util.List;

import kr.co.tffp.youtube.vo.Qna;

public interface QnaDao {

	void insertQna(Qna qna);

	List<Qna> getAllMail();

	Qna getMailByNo(int mailNo);

	void updateReadMail(int no);

	List<Qna> getFourQna();

}
