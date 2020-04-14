package kr.co.tffp.youtube.vo;

public class CmtEmotion {

	private int commentNo;
	private int userNo;
	private String emotion;
	
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
	
	public String getEmotion() {
		return emotion;
	}
	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}
	
	@Override
	public String toString() {
		return "CmtEmotion [commentNo=" + commentNo + ", userNo=" + userNo + ", emotion=" + emotion + "]";
	}

	
	
	
	
	
}
