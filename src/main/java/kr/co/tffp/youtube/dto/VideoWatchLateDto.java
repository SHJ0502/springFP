package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("videowatchlateDto")
public class VideoWatchLateDto {
	
	private int no;
	private int userNo;
	private int videoNo;
	private Date createDate;
	private boolean isinclude;
	
	
	
	public boolean isIsinclude() {
		return isinclude;
	}
	public void setIsinclude(boolean isinclude) {
		this.isinclude = isinclude;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getVideoNo() {
		return videoNo;
	}
	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
