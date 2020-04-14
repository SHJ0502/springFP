package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Comment")
public class Comment {

	private int no;
	private int videoNo;
	private int userNo;
	private String content;
	private Date createDate;
	private String imagePath;
	private String userName;
	private int likeAmount;
	private int cnt;
	
	public Comment() {}
	
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
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getLikeAmount() {
		return likeAmount;
	}

	public void setLikeAmount(int likeAmount) {
		this.likeAmount = likeAmount;
	}

	@Override
	public String toString() {
		return "Comment [no=" + no + ", videoNo=" + videoNo + ", userNo=" + userNo + ", content=" + content
				+ ", createDate=" + createDate + ", imagePath=" + imagePath + ", userName=" + userName + ", likeAmount="
				+ likeAmount + ", cnt=" + cnt + "]";
	}

	

	
	

	
	
	
}
