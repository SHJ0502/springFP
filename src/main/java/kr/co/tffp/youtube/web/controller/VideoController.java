package kr.co.tffp.youtube.web.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.dto.VideoWatchLateDto;
import kr.co.tffp.youtube.form.VideoRegisterForm;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.service.WatchLateService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.User;
import kr.co.tffp.youtube.vo.Video;
import kr.co.tffp.youtube.vo.VideoPathInfo;
import kr.co.tffp.youtube.websocket.NoticeWebSocketHandler;

@Controller
@RequestMapping("/mychannel")
public class VideoController {

	private final String thumbnailSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\images\\thumbnail";
	private final String  videoSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\videos";
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	NoticeWebSocketHandler noticeWebSocketHandler;

	
	
	@RequestMapping("/videoUpload.hta")
	@ResponseBody
	public Map<String, Object> videoUpload(VideoRegisterForm regiForm, HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			User user = (User) session.getAttribute("LU");
			Channel channel = channelService.getChannelByUserNo(user.getNo());
			
			int videoNo = videoService.getVideoNo();
			
			
			Video video = new Video();
			video.setNo(videoNo);
			video.setCateNo(regiForm.getVideoCategory());
			video.setChannelNo(channel.getNo());
			video.setGrade(regiForm.getVideoGrade());
			video.setStatus(regiForm.getVideoStatus());
			video.setContents(regiForm.getVideoContent());
			video.setTag(regiForm.getVideoTag());
			video.setTitle(regiForm.getVideoTitle());
			video.setUserNo(user.getNo());
			
			VideoPathInfo videoPathInfo = new VideoPathInfo();
			videoPathInfo.setVideoNo(videoNo);
			
			MultipartFile thumbnailFile = regiForm.getVideoThumbnail();
			MultipartFile videoFile = regiForm.getVideoFile();
			
			if (!videoFile.isEmpty()) {
				String thumbnailFilename = thumbnailFile.getOriginalFilename();
				String videoFilename = videoFile.getOriginalFilename();
				
				FileCopyUtils.copy(thumbnailFile.getBytes(), new File(thumbnailSaveDirectory, thumbnailFilename));
				FileCopyUtils.copy(videoFile.getBytes(), new File(videoSaveDirectory, videoFilename));
				
				videoPathInfo.setImage(thumbnailFilename);
				videoPathInfo.setPath(videoFilename);
			}
			
			videoService.addVideo(video);
			videoService.addVideoPathInfo(videoPathInfo);
			
			VideoVideoPathDto videoVideoPathInfo = videoService.getVideoVideoPathByVideoNo(video.getNo());

			
			map.put("videoVideoPathInfo", videoVideoPathInfo);
			map.put("result", "success");
			noticeWebSocketHandler.sendMessage("RECENT:" + video.getTitle());
		} catch (Exception  e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
	
	
	@RequestMapping("/addWatchLate.hta")
	@ResponseBody
	public int addWatchLate(@RequestParam("no") int videoNo , HttpSession session) {
		
		User user = (User)session.getAttribute("LU");
		
		if(user == null) {
			return -1;
		}
		
		VideoWatchLateDto videoDto = new VideoWatchLateDto();
		
		System.out.println("들어옴");
			List<Integer> watchlateDto = videoService.getallwatchLateList(user.getNo());
			
			
			videoDto.setVideoNo(videoNo);
			videoDto.setUserNo(user.getNo());
			Map<String, Object> watchLateInfoMap = new HashMap<String, Object>();
			
			if(watchlateDto.contains(videoNo)) {
				
				watchLateInfoMap.put("userNo", user.getNo());
				watchLateInfoMap.put("videoNo", videoNo);
				videoService.deleteWatchLate(watchLateInfoMap);
			
				return 2;
			};

			videoService.addWatchLate(videoDto);
		
		return 1;
	}
	
	@RequestMapping("/addPlayListVideo.hta")
	@ResponseBody
	public int addPlayListVideo(@RequestParam("no") int videoNo) {
		PlayListDto playListDto = new PlayListDto();
		
		//모달창을 통해 플레이 리스트 값받자@@@@@@@@@@@@@@@@@
		playListDto.setVideoNo(videoNo);
		videoService.addPlayList(playListDto);
		
		return 1;
	}
	
	@RequestMapping("/getAllVideoList.hta")
	@ResponseBody
	public List<Video> getAllVideoList(){
		
		List<Video> vlist = videoService.getAllVideoList();
		
		
		return vlist;
	}
	
	@RequestMapping("/getAllVideoList1.hta")
	@ResponseBody
	public List<VideoVideoPathDto> getAllVideoList1(){
		List<VideoVideoPathDto> vList = videoService.AllVideoCateMusic();
		
		return vList;
	}
	@RequestMapping("/getAllVideoList2.hta")
	@ResponseBody
	public List<VideoVideoPathDto> getAllVideoList2(){
		List<VideoVideoPathDto> vList = videoService.AllVideoCateSport();
		
		return vList;
	}
	@RequestMapping("/getAllVideoList3.hta")
	@ResponseBody
	public List<VideoVideoPathDto> getAllVideoList3(){
		List<VideoVideoPathDto> vList = videoService.AllVideoCateGame();
		
		return vList;
	}
	@RequestMapping("/getAllVideoList4.hta")
	@ResponseBody
	public List<VideoVideoPathDto> getAllVideoList4(){
		List<VideoVideoPathDto> vList = videoService.AllVideoCateMovie();	
		return vList;
	}
	
	// 동영상 삭제
	
	// 동영상 수정
	@RequestMapping("/getVideoInfoByVideoNo.hta")
	@ResponseBody
	public VideoVideoPathDto getVideoInfoByVideoNo (@RequestParam("videoNo") int videoNo) {
		
		VideoVideoPathDto videoVideoInfo = videoService.getVideoVideoPathByVideoNo(videoNo);
		
		return videoVideoInfo;
		
	}
	
	@RequestMapping("/videoUploadModify.hta")
	@ResponseBody
	public Map<String, Object> videoModify(VideoRegisterForm regiForm) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		
		Video video = videoService.getVideoByNo(regiForm.getVideoNo());
		video.setTitle(regiForm.getVideoTitle());
		video.setContents(regiForm.getVideoContent());
		video.setGrade(regiForm.getVideoGrade());
		video.setStatus(regiForm.getVideoStatus());
		video.setCreateDate(date);
		
		videoService.updateVideo(video);
		
		VideoVideoPathDto videoVideoPath = videoService.getVideoVideoPathByVideoNo(video.getNo());
		
		map.put("videoVideoPathInfo", videoVideoPath);
		
		return map;
		
	}
	
	
	@RequestMapping("/getVideoByUserNo.hta")
	@ResponseBody
	public List<Video> getVideoByUserNo(@RequestParam("userNo") int userNo){
		
		return videoService.getVideosByUserNo(userNo);
	}
	
	@RequestMapping("/videoDel.hta")
	@ResponseBody
	public int deleteVideo(@RequestParam("videoNoCheck[]") List<String> videoNoArr) throws Exception {
		
		
		int result = 0;
		int videoNum = 0;
		
		for (String i : videoNoArr) {
			videoNum = Integer.parseInt(i);
			videoService.deleteVideo(videoNum);
			videoService.deleteVideoPath(videoNum);
			
			
		}
		result = 1;
		
		return result;
	}
	
	
}
