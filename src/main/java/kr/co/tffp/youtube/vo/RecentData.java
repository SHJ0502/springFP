package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("recentData")
public class RecentData {
	
	private int userNo;
	private String title;
	private String type;
	private String createdate;
	private int dataNo;
	private String userId;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getDataNo() {
		return dataNo;
	}
	public void setDataNo(int dataNo) {
		this.dataNo = dataNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	
	
	
}
