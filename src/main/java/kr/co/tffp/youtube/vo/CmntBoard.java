package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("CmntBoard")
public class CmntBoard {

	private int channelCmntNo;
	private int channelNo;
	private String cmntTitle;
	private String cmntContent;
	private Date cmntCreateDate;
	private String cmntFilePath;
	private int likeCnt;
	private int hateCnt;
	private String emotionCheck;
	
	public CmntBoard() {}

	public int getChannelCmntNo() {
		return channelCmntNo;
	}

	public void setChannelCmntNo(int channelCmntNo) {
		this.channelCmntNo = channelCmntNo;
	}

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
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
	
	
	
}
