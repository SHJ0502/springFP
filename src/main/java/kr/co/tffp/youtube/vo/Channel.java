package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("Channel")
public class Channel {

	private int  no;
	private int userNo;
	private String title;
	private String tag;
	private String artPath;
	private String channelContent;
	
	public Channel () {}

	
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getArtPath() {
		return artPath;
	}

	public void setArtPath(String artPath) {
		this.artPath = artPath;
	}

	public String getChannelContent() {
		return channelContent;
	}

	public void setChannelContent(String channelContent) {
		this.channelContent = channelContent;
	}


	@Override
	public String toString() {
		return "Channel [no=" + no + ", userNo=" + userNo + ", title=" + title + ", tag=" + tag + ", artPath=" + artPath
				+ ", channelContent=" + channelContent + "]";
	}
	
	
	
}
