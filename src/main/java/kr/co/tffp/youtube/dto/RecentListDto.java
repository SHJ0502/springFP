package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("RecentListDto")
public class RecentListDto {

	private int videoNo;
	private int cateNo;
	private String videoTitle;
	private int videoViews;
	private Date videoCreateDate;
	private String videoPublic;
	private String videoGrade;
	private String videoTag;
	private String videoContents;
	private int videoPathNo;
	private String videoPath;
	private String videoImage;
	private Date recentDate;
	private int channelNo;
	private String channelTitle;
	private String channelTag;
	private String channelArtPath;
	private String channelContent;
	private int userNo;
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private Date userCreateDate;
	private Date userBirthDay;
	private String userImagePath;
	
	public RecentListDto() {}

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

	public int getVideoViews() {
		return videoViews;
	}

	public void setVideoViews(int videoViews) {
		this.videoViews = videoViews;
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

	public String getVideoContents() {
		return videoContents;
	}

	public void setVideoContents(String videoContents) {
		this.videoContents = videoContents;
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

	public Date getRecentDate() {
		return recentDate;
	}

	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
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

	public String getChannelTag() {
		return channelTag;
	}

	public void setChannelTag(String channelTag) {
		this.channelTag = channelTag;
	}

	public String getChannelArtPath() {
		return channelArtPath;
	}

	public void setChannelArtPath(String channelArtPath) {
		this.channelArtPath = channelArtPath;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}

	public Date getUserBirthDay() {
		return userBirthDay;
	}

	public void setUserBirthDay(Date userBirthDay) {
		this.userBirthDay = userBirthDay;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}
	
	public String getBeforeTime() {
		Date now = new Date();
		long nowTime = now.getTime();
		long createTime = videoCreateDate.getTime();
		long gap = nowTime - createTime;
		
		long minute = 60*1000;
		long hour = minute*60;
		long day = hour*24;
		long week = day*7;
		long month = day*30;
		long year = day*365;
		
		if(gap < hour) {
			return gap/minute + "분 전";
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
