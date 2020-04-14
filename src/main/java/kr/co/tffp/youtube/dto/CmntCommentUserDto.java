package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("CmntCommentUserDto")
public class CmntCommentUserDto {

	private int cmntCommentNo;
	private int cmntNo;
	private String cmntCommentContent;
	private Date cmntCommentCreateDate;
	private int userNo;
	private String userName;
	private String userImagePath;
	
	public CmntCommentUserDto () {}

	public int getCmntCommentNo() {
		return cmntCommentNo;
	}

	public void setCmntCommentNo(int cmntCommentNo) {
		this.cmntCommentNo = cmntCommentNo;
	}

	public int getCmntNo() {
		return cmntNo;
	}

	public void setCmntNo(int cmntNo) {
		this.cmntNo = cmntNo;
	}

	public String getCmntCommentContent() {
		return cmntCommentContent;
	}

	public void setCmntCommentContent(String cmntCommentContent) {
		this.cmntCommentContent = cmntCommentContent;
	}

	public Date getCmntCommentCreateDate() {
		return cmntCommentCreateDate;
	}

	public void setCmntCommentCreateDate(Date cmntCommentCreateDate) {
		this.cmntCommentCreateDate = cmntCommentCreateDate;
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
		if (cmntCommentCreateDate == null) {
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
		long createTime = cmntCommentCreateDate.getTime();
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
