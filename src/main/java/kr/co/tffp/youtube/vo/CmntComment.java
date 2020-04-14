package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("CmntComment")
public class CmntComment {

	private int cmntCommentNo;
	private int cmntNo;
	private String cmntComment;
	private Date cmntCommnetDate;
	private int userNo;
	
	public CmntComment() {}

	public int getCmntCommentNo() {
		return cmntCommentNo;
	}

	public void setCmntCommentNo(int cmntCommentNo) {
		this.cmntCommentNo = cmntCommentNo;
	}

	public int getCmntNo() {
		return cmntNo;
	}

	public void setCmntNo(int cmntNo) {
		this.cmntNo = cmntNo;
	}

	public String getCmntComment() {
		return cmntComment;
	}

	public void setCmntComment(String cmntComment) {
		this.cmntComment = cmntComment;
	}

	public Date getCmntCommnetDate() {
		return cmntCommnetDate;
	}

	public void setCmntCommnetDate(Date cmntCommnetDate) {
		this.cmntCommnetDate = cmntCommnetDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
	
	
}
