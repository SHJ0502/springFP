package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.QnaDao;
import kr.co.tffp.youtube.dao.UserDao;
import kr.co.tffp.youtube.vo.Qna;
import kr.co.tffp.youtube.websocket.NoticeWebSocketHandler;

@Service
public class QnaSendServiceImpl implements QnaSendService{

	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private NoticeWebSocketHandler noticeWebSocketHandler;
	
	
	@Override
	public void insertQna(Qna qna) throws Exception {
		qnaDao.insertQna(qna);
		
		noticeWebSocketHandler.sendMessage("QNA:" + qna.getTitle());
	}


	@Override
	public List<Qna> getAllMail() {
		return qnaDao.getAllMail();
	}


	@Override
	public Qna getMailByNo(int mailNo) {
		return qnaDao.getMailByNo(mailNo);
	}


	@Override
	public void updateReadMail(int no) {
		qnaDao.updateReadMail(no);
	}

	@Override
	public List<Qna> getFourQna() {
		
		return qnaDao.getFourQna();
	}


}
