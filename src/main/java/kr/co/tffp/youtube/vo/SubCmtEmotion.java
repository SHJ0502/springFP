package kr.co.tffp.youtube.vo;

public class SubCmtEmotion {

	private int subcommentNo;
	private int userNo;
	private String subEmotion;
	
	public int getSubcommentNo() {
		return subcommentNo;
	}
	public void setSubcommentNo(int subcommentNo) {
		this.subcommentNo = subcommentNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getSubEmotion() {
		return subEmotion;
	}
	public void setSubEmotion(String subEmotion) {
		this.subEmotion = subEmotion;
	}
	@Override
	public String toString() {
		return "SubCmtEmotion [subcommentNo=" + subcommentNo + ", userNo=" + userNo + ", subEmotion=" + subEmotion
				+ "]";
	}
	
	
	
	
}
