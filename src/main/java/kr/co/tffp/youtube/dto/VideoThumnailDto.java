package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("VideoThumnailDto")
public class VideoThumnailDto {

	private int videoNo;
	private int userNo;
	private int cateNo;
	private int channelNo;
	private String title;
	private int views;
	private Date createDate;	
	private String videoPublic;
	private String grade;
	private String tag;
	private String content;
	private int pathNo;
	private String path;
	private String image;
	private String channelTitle;
	
	public VideoThumnailDto() {}

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getVideoPublic() {
		return videoPublic;
	}

	public void setVideoPublic(String videoPublic) {
		this.videoPublic = videoPublic;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPathNo() {
		return pathNo;
	}

	public void setPathNo(int pathNo) {
		this.pathNo = pathNo;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getBeforeTime() {
		if(createDate == null) {
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
		long createTime = createDate.getTime();
		long gap = nowTime - createTime;
		
		if(gap < hour) {
			return gap/minute + "분 전";
		} else if(gap < day) {
			return gap/hour + "시간 전";
		} else if(gap < week) {
			return gap/day + "일 전";
		} else if(gap < month) {
			return gap/week + "주 전";
		} else if(gap < year){
			return gap/month + "개월 전";
		} else {
			return gap/year + "년 전";
		}
	}
	
}
