package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Thumbnails")
public class Thumbnails {

	private int videoNo;
	private int cateNo;
	private String videoTitle;
	private int videoView;
	private Date videoCreateDate;
	private String videoPublic;
	private String videoGrade;
	private String videoTag;
	private String videoContent;
	private int videoPathNo;
	private String videoPath;
	private String videoThumbnail;
	private int channelNo;
	private String channelTitle;
	private String channelContent;
	private int userNo;
	private String userName;
	private String userImagePath;
	
	public Thumbnails() {}

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

	public int getVideoView() {
		return videoView;
	}

	public void setVideoView(int videoView) {
		this.videoView = videoView;
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

	public String getVideoThumbnail() {
		return videoThumbnail;
	}

	public void setVideoThumbnail(String videoThumbnail) {
		this.videoThumbnail = videoThumbnail;
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
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}
	
	public String getBeforeTime() {
		
		if(videoCreateDate == null) {
			return "";
		}
		Date now = new Date();
		long nowTime = now.getTime();
		long createTime = videoCreateDate.getTime();
		
		long gap = nowTime - createTime;
		
		long min = 60*1000;
		long hour = min*60;
		long day = hour*24;
		long week = day*7;
		long month = day*30;
		long year = day*365;
		
		if(gap < hour) {
			return gap/min + "분 전";
		}else if(gap < day) {
			return gap/hour + "시간 전";
		}else if(gap < week) {
			return gap/day + "일 전";
		}else if(gap < month) {
			return gap/week + "주 전";
		}else if(gap < year) {
			return gap/month + "달 전";
		}else {
			return gap/year + "년 전";
		}
	}

}
