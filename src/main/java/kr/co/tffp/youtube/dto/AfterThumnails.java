package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("AfterThumnails")
public class AfterThumnails {

	private int watchLateNo;
	private Date afterDate;
	private int videoNo;
	private int cateNo;
	private String videoTitle;
	private String videoviews;
	private Date videoCreateDate;
	private String videoPublic;
	private String videoGrade;
	private String videoTag;
	private String videoContent;
	private int videoPathNo;
	private String videoPath;
	private String videoImage;
	private int channelNo;
	private String channelTitle;
	private String channelContent;

	public AfterThumnails() {}

	public int getWatchLateNo() {
		return watchLateNo;
	}

	public void setWatchLateNo(int watchLateNo) {
		this.watchLateNo = watchLateNo;
	}

	public Date getAfterDate() {
		return afterDate;
	}

	public void setAfterDate(Date afterDate) {
		this.afterDate = afterDate;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getVideoviews() {
		return videoviews;
	}

	public void setVideoviews(String videoviews) {
		this.videoviews = videoviews;
	}

	public Date getVideoCreateDate() {
		return videoCreateDate;
	}

	public void setVideoCreateDate(Date videoCreateDate) {
		this.videoCreateDate = videoCreateDate;
	}

	public String getVideoPublic() {
		return videoPublic;
	}

	public void setVideoPublic(String videoPublic) {
		this.videoPublic = videoPublic;
	}

	public String getVideoGrade() {
		return videoGrade;
	}

	public void setVideoGrade(String videoGrade) {
		this.videoGrade = videoGrade;
	}

	public String getVideoTag() {
		return videoTag;
	}

	public void setVideoTag(String videoTag) {
		this.videoTag = videoTag;
	}

	public String getVideoContent() {
		return videoContent;
	}

	public void setVideoContent(String videoContent) {
		this.videoContent = videoContent;
	}

	public int getVideoPathNo() {
		return videoPathNo;
	}

	public void setVideoPathNo(int videoPathNo) {
		this.videoPathNo = videoPathNo;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getVideoImage() {
		return videoImage;
	}

	public void setVideoImage(String videoImage) {
		this.videoImage = videoImage;
	}

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
	}

	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getChannelContent() {
		return channelContent;
	}

	public void setChannelContent(String channelContent) {
		this.channelContent = channelContent;
	};
	
public String getBeforeTime() {
		
		Date now = new Date();
		long nowTime = now.getTime();
		long createTime = videoCreateDate.getTime();
		
		long min = 60*1000;
		long hour = min*60;
		long day = hour*24;
		long week = day*7;
		long month = day*30;
		long year = day*365;
		long gap = nowTime - createTime;
		
		if(gap < hour) {
			return gap/min + "분 전";
		} else if(gap < day) {
			return gap/hour + "시간 전";
		} else if(gap < week) {
			return gap/day + "일 전";
		} else if(gap < month) {
			return gap/week + "주 전";
		} else if(gap < year) {
			return gap/month + "달 전";
		} else {
			return gap/year + "년 전";
		}
	}
	
	
}
