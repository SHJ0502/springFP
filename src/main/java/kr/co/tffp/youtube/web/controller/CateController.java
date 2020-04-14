package kr.co.tffp.youtube.web.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.Subscribe;
import kr.co.tffp.youtube.vo.User;
import kr.co.tffp.youtube.vo.Video;


@Controller
public class CateController {
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private PlayListService playListService;
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@GetMapping("/music_cate.hta")
	public String musiccate(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("LU");
		if(user != null) {
			int loginedUserNo = user.getNo();			
			Channel channel = channelService.getChannelByUserNo(10045);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userno", loginedUserNo);
			param.put("channelno", channel.getNo());
			Subscribe ExistSubscribe = subscribeService.getSubscribeByMap(param);
			
			model.addAttribute("channel", channel);
			model.addAttribute("existsubscribe", ExistSubscribe);
		}
		
		List<Video> videos = videoService.getAllVideoList();
		model.addAttribute("videos", videos);
		return "music_cate";
	}
	@GetMapping("/sport_cate.hta")
	public String sportcate(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("LU");
		if(user != null) {
			int loginedUserNo = user.getNo();			
			Channel channel = channelService.getChannelByUserNo(10045);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userno", loginedUserNo);
			param.put("channelno", channel.getNo());
			Subscribe ExistSubscribe = subscribeService.getSubscribeByMap(param);
			
			model.addAttribute("channel", channel);
			model.addAttribute("existsubscribe", ExistSubscribe);
		}
		
		List<Video> videos = videoService.getAllVideoList();
		model.addAttribute("videos", videos);
		return "sport_cate";
	}
	@GetMapping("/game_cate.hta")
	public String gamecate(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("LU");
		if(user != null) {
			int loginedUserNo = user.getNo();			
			Channel channel = channelService.getChannelByUserNo(10045);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userno", loginedUserNo);
			param.put("channelno", channel.getNo());
			Subscribe ExistSubscribe = subscribeService.getSubscribeByMap(param);
			
			model.addAttribute("channel", channel);
			model.addAttribute("existsubscribe", ExistSubscribe);
		}
		
		List<Video> videos = videoService.getAllVideoList();
		model.addAttribute("videos", videos);
		return "game_cate";
	}
	@GetMapping("/movie_cate.hta")
	public String moviecate(Model model, HttpSession session) {
		
		User user = (User)session.getAttribute("LU");
		if(user != null) {
			int loginedUserNo = user.getNo();			
			Channel channel = channelService.getChannelByUserNo(10045);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userno", loginedUserNo);
			param.put("channelno", channel.getNo());
			Subscribe ExistSubscribe = subscribeService.getSubscribeByMap(param);
			
			model.addAttribute("channel", channel);
			model.addAttribute("existsubscribe", ExistSubscribe);
		}
		
		List<Video> videos = videoService.getAllVideoList();
		model.addAttribute("videos", videos);
		return "movie_cate";
	}
	
	@RequestMapping("/getPlayList.hta")
	@ResponseBody
	public Map<String, Object> getPlayList(@RequestParam("videoNo") int videoNo, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("LU");
		List<PlayList> playList = new ArrayList<PlayList>();
		List<Integer> playListNo = new ArrayList<Integer>();
		
		if(user == null) {
			return null;
		}
		
		if(user != null) {			
			playList = playListService.getMyList(user.getNo());
			playListNo = playListService.getPlayListNoInVideo(videoNo);
			
			for(PlayList pl : playList) {
				if(playListNo.contains(pl.getNo())) {
					pl.setIstrue(true);
				}
			}
		}
			
		//넘버 불러오는 xml 생성
		map.put("playList", playList);
		map.put("playListNo", playListNo);
		
		return map;
	}
	
	@RequestMapping("/addPlayList.hta")
	@ResponseBody
	public PlayList addPlayList(@RequestParam("text") String text,HttpSession session) throws Exception {
		
		User user = (User)session.getAttribute("LU");
		
		if(user != null) {
			
			List<PlayList> totalMyList = playListService.getMyList(user.getNo());
				
			for(PlayList playlist : totalMyList) {
				if(playlist.getTitle().equals(text)) {
					return null;
				}
			}
			
			PlayList playList = new PlayList();
			playList.setUserNo(user.getNo());
			playList.setTitle(text);
			
			playListService.addPlayList(playList);
			
			return playList;
		}else {
			return null;
		}
	}
	
	@RequestMapping("addPlayListVideo.hta")
	@ResponseBody
	public int addPlayListVideo(@RequestParam("plNo") int playListNo,@RequestParam("videono") int videoNo ) {
		
		System.out.println("아아아아아");
		
		PlayListDto playlistDto = new PlayListDto();
		playlistDto.setVideoNo(videoNo);
		playlistDto.setPlaylistNo(playListNo);
		
		playListService.addPlayListVideo(playlistDto);
		return 1;
	}
	
	@RequestMapping("removePlayListVideo.hta")
	@ResponseBody
	public int removePlayListVideo(@RequestParam("plNo") int playListNo,@RequestParam("videono") int videoNo ) {
		
		System.out.println("들어온다");
		PlayListDto playlistDto = new PlayListDto();
		playlistDto.setVideoNo(videoNo);
		playlistDto.setPlaylistNo(playListNo);
		
		playListService.removePlayListVideo(playlistDto);
		
		return 1;
	}
	
	@GetMapping("/addWatchLate.hta")
	public String saveWatchLate(@RequestParam("no") int videoNo) {
		
		Video video = videoService.getVideoByNo(videoNo);
		
		return "music_cate";
	}

}
