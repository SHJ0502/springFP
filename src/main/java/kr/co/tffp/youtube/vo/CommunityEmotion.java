package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("CommunityEmotion")
public class CommunityEmotion {

	private int channelCmntNo;
	private int userNo;
	private String communityEmotion;
	
	public CommunityEmotion () {}

	public int getChannelCmntNo() {
		return channelCmntNo;
	}

	public void setChannelCmntNo(int channelCmntNo) {
		this.channelCmntNo = channelCmntNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCommunityEmotion() {
		return communityEmotion;
	}

	public void setCommunityEmotion(String communityEmotion) {
		this.communityEmotion = communityEmotion;
	}
	
	
	
}
