package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("VideoEmotion")
public class VideoEmotion {

	private int userNo;
	private int videoNo;
	private String videoEmtion;
	
	public VideoEmotion() {}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public String getVideoEmtion() {
		return videoEmtion;
	}

	public void setVideoEmtion(String videoEmtion) {
		this.videoEmtion = videoEmtion;
	}

	@Override
	public String toString() {
		return "VideoEmotion [userNo=" + userNo + ", videoNo=" + videoNo + ", videoEmtion=" + videoEmtion + "]";
	}
	
	
	
	
}
