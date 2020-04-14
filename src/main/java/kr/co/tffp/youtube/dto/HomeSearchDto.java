package kr.co.tffp.youtube.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;


@Alias("HomeSearchDto")
public class HomeSearchDto {

	private String keyword;
	private List<VideoThumnailDto> videos;
	private List<ChannelUserDto> channels;
	
	public HomeSearchDto() {}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<VideoThumnailDto> getVideos() {
		return videos;
	}

	public void setVideos(List<VideoThumnailDto> videos) {
		this.videos = videos;
	}

	public List<ChannelUserDto> getChannels() {
		return channels;
	}

	public void setChannels(List<ChannelUserDto> channels) {
		this.channels = channels;
	}	
	
}
