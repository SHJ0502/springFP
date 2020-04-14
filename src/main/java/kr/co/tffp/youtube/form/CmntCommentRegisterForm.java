package kr.co.tffp.youtube.form;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("CmntCommentRegisterForm")
public class CmntCommentRegisterForm {

	private int cmntCommentNo;
	private int cmntNo;
	private String cmntComment;
	private Date cmntCommentCreateDate;
	private int userNo;
	
	public CmntCommentRegisterForm() {}

	public String getCmntComment() {
		return cmntComment;
	}

	public void setCmntComment(String cmntComment) {
		this.cmntComment = cmntComment;
	}

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

	public Date getCmntCommentCreateDate() {
		return cmntCommentCreateDate;
	}

	public void setCmntCommentCreateDate(Date cmntCommentCreateDate) {
		this.cmntCommentCreateDate = cmntCommentCreateDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "CmntCommentRegisterForm [cmntCommentNo=" + cmntCommentNo + ", cmntNo=" + cmntNo + ", cmntComment="
				+ cmntComment + ", cmntCommentCreateDate=" + cmntCommentCreateDate + ", userNo=" + userNo + "]";
	}
	
	
}
