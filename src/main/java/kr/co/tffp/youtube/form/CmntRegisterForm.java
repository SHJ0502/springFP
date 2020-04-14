package kr.co.tffp.youtube.form;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("CmntRegisterForm")
public class CmntRegisterForm {

	private int cmntNo;
	private int channelNo;
	private String cmntTitle;
	private String cmntContent;
	private Date cmntCreateDate;
	private MultipartFile cmntFilePath;
	
	public CmntRegisterForm () {}

	public int getCmntNo() {
		return cmntNo;
	}

	public void setCmntNo(int cmntNo) {
		this.cmntNo = cmntNo;
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

	public MultipartFile getCmntFilePath() {
		return cmntFilePath;
	}

	public void setCmntFilePath(MultipartFile cmntFilePath) {
		this.cmntFilePath = cmntFilePath;
	}
	
	
}
