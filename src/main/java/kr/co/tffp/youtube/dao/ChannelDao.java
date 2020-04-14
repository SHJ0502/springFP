package kr.co.tffp.youtube.dao;

import java.util.List;

import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.vo.Channel;

public interface ChannelDao {

	void insertChannel(Channel channel);
	
	void updateChannel(Channel channel);
	
	int getChannelNo();
	
	Channel getChannelByNo(int no);
	
	Channel getChannelByUserNo(int userNo);
	
	Channel getChannelByChannelNo(int channelNo);
	
	ChannelUserDto getChannelUserBychannelNo (int channelNo);
	
	List<ChannelUserDto> getChannelByKeyword(String keyword);
	
	List<Channel> getAllChannel();
} 
