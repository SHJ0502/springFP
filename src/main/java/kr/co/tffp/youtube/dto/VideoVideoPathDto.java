package kr.co.tffp.youtube.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("VideoVideoPathDto")
public class VideoVideoPathDto {

	private int videoNo;
	private int userNo;
	private int cateNo;
	private int channelNo;
	private String channelTitle;
	private String videoTitle;
	private int videoViews;
	private Date videoCreateDate;
	private String videoPublic;
	private String videoGrade;
	private String videoTag;
	private String videoContents;
	private String videoPath;
	private String videoThumbnail;
	
	public VideoVideoPathDto() {}

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

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
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

	public String getFormatDate() {
		if (videoCreateDate == null) {
			return "";
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy. M. dd");
		
		return sdf.format(videoCreateDate);
		
	}
	
	public String getBeforeTime() {
		if (videoCreateDate == null) {
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
		long createTime = videoCreateDate.getTime();
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
	
	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	@Override
	public String toString() {
		return "VideoVideoPathDto [videoNo=" + videoNo + ", userNo=" + userNo + ", cateNo=" + cateNo + ", channelNo="
				+ channelNo + ", channelTitle=" + channelTitle + ", videoTitle=" + videoTitle + ", videoViews="
				+ videoViews + ", videoCreateDate=" + videoCreateDate + ", videoPublic=" + videoPublic + ", videoGrade="
				+ videoGrade + ", videoTag=" + videoTag + ", videoContents=" + videoContents + ", videoPath="
				+ videoPath + ", videoThumbnail=" + videoThumbnail + "]";
	}

	
	
	
	
	
	
}
