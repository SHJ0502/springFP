package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.CommentDao;
import kr.co.tffp.youtube.dto.ChannelCmntUserDto;
import kr.co.tffp.youtube.dto.CmntCommentUserDto;
import kr.co.tffp.youtube.vo.CmntBoard;
import kr.co.tffp.youtube.vo.CmntComment;
import kr.co.tffp.youtube.vo.Comment;
import kr.co.tffp.youtube.vo.SubComment;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;

	@Override
	public List<Comment> getCommentsVideo(int videoNo) {
		List<Comment> comments = commentDao.getCommentByVideoNo(videoNo);
		return comments;
	}

	@Override
	public List<Comment> getComments() {
		List<Comment> comments = commentDao.getAllComment();
		
		return comments;
	}

	@Override
	public List<Comment> getCommentsUser(Map<String, Integer> commentMap) {
		List<Comment> comments = commentDao.getCommentByUserNo(commentMap);
		
		return comments;
	}
	


	@Override
	public void commentInsert(Comment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public void commentUpdate(Comment comment) {
		commentDao.updateComment(comment);
	}

	@Override
	public Comment getCommentByCommentNo(int commentNo) {
		
		Comment comment = commentDao.getCommentByCommentNo(commentNo);
		
		return comment;
	}

	@Override
	public void commentDelete(int commentNo) {
		commentDao.deleteComment(commentNo);
	}

	@Override
	public List<Comment> getCommentRemoveUserNo(Map<String, Integer> commentMap) {
		List<Comment> comment = commentDao.getAllCommentRemoveByUserNo(commentMap);
		return comment;
	}

	@Override
	public List<SubComment> getSubCommentCommentNo(int commentNo) {
		List<SubComment> subComments = commentDao.getSubCommentByCommentNo(commentNo);
		return subComments;
	}

	@Override
	public void subCommentInsert(SubComment subComment) {
		commentDao.insertSubComment(subComment);
	}

	@Override
	public void subCommentDelete(int subcommentNo) {
		commentDao.deleteSubComment(subcommentNo);
		
	}

	@Override
	public void insertCmnt(CmntBoard cmnt) {
		commentDao.insertCmnt(cmnt);
	}

	@Override
	public void insertCmntComment(CmntComment cmntCommnet) {
		commentDao.insertCmntComment(cmntCommnet);
	}

	@Override
	public List<CmntBoard> getCmntByChannelNo(int channelNo) {
		return commentDao.getCmntByChannelNo(channelNo);
	}

	@Override
	public List<CmntComment> getAllCmntComment() {
		return commentDao.getAllCmntComment();
	}

	@Override
	public List<ChannelCmntUserDto> getChannelCmntUserByChannelNo(int channelNo) {
		
		List<ChannelCmntUserDto> channelCmntUsers = commentDao.getChannelCmntUserByChannelNo(channelNo);
		return channelCmntUsers;
	}

	@Override
	public CmntComment getCmntCommentsByCmntNo(int cmntNo) {
		
		CmntComment cmntComment = commentDao.getCmntCommentsByCmntNo(cmntNo);
		
		return cmntComment;
	}

	@Override
	public void subCommentUpdate(SubComment subComment) {
		commentDao.updateSubComment(subComment);
		
	}

	@Override
	public SubComment getSubCommentSubCommentNo(int subcommentNo) {
		SubComment subComment = commentDao.getSubCommentBySubCommentNo(subcommentNo);
		return subComment;
	}

	@Override
	public List<CmntCommentUserDto> getCmntCommentsUserByCmntNo(int cmntNo) {
		List<CmntCommentUserDto> cmntCommentsUser = commentDao.getCmntCommentsUserByCmntNo(cmntNo);
		return cmntCommentsUser;
	}

	@Override
	public void updateCmntByCmntNo(CmntBoard cmntBoard) {
		commentDao.updateCmntByCmntNo(cmntBoard);
	}

	

	@Override
	public void updateCmntComment(CmntComment cmntComment) {
		commentDao.updateCmntComment(cmntComment);
	}

	@Override
	public void deleteCmntByCmntNo(int cmntNo) {
		commentDao.deleteCmntByCmntNo(cmntNo);
	}

	@Override
	public void deleteCmntComment(int cmntCommentNo) {
		commentDao.deleteCmntComment(cmntCommentNo);
	}

	@Override
	public void deleteCmntCommentAll(int cmntNo) {
		commentDao.deleteCmntCommentAll(cmntNo);
	}

	@Override
	public CmntCommentUserDto getCmntCommentsUserByCmntCommentNo(int cmntNo) {
		return commentDao.getCmntCommentsUserByCmntCommentNo(cmntNo);
	}

	@Override
	public ChannelCmntUserDto getChannelCmntUserByCmntNo(int cmntNo) {
		return commentDao.getChannelCmntUserByCmntNo(cmntNo);
	}

	@Override
	public CmntBoard getCmntByCmntNo(int cmntNo) {
		return commentDao.getCmntByCmntNo(cmntNo);
	}

	

	


	

	

	
	
	

}
