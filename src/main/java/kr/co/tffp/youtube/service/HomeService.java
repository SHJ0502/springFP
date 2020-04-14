package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.HomeSearchDto;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.vo.Channel;



@Transactional
public interface HomeService {
	
	List<HomeThumbnaildto> getHomeThumbnail(Map<String, Object> param);
	Channel getChannelNoByUserNo(int userNo);
	HomeSearchDto getSearchDto(String keyword);

}
