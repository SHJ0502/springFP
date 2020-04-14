package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("ChannelCmntUser")
public class ChannelCmntUserDto {

	private int channelNo;
	private int userNo;
	private String channelTitle;
	private String channelTag;
	private String artPath;
	private String channelContent;
	private int channelCmntNo;
	private String cmntTitle;
	private String cmntContent;
	private Date cmntCreateDate;
	private String cmntFilePath;
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private Date userCreateDate;
	private Date userBirthDay;
	private String userImagePath;
	private int likeCnt;
	private int hateCnt;
	private String emotionCheck;
	
	public ChannelCmntUserDto() {}

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getArtPath() {
		return artPath;
	}

	public void setArtPath(String artPath) {
		this.artPath = artPath;
	}

	public String getChannelContent() {
		return channelContent;
	}

	public void setChannelContent(String channelContent) {
		this.channelContent = channelContent;
	}

	public int getChannelCmntNo() {
		return channelCmntNo;
	}

	public void setChannelCmntNo(int channelCmntNo) {
		this.channelCmntNo = channelCmntNo;
	}

	public String getCmntTitle() {
		return cmntTitle;
	}

	public void setCmntTitle(String cmntTitle) {
		this.cmntTitle = cmntTitle;
	}

	public String getCmntContent() {
		return cmntContent;
	}

	public void setCmntContent(String cmntContent) {
		this.cmntContent = cmntContent;
	}

	public Date getCmntCreateDate() {
		return cmntCreateDate;
	}

	public void setCmntCreateDate(Date cmntCreateDate) {
		this.cmntCreateDate = cmntCreateDate;
	}

	public String getCmntFilePath() {
		return cmntFilePath;
	}

	public void setCmntFilePath(String cmntFilePath) {
		this.cmntFilePath = cmntFilePath;
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
	
	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getHateCnt() {
		return hateCnt;
	}

	public void setHateCnt(int hateCnt) {
		this.hateCnt = hateCnt;
	}

	public String getEmotionCheck() {
		return emotionCheck;
	}

	public void setEmotionCheck(String emotionCheck) {
		this.emotionCheck = emotionCheck;
	}

	public String getBeforeTime() {
		if (cmntCreateDate == null) {
			return "";
		}
		Date date = new Date();
		
		long minute = 60*1000;
		long hour = minute*60;
		long day = hour*24;
		long week = day*7;
		long month = day*30;
		long year = day*365;
		
		long nowTime = date.getTime();
		long createTime = cmntCreateDate.getTime();
		long gap = nowTime - createTime;
	
		
		
		if (gap < hour) {
			
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
