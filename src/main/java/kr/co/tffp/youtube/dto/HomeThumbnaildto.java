package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("HomeThumbnaildto")
public class HomeThumbnaildto {

	private int no;
	private int videoNo;
	private String path;
	private String image;
	private int userNo;
	private int cateNo;
	private int channelNo;
	private String title;
	private Date createDate;
	private String grade;
	private char videoPublic;
	private String tag;
	private int views;
	private String channelTitle;
	private String channelTag;
	private String artPath;
	private String content;
	private String userName;
	private String userImagePath;	
	
	public HomeThumbnaildto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
	
	
	public char getVideoPublic() {
		return videoPublic;
	}

	public void setVideoPublic(char videoPublic) {
		this.videoPublic = videoPublic;
	}

	public String getBeforeTime() {
		if (createDate == null) {
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
