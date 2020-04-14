package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.ChannelCmntUserDto;
import kr.co.tffp.youtube.dto.CmntCommentUserDto;
import kr.co.tffp.youtube.vo.CmntBoard;
import kr.co.tffp.youtube.vo.CmntComment;
import kr.co.tffp.youtube.vo.Comment;
import kr.co.tffp.youtube.vo.SubComment;

@Transactional
public interface CommentService {

	/**
	 * 비디오no에 해당하는 모든 댓글들을 불러온다.
	 * 
	 * @param videoNo 조회할 비디오no
	 * @return 비디오번호에 해당하는 댓글을 불러온다.
	 */
	List<Comment> getCommentsVideo(int videoNo);

	/**
	 * 모든 댓글 불러오기
	 * 
	 * @return 모든댓글
	 */
	List<Comment> getComments();

	List<Comment> getCommentsUser(Map<String, Integer> commentMap);
	 
	void commentInsert(Comment comment);
	
	void commentDelete(int commentNo);
	
	List<Comment> getCommentRemoveUserNo(Map<String, Integer> commentMap);
	
	void commentUpdate(Comment comment);
	
	void subCommentUpdate(SubComment subComment);
	
	Comment getCommentByCommentNo(int commentNo);
	
	List<SubComment> getSubCommentCommentNo(int commentNo);
	
	SubComment getSubCommentSubCommentNo(int subcommentNo);
	
	void subCommentInsert(SubComment subComment);
	
	void subCommentDelete(int subcommentNo);
	
	
	// 채널 커뮤니티탭 게시글 과 댓글
	void insertCmnt(CmntBoard cmnt);
	void insertCmntComment (CmntComment cmntCommnet);
	
	List<CmntBoard> getCmntByChannelNo (int channelNo);
	List<CmntComment> getAllCmntComment();
	
	List<ChannelCmntUserDto> getChannelCmntUserByChannelNo(int channelNo);


	CmntComment getCmntCommentsByCmntNo(int cmntNo);
	
	List<CmntCommentUserDto> getCmntCommentsUserByCmntNo(int cmntNo);
	
	void updateCmntByCmntNo(CmntBoard cmntBoard);
	
	void deleteCmntByCmntNo(int cmntNo);
	
	void updateCmntComment(CmntComment cmntComment);
	
	void deleteCmntComment(int cmntCommentNo);
	
	void deleteCmntCommentAll(int cmntNo);
	
	CmntCommentUserDto getCmntCommentsUserByCmntCommentNo(int cmntNo);
	
	ChannelCmntUserDto getChannelCmntUserByCmntNo(int cmntNo);
	
	CmntBoard getCmntByCmntNo(int cmntNo);
	 

}
