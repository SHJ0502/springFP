package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("VideoPathInfo")
public class VideoPathInfo {

	private int no;
	private int videoNo;
	private String path;
	private String image;
	
	public VideoPathInfo() {}

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
	
	
}
