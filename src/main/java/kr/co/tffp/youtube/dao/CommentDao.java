package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.ChannelCmntUserDto;
import kr.co.tffp.youtube.dto.CmntCommentUserDto;
import kr.co.tffp.youtube.vo.CmntBoard;
import kr.co.tffp.youtube.vo.CmntComment;
import kr.co.tffp.youtube.vo.Comment;
import kr.co.tffp.youtube.vo.SubComment;

public interface CommentDao {

	List<Comment> getCommentByVideoNo(int videoNo);
	
	List<Comment> getAllComment();
	
	void insertComment(Comment comment);
	
	void deleteComment(int commentNo);
	
	List<Comment> getCommentByUserNo(Map<String, Integer> commentMap);
	
	List<Comment> getAllCommentRemoveByUserNo(Map<String, Integer> commentMap);
	
	void updateComment(Comment comment);
	
	void updateSubComment(SubComment subComment);
	
	Comment getCommentByCommentNo(int commentNo);
	
	List<SubComment> getSubCommentByCommentNo(int commentNo);
	
	SubComment getSubCommentBySubCommentNo(int subcommentNo);
	
	void insertSubComment(SubComment subComment);
	
	void deleteSubComment(int subcommentNo);
	
	
	
	// 채널 커뮤니티 탭 게시글 댓글 부분...
	
	void insertCmnt(CmntBoard cmnt);
	void insertCmntComment(CmntComment cmntComment);
	
	List<CmntBoard> getCmntByChannelNo (int channelNo);
	List<CmntComment> getAllCmntComment();
	
	List<ChannelCmntUserDto> getChannelCmntUserByChannelNo(int channelNo);

	ChannelCmntUserDto getChannelCmntUserByCmntNo(int cmntNo);
	
	CmntComment getCmntCommentsByCmntNo(int cmntNo);
	
	List<CmntCommentUserDto> getCmntCommentsUserByCmntNo(int cmntNo);
	
	void updateCmntByCmntNo(CmntBoard cmntBoard);
	
	void deleteCmntByCmntNo(int cmntNo);
	
	void updateCmntComment(CmntComment cmntComment);
	
	void deleteCmntComment(int cmntCommentNo);
	
	void deleteCmntCommentAll(int cmntNo);
	
	CmntCommentUserDto getCmntCommentsUserByCmntCommentNo(int cmntNo);
	
	CmntBoard getCmntByCmntNo(int cmntNo);
	
	
	
	
}
