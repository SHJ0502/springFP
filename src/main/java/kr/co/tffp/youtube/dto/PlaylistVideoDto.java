package kr.co.tffp.youtube.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("PlaylistVideoDto")
public class PlaylistVideoDto {

	private String plvVideoCreateDate;
	private int playlistNo;
	private String playlistTitle;
	private String playlistSubtitle;
	private int videoNo;
	private int cateNo;
	private String videoTitle;
	private int videoViews;
	private Date videoCreateDate;
	private String videoPublic;
	private String videoGrade;
	private String videoTag;
	private String videoContents;
	private int likeAmount;
	private int channelNo;
	private String channelTitle;
	private String channelTag;
	private String channelArtPath;
	private String channelContent;
	private int userNo;
	private String userName;
	private String userImagePath;
	private int videoPathNo;
	private String videoPath;
	private String videoImage;
	
	public PlaylistVideoDto() {}

	public int getPlaylistNo() {
		return playlistNo;
	}

	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
	}

	public String getPlaylistTitle() {
		return playlistTitle;
	}

	public void setPlaylistTitle(String playlistTitle) {
		this.playlistTitle = playlistTitle;
	}

	public String getPlaylistSubtitle() {
		return playlistSubtitle;
	}

	public void setPlaylistSubtitle(String playlistSubtitle) {
		this.playlistSubtitle = playlistSubtitle;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getVideoTitle() {
		return videoTitle;
	}

	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}

	public int getVideoViews() {
		return videoViews;
	}

	public void setVideoViews(int videoViews) {
		this.videoViews = videoViews;
	}

	public Date getVideoCreateDate() {
		return videoCreateDate;
	}

	public void setVideoCreateDate(Date videoCreateDate) {
		this.videoCreateDate = videoCreateDate;
	}

	public String getVideoPublic() {
		return videoPublic;
	}

	public void setVideoPublic(String videoPublic) {
		this.videoPublic = videoPublic;
	}

	public String getVideoGrade() {
		return videoGrade;
	}

	public void setVideoGrade(String videoGrade) {
		this.videoGrade = videoGrade;
	}

	public String getVideoTag() {
		return videoTag;
	}

	public void setVideoTag(String videoTag) {
		this.videoTag = videoTag;
	}

	public String getVideoContents() {
		return videoContents;
	}

	public void setVideoContents(String videoContents) {
		this.videoContents = videoContents;
	}

	public int getLikeAmount() {
		return likeAmount;
	}

	public void setLikeAmount(int likeAmount) {
		this.likeAmount = likeAmount;
	}

	public int getChannelNo() {
		return channelNo;
	}

	public void setChannelNo(int channelNo) {
		this.channelNo = channelNo;
	}

	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getChannelTag() {
		return channelTag;
	}

	public void setChannelTag(String channelTag) {
		this.channelTag = channelTag;
	}

	public String getChannelArtPath() {
		return channelArtPath;
	}

	public void setChannelArtPath(String channelArtPath) {
		this.channelArtPath = channelArtPath;
	}

	public String getChannelContent() {
		return channelContent;
	}

	public void setChannelContent(String channelContent) {
		this.channelContent = channelContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}

	public int getVideoPathNo() {
		return videoPathNo;
	}

	public void setVideoPathNo(int videoPathNo) {
		this.videoPathNo = videoPathNo;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getVideoImage() {
		return videoImage;
	}

	public void setVideoImage(String videoImage) {
		this.videoImage = videoImage;
	}

	public String getPlvVideoCreateDate() {
		return plvVideoCreateDate;
	}

	public void setPlvVideoCreateDate(String plvVideoCreateDate) {
		this.plvVideoCreateDate = plvVideoCreateDate;
	}
	
	
	
}
