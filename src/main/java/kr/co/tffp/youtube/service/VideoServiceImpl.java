package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.VideoDao;
import kr.co.tffp.youtube.dao.VideoEmotionDao;
import kr.co.tffp.youtube.dao.VideoPathInfoDao;
import kr.co.tffp.youtube.dao.WatchLateDao;
import kr.co.tffp.youtube.dto.GoodListByUserNo;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.dto.VideoWatchLateDto;
import kr.co.tffp.youtube.vo.Video;
import kr.co.tffp.youtube.vo.VideoPathInfo;
import kr.co.tffp.youtube.vo.Views;

@Service("VideoService")
public class VideoServiceImpl implements VideoService{

	@Autowired
	private VideoDao videoDao;
	@Autowired
	private VideoPathInfoDao videoPathInfoDao;
	@Autowired
	private VideoEmotionDao videoEmotionDao;
	
	@Autowired
	private WatchLateDao watchLateDao;
		
	@Override
	public void addVideo(Video video) {
		videoDao.insertVideo(video);
		
	}

	@Override
	public void addVideoPathInfo(VideoPathInfo videoPathInfo) {
		videoPathInfoDao.insertVideoPath(videoPathInfo);
	}

	@Override
	public List<Video> getVideosByUserNo(int userNo) {
		return videoDao.getVideosByUserNo(userNo);
	}

	@Override
	public VideoPathInfo getVideoPathInfoByNo(int videoNo) {
		return videoPathInfoDao.getVideoPathByVideoNo(videoNo);
	}

	@Override
	public int getVideoNo() {
		return videoDao.getVideoNo();
	}

	@Override
	public Video getVideoByNo(int videoNo) {
		
		Video video = videoDao.getVideoByNo(videoNo);
		
		return video;
	}

	@Override
	public List<Video> getVideoListCateNo(int cateNo) {
		
		List<Video> videos = videoDao.getVideoListByCateNo(cateNo);
		
		return videos;
	}

	@Override
	public List<Video> getAllVideoList() {
		List<Video> videos = videoDao.getAllVideoList();
		
		return videos;
	}
	
	@Override
	public List<VideoVideoPathDto> AllVideoVideoPathList() {
		List<VideoVideoPathDto> videoPaths = videoDao.getAllVideoVideoPathDto();
		return videoPaths;
	}

	@Override
	public void addWatchLate(VideoWatchLateDto videowatchlateDto) {
		videoDao.insertWatchLate(videowatchlateDto);
	}

	@Override
	public void addPlayList(PlayListDto playListDto) {
		videoDao.insertPlayList(playListDto);
		
	}

	@Override
	public List<VideoVideoPathDto> getVideoVideoPathByUserNo(int userNo) {
		
		List<VideoVideoPathDto> videoVideoPath = videoDao.getVideoVideoPathByUserNo(userNo);
		
		return videoVideoPath;
	}

	@Override
	public List<HomeThumbnaildto> getHomeThumnailsByUserNo(int userNo) {
		
		List<HomeThumbnaildto> homeThumbnailDto = videoPathInfoDao.getHomeThumnailsByUserNo(userNo);
		
		return homeThumbnailDto;
	}

	@Override
	public List<HomeThumbnaildto> getHomeThumnailsByChannelNo(int channelNo) {
		
		List<HomeThumbnaildto> homeThumbnailDtoByChannelNo = videoPathInfoDao.getHomeThumnailsByChannelNo(channelNo);
		
		return homeThumbnailDtoByChannelNo;
	}

	@Override
	public List<HomeThumbnaildto> hotBasicList(int cateNo) {
		
		List<HomeThumbnaildto> hotList = videoDao.getHotThumbnails(cateNo);
		
		return hotList;
	}

	@Override
	public int countVideoByUserNo(int userNo) {

		int countVideo = videoDao.countVideoByUserNo(userNo);
		
		return countVideo;
	}

	@Override
	public int countVideoEmotionByUserNo(int userNo) {
		
		int countEmotion = videoEmotionDao.countVideoEmotionByUserNo(userNo);
		
		return countEmotion;
	}

	@Override
	public List<GoodListByUserNo> getGoodByUserNo(int userNo) {
		
		List<GoodListByUserNo> goodList = videoEmotionDao.getEmotionVideoByUserNo(userNo);
		
		return goodList;
	}

	@Override
	public List<Integer> getallwatchLateList(int no) {
		
		List<Integer> watchlateList = watchLateDao.getwatchlateList(no);
		
		return watchlateList;
		
	}

	@Override
	public void deleteWatchLate(Map<String, Object> watchLateInfoMap) {

		watchLateDao.deletewatchLate(watchLateInfoMap);
		
	}

	@Override
	public VideoVideoPathDto getVideoVideoPathByVideoNo(int videoNo) {
		
		return videoDao.getVideoVideoPathByVideoNo(videoNo);
		
	}

	@Override
	public void updateVideo(Video video) {
		videoDao.updateVideo(video);
	}

	@Override
	public void deleteVideo(int videoNo) {
		videoDao.deleteVideo(videoNo);
	}

	@Override
	public int getTotalViewsCount(int userNo) {
		
		List<Video> videos = getVideosByUserNo(userNo);
		
		System.out.println(videos);
		
		int totalViews = 0;
		
		for(Video video : videos) {
			totalViews += video.getViews();
		}
		
		System.out.println(totalViews);
		
		return totalViews;
	}

	@Override
	public List<VideoVideoPathDto> getVideoRemoveByNo(int videoNo) {
		List<VideoVideoPathDto> videoRemoveByNo = videoDao.getVideoRemoveByNo(videoNo);
		
		return videoRemoveByNo;
	}

	@Override
	public void deleteVideoPath(int videoNo) {
		videoPathInfoDao.deleteVideoPath(videoNo);
	}

	@Override
	public void insertViews(Views views) {
		videoDao.insertViews(views);
	}
	
	@Override
	public List<HomeThumbnaildto> getHomeThumnailsByChannelNoLike(int channelNo) {
		List<HomeThumbnaildto> videoVideoPathLike = videoPathInfoDao.getHomeThumnailsByChannelNoLike(channelNo);
		return videoVideoPathLike;
	}

	@Override
	public HomeThumbnaildto BestViewVideoByChannelNo(int channelNo) {
		return videoPathInfoDao.BestViewVideoByChannelNo(channelNo);
	}

	@Override
	public List<Video> getVideoListBySubject(String text) {
		return videoDao.getVideoListBySubject(text);
	}

	@Override
	public List<VideoVideoPathDto> AllVideoCateMusic() {
		
		return videoDao.AllVideoCateMusic();
	}

	@Override
	public List<VideoVideoPathDto> AllVideoCateSport() {
		return videoDao.AllVideoCateSport();
	}

	@Override
	public List<VideoVideoPathDto> AllVideoCateGame() {
		// TODO Auto-generated method stub
		return videoDao.AllVideoCateGame();
	}

	@Override
	public List<VideoVideoPathDto> AllVideoCateMovie() {
		// TODO Auto-generated method stub
		return videoDao.AllVideoCateMovie();
	}


	

}
