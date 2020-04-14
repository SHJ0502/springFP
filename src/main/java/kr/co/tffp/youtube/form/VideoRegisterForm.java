package kr.co.tffp.youtube.form;

import org.springframework.web.multipart.MultipartFile;

public class VideoRegisterForm {

	private int videoNo;
	private String videoTitle;
	private String videoContent;
	private char videoStatus;
	private char videoGrade;
	private int videoCategory;
	private String videoTag;
	
	private MultipartFile videoThumbnail;
	private MultipartFile videoFile;
	
	public VideoRegisterForm() {}

	
	
	public int getVideoNo() {
		return videoNo;
	}



	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}



	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public String getVideoContent() {
		return videoContent;
	}

	public void setVideoContent(String videoContent) {
		this.videoContent = videoContent;
	}

	public char getVideoStatus() {
		return videoStatus;
	}

	public void setVideoStatus(char videoStatus) {
		this.videoStatus = videoStatus;
	}

	public char getVideoGrade() {
		return videoGrade;
	}

	public void setVideoGrade(char videoGrade) {
		this.videoGrade = videoGrade;
	}

	public int getVideoCategory() {
		return videoCategory;
	}

	public void setVideoCategory(int videoCategory) {
		this.videoCategory = videoCategory;
	}

	public String getVideoTag() {
		return videoTag;
	}

	public void setVideoTag(String videoTag) {
		this.videoTag = videoTag;
	}

	public MultipartFile getVideoThumbnail() {
		return videoThumbnail;
	}

	public void setVideoThumbnail(MultipartFile videoThumbnail) {
		this.videoThumbnail = videoThumbnail;
	}

	public MultipartFile getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}
	
	
}
