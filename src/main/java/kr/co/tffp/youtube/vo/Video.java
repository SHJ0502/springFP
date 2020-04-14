package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Video")
public class Video {

	private int no;
	private int userNo;
	private int cateNo;
	private int channelNo;
	private String title;
	private int views;
	private Date createDate;
	private char status;
	private char grade;
	private String tag;
	private String contents;
	private int likeAmount;
	
	public Video() {}

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

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getLikeAmount() {
		return likeAmount;
	}

	public void setLikeAmount(int likeAmount) {
		this.likeAmount = likeAmount;
	}

	@Override
	public String toString() {
		return "Video [no=" + no + ", userNo=" + userNo + ", cateNo=" + cateNo + ", channelNo=" + channelNo + ", title="
				+ title + ", views=" + views + ", createDate=" + createDate + ", status=" + status + ", grade=" + grade
				+ ", tag=" + tag + ", contents=" + contents + ", likeAmount=" + likeAmount + "]";
	}

	


	

	
	
}
