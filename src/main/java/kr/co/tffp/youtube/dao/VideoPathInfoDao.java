package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.vo.VideoPathInfo;


public interface VideoPathInfoDao {

	List<HomeThumbnaildto> getAllHomeThumbnails(Map<String, Object> param);
	
	void insertVideoPath(VideoPathInfo video);
	
	VideoPathInfo getVideoPathByVideoNo (int videoNo);
	
	List<HomeThumbnaildto> getHomeThumnailsByUserNo (int userNo);

	List<HomeThumbnaildto> getHomeThumnailsByChannelNo(int channelNo);
	
	List<HomeThumbnaildto> getHomeThumnailsByChannelNoLike(int channelNo);
	
	HomeThumbnaildto BestViewVideoByChannelNo(int channelNo);
	
	void deleteVideoPath (int videoNo);
}
