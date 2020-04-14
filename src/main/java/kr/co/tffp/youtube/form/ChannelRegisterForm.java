package kr.co.tffp.youtube.form;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("ChannelRegister")
public class ChannelRegisterForm {

	private int no;
	private int userNo;
	private String title;
	private String tag;
	private String channelContent;
	private MultipartFile artPath;
	
	public ChannelRegisterForm() {}

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

	public MultipartFile getArtPath() {
		return artPath;
	}

	public void setArtPath(MultipartFile artPath) {
		this.artPath = artPath;
	}

	public String getChannelContent() {
		return channelContent;
	}

	public void setChannelContent(String channelContent) {
		this.channelContent = channelContent;
	}
	
	
	
}
