package kr.co.tffp.youtube.vo;

import java.util.Date;

import kr.co.tffp.youtube.utils.DateUtils;

public class SubComment {

	private int no;
	private int commentNo;
	private int userNo;
	private String content;
	private Date createDate;
	private boolean isModify;
	private boolean isReport;
	private String imagePath;
	private int likeAmount;
	private String userName;
	
	public SubComment() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	

	public boolean isModify() {
		return isModify;
	}

	public void setModify(boolean isModify) {
		this.isModify = isModify;
	}

	public boolean isReport() {
		return isReport;
	}

	public void setReport(boolean isReport) {
		this.isReport = isReport;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getLikeAmount() {
		return likeAmount;
	}

	public void setLikeAmount(int likeAmount) {
		this.likeAmount = likeAmount;
	}

	public String getBeforeTime() {
		return DateUtils.getBeforeTime(createDate);
	}
	
	@Override
	public String toString() {
		return "SubComment [no=" + no + ", commentNo=" + commentNo + ", userNo=" + userNo + ", content=" + content
				+ ", createDate=" + createDate + ", isModify=" + isModify + ", isReport=" + isReport + ", imagePath="
				+ imagePath + ", likeAmount=" + likeAmount + ", userName=" + userName + "]";
	}

	
	
	

	

	
	
	
	
}
