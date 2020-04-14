package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("WatchLate")
public class WatchLate {

	private int watchLateNo;
	private int userNo;
	private int videoNo;
	private Date afterDate;
	
	public WatchLate() {}

	public int getWatchLateNo() {
		return watchLateNo;
	}

	public void setWatchLateNo(int watchLateNo) {
		this.watchLateNo = watchLateNo;
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

	public Date getAfterDate() {
		return afterDate;
	}

	public void setAfterDate(Date afterDate) {
		this.afterDate = afterDate;
	}
	
	
}
