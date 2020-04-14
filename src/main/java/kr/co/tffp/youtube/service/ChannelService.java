package kr.co.tffp.youtube.service;


import java.util.List;

import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.vo.Channel;

public interface ChannelService{

	boolean addNewChannel(Channel channel);
	
	void updateChannel(Channel channel);
	
	int getChannelNo();
	
	Channel getChannelByNo(int no);
	
	Channel getChannelByUserNo(int userNo);
	
	Channel getChannelByChannelNo(int channelNo);
	
	ChannelUserDto getChannelUserBychannelNo (int channelNo);
	
	List<Channel> getAllChannel();
	
	
	
}
