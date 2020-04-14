package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.Thumbnails;
import kr.co.tffp.youtube.dto.VideoThumnailDto;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.dto.VideoWatchLateDto;
import kr.co.tffp.youtube.vo.Video;
import kr.co.tffp.youtube.vo.Views;

public interface VideoDao {

	void insertVideo(Video video);
	
	Video getVideoByNo(int videoNo);
	
	
	List<Video> getVideosByUserNo(int userNo);
	
	List<VideoThumnailDto> getVideoByKeyword(String keyword);
	
	List<VideoVideoPathDto> getVideoVideoPathByUserNo(int userNo);
	
	int getVideoNo();
	int countVideoByUserNo(int userNo);
	
	List<Video> getVideoListByCateNo(int cateNo);
	
	List<Video> getAllVideoList();
	
	List<VideoVideoPathDto> getAllVideoVideoPathDto();
	
	VideoVideoPathDto getVideoVideoPathByVideoNo(int videoNo);
	
	void insertWatchLate(VideoWatchLateDto videowatchlateDto);
	void insertPlayListVideo(Map<String, Integer> playlistvideo);

	void insertPlayList(PlayListDto playListDto);
	
	List<HomeThumbnaildto> getHotThumbnails(int cateNo);
	
	List<Thumbnails> getTodayUpload(int userNo);
	List<Thumbnails> getYesterdayUpload(int userNo);
	List<Thumbnails> getweekUpload(int userNo);
	List<Thumbnails> getMonthUpload(int userNo);

	void updateVideo(Video video);

	void deleteVideo(int videoNo);
	
	void insertViews(Views views);
	
	
	List<VideoVideoPathDto> getVideoRemoveByNo (int videoNo);

	List<Video> getVideoListBySubject(String text);

	List<VideoVideoPathDto> AllVideoCateMusic();

	List<VideoVideoPathDto> AllVideoCateSport();

	List<VideoVideoPathDto> AllVideoCateGame();

	List<VideoVideoPathDto> AllVideoCateMovie();
	
	
}
