package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("qna")
public class Qna {
	
	private int no;
	private int userNo;
	private String title;
	private String text;
	private Date createDate;
	private String isanswered;
	private String image;
	private String userId;

	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getIsanswered() {
		return isanswered;
	}
	public void setIsanswered(String isanswered) {
		this.isanswered = isanswered;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Qna [title=" + title + ", text=" + text + "]";
	}
	
	
	
	
	
}
