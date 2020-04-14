package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("Subscribe")
public class Subscribe {

	private int no;
	private int userNo;
	private int channelNo;
	
	public Subscribe() {}

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

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
	};
	
	
}
