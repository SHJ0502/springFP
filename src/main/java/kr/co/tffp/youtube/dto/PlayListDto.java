package kr.co.tffp.youtube.dto;

import org.apache.ibatis.type.Alias;

@Alias("playlistdto")
public class PlayListDto {
	
	private int playlistNo;
	private int videoNo;
	
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
	
	
}
