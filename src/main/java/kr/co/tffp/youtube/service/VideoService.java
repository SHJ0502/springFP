package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.dto.GoodListByUserNo;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.dto.VideoWatchLateDto;
import kr.co.tffp.youtube.vo.Video;
import kr.co.tffp.youtube.vo.VideoPathInfo;
import kr.co.tffp.youtube.vo.Views;

@Transactional
public interface VideoService {

	void addVideo(Video video);
	void addVideoPathInfo(VideoPathInfo videoPathInfo);
	void addWatchLate(VideoWatchLateDto videowatchlateDto);
	void addPlayList(PlayListDto playListDto);
	
	List<Video> getVideosByUserNo(int userNo);
	
	List<VideoVideoPathDto> getVideoVideoPathByUserNo(int userNo);
	
	VideoPathInfo getVideoPathInfoByNo(int videoNo);
	
	int getVideoNo();
	int countVideoByUserNo(int userNo);
	int countVideoEmotionByUserNo(int userNo);
	
	Video getVideoByNo(int VideoNo);	
	List<Video> getVideoListCateNo(int cateNo);
	List<Video> getAllVideoList();
	
	List<VideoVideoPathDto> AllVideoVideoPathList();
	
	VideoVideoPathDto getVideoVideoPathByVideoNo(int videoNo);
	
	List<HomeThumbnaildto> getHomeThumnailsByUserNo(int userNo);
	List<HomeThumbnaildto> getHomeThumnailsByChannelNo(int channelNo);
	List<HomeThumbnaildto> getHomeThumnailsByChannelNoLike(int channelNo);
	
	HomeThumbnaildto BestViewVideoByChannelNo(int channelNo);
	
	List<HomeThumbnaildto> hotBasicList(int cateNo);
	List<GoodListByUserNo> getGoodByUserNo(int userNo);
	List<Integer> getallwatchLateList(int no);
	void deleteWatchLate(Map<String, Object> watchLateInfoMap);
	
	void updateVideo (Video video);
	void deleteVideo (int videoNo);
	
	void insertViews(Views views);
	
	void deleteVideoPath (int videoNo);
	int getTotalViewsCount(int userNo);
	
	List<VideoVideoPathDto> getVideoRemoveByNo (int videoNo);
	List<Video> getVideoListBySubject(String text);
	List<VideoVideoPathDto> AllVideoCateMusic();
	List<VideoVideoPathDto> AllVideoCateSport();
	List<VideoVideoPathDto> AllVideoCateGame();
	List<VideoVideoPathDto> AllVideoCateMovie();
	
}
