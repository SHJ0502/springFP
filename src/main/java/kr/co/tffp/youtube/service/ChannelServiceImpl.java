package kr.co.tffp.youtube.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.ChannelDao;
import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.vo.Channel;

@Service
public class ChannelServiceImpl implements ChannelService{

	@Autowired
	private ChannelDao channelDao;
	
	@Override
	public boolean addNewChannel(Channel channel) {
		
		Channel preChanner = channelDao.getChannelByNo(channel.getNo());
		
		if(preChanner != null) {
			
			return false;
			
		}
		
		channelDao.insertChannel(channel);
		
		return true;
	}

	@Override
	public Channel getChannelByNo(int no) {
		return channelDao.getChannelByNo(no);
	}

	@Override
	public int getChannelNo() {
		return channelDao.getChannelNo();
	}

	@Override
	public Channel getChannelByUserNo(int userNo) {
		
		return channelDao.getChannelByUserNo(userNo);
	}

	@Override
	public List<Channel> getAllChannel() {
		
		List<Channel> channels = channelDao.getAllChannel();
		
		
		return channels;
	}

	@Override
	public Channel getChannelByChannelNo(int channelNo) {
		return channelDao.getChannelByChannelNo(channelNo);
	}

	@Override
	public ChannelUserDto getChannelUserBychannelNo(int channelNo) {
		return channelDao.getChannelUserBychannelNo(channelNo);
		
	}

	@Override
	public void updateChannel(Channel channel) {
		
		channelDao.updateChannel(channel);
		System.out.println("asdasd");
	}

}
