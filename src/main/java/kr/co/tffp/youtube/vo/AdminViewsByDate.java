package kr.co.tffp.youtube.vo;


import org.apache.ibatis.type.Alias;

@Alias("adminViewsByDate")
public class AdminViewsByDate {
	private int videoNo;
	private int userNo;
	private String viewsCreateDate;
	private int count;
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getViewsCreateDate() {
		return viewsCreateDate;
	}
	public void setViewsCreateDate(String viewsCreateDate) {
		this.viewsCreateDate = viewsCreateDate;
	}
	@Override
	public String toString() {
		return "AdminViewsByDate [videoNo=" + videoNo + ", userNo=" + userNo + ", viewsCreateDate=" + viewsCreateDate
				+ ", count=" + count + "]";
	}
	
	
}
