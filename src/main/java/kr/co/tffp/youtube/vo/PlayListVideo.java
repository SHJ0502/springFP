package kr.co.tffp.youtube.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("PlayListVideo")
public class PlayListVideo {

	private int playlistNo;
	private int videoNo;
	private Date playlistVideoCreateDate;
	
	public PlayListVideo() {}

	public int getPlaylistNo() {
		return playlistNo;
	}

	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public Date getPlaylistVideoCreateDate() {
		return playlistVideoCreateDate;
	}

	public void setPlaylistVideoCreateDate(Date playlistVideoCreateDate) {
		this.playlistVideoCreateDate = playlistVideoCreateDate;
	}
	
	
}
