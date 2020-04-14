package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.ChannelDao;
import kr.co.tffp.youtube.dao.VideoDao;
import kr.co.tffp.youtube.dao.VideoPathInfoDao;
import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.dto.HomeSearchDto;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.VideoThumnailDto;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.Video;


@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private VideoPathInfoDao videoPathInfoDao;
	
	@Autowired
	private ChannelDao channelDao;
	
	@Autowired
	private VideoDao videoDao;

	@Override
	public List<HomeThumbnaildto> getHomeThumbnail(Map<String, Object> param) {
		
		List<HomeThumbnaildto> homeThumbnail = videoPathInfoDao.getAllHomeThumbnails(param);
		
		return homeThumbnail;
	}

	@Override
	public Channel getChannelNoByUserNo(int userNo) {
		
		channelDao.getChannelByUserNo(userNo);
		
		return null;
	}

	@Override
	public HomeSearchDto getSearchDto(String keyword) {
		
		List<ChannelUserDto> channels = channelDao.getChannelByKeyword(keyword);
		List<VideoThumnailDto> videos = videoDao.getVideoByKeyword(keyword);
		
		HomeSearchDto homeSearchDto = new HomeSearchDto();
		homeSearchDto.setKeyword(keyword);
		homeSearchDto.setChannels(channels);
		homeSearchDto.setVideos(videos);
		
		return homeSearchDto;
	}
	
	
	
}
