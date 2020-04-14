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

import kr.co.tffp.youtube.dto.AfterThumnails;
import kr.co.tffp.youtube.dto.GoodListByUserNo;
import kr.co.tffp.youtube.dto.PlaylistVideoDto;
import kr.co.tffp.youtube.dto.RecentListDto;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.service.RecentVideoService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.VideoEmotionService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.service.WatchLateService;
import kr.co.tffp.youtube.vo.User;
import kr.co.tffp.youtube.vo.VideoEmotion;
import kr.co.tffp.youtube.vo.WatchLate;


@Controller
@RequestMapping("/box")
public class BoxController {
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private WatchLateService watchLateService;
	
	@Autowired
	private VideoEmotionService videoEmotionService;
	
	@Autowired
	private RecentVideoService recentVideoService;
	
	@Autowired
	private PlayListService playlistService;
	
	@GetMapping("/boxmain.hta")
	public String boxmain(HttpSession session, Model model) {
		
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int userNo = loginedUser.getNo();
			
			int countupload = videoService.countVideoByUserNo(userNo);
			int countgood = videoService.countVideoEmotionByUserNo(userNo);
			int countsubscribe = subscribeService.countSubscribe(userNo);
			List<AfterThumnails> after = watchLateService.getAfterByUserNo(userNo);
			int countAfter = watchLateService.countAfterByUserNo(userNo);
			List<GoodListByUserNo> goodList = videoService.getGoodByUserNo(userNo);
			List<RecentListDto> recentList = recentVideoService.getRecentDtoByUserNo(userNo);
			
			model.addAttribute("loginedUser", loginedUser);
			model.addAttribute("countupload", countupload);				
			model.addAttribute("afters", after);		
			model.addAttribute("goodList", goodList);
			model.addAttribute("countgood", countgood);
			model.addAttribute("countsubscribe", countsubscribe);
			model.addAttribute("countAfter", countAfter);
			model.addAttribute("recentList", recentList);
			System.out.println(countsubscribe);
		}
						
		return "box/boxmain";
	}
	
	@GetMapping("/new.hta")
	public String newVideo(HttpSession session, Model model) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			List<RecentListDto> recentList = recentVideoService.getRecentDtoByUserNo(loginedUserNo);
			
			model.addAttribute("recentlist", recentList);
		}
		
		return "box/new";
	}
	
	@RequestMapping("/newlist.hta")
	@ResponseBody
	public Map<String, Object> newList(HttpSession session) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			List<RecentListDto> todayList = recentVideoService.getToday(loginedUserNo);
			List<RecentListDto> yesterdayList = recentVideoService.getYesterday(loginedUserNo);
			List<RecentListDto> weekList = recentVideoService.getWeek(loginedUserNo);
			List<RecentListDto> monthList = recentVideoService.getMonth(loginedUserNo);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("todays", todayList);
			result.put("yesterdays", yesterdayList);
			result.put("weeks", weekList);
			result.put("months", monthList);
			
			return result;
		}
		return null;
	}
	
	@RequestMapping("/delrecent.hta")
	@ResponseBody
	public String delRecent(HttpSession session, @RequestParam("videono") int videoNo) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("videono", videoNo);
			param.put("userno", loginedUserNo);
			
			recentVideoService.delRecent(param);
			
			return "delrecent";
		}
		
		return null;
	}
	
	@GetMapping("/after.hta")	
	public String afterVideo(HttpSession session, Model model) {
			User loginedUser = (User) session.getAttribute("LU");
			
			if(loginedUser != null) {
				int loginedUserNo = loginedUser.getNo();
				
				List<AfterThumnails> list = watchLateService.getAfterByUserNo(loginedUserNo);
				
				model.addAttribute("al", list);
			}
		return "box/after";
	}
	
	@RequestMapping("/countafter.hta")
	@ResponseBody
	public String countAfter(HttpSession session) {
		
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			int countAfter = watchLateService.countAfterByUserNo(loginedUserNo);
			String stringCountAfter = Integer.toString(countAfter);
			
			return stringCountAfter;
		}
		
		return null;
	}
	
	@RequestMapping("/listafter.hta")
	@ResponseBody
	public List<AfterThumnails> listAfter(HttpSession session) {
		User loginedUser = (User)session.getAttribute("LU");			
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			List<AfterThumnails> afterList = watchLateService.getAfterByUserNo(loginedUserNo);			
			
			return afterList;
		}
		
		return null;
	}
	
	@RequestMapping("/addafter.hta")
	@ResponseBody
	public String addAfter(HttpSession session, @RequestParam("videono") int videoNo) {
		
		User loginedUser = (User) session.getAttribute("LU");
		if(loginedUser != null) {
			
			int loginedUserNo = loginedUser.getNo();
			
			Map<String, Object> after = new HashMap<String, Object>();
			after.put("userno", loginedUserNo);
			after.put("videono", videoNo);
			
			WatchLate watchLate = watchLateService.getafterByMap(after);

			if (watchLate != null) {	
				
				watchLateService.delAfter(after);
				return "dup";
			} else {
				watchLateService.addAfter(after);				
				return "save";
			}
		}
		return null;
	}
	
	@RequestMapping("/delAfter.hta")
	@ResponseBody
	public String delAfter(@RequestParam("videono") int videoNo, HttpSession session) {
		
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			Map<String, Object> delafter = new HashMap<String, Object>();
			delafter.put("videono", videoNo);
			delafter.put("userno", loginedUserNo);
			
			watchLateService.delAfter(delafter);
			
			return "success";
		}
		
		return null;
	}
	
	@RequestMapping("/aftersort.hta")
	@ResponseBody
	public List<AfterThumnails> afterSort(@RequestParam("sort") String sort, HttpSession session) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userno", loginedUserNo);
			param.put("sort", sort);
			
			List<AfterThumnails> afterList = watchLateService.getAfterListBymap(param);
			
			return afterList;
		}
		
		
		return null;
	}
	
	@GetMapping("/good.hta")
	public String goodVideo(HttpSession session, Model model) {		

		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			List<GoodListByUserNo> list = videoService.getGoodByUserNo(loginedUserNo);
			
			model.addAttribute("gl", list);
		}
		return "box/good";
	}
	
	@RequestMapping("/goodlist.hta")
	@ResponseBody
	public List<GoodListByUserNo> goodList(HttpSession session) {
		
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginUserNo = loginedUser.getNo();
			
			List<GoodListByUserNo> goodlist = videoService.getGoodByUserNo(loginUserNo);
			
			return goodlist;
		}
		
		return null;
	}
	
	@RequestMapping("/updategood.hta")
	@ResponseBody
	public String updateGood(HttpSession session, @RequestParam("videono") int videoNo) {
		User loginedUser = (User) session.getAttribute("LU");
		 if(loginedUser != null) {
			 int loginedUserNo = loginedUser.getNo();
			 
			 VideoEmotion emotion = new VideoEmotion();
			 emotion.setUserNo(loginedUserNo);
			 emotion.setVideoNo(videoNo);
			 emotion.setVideoEmtion("D");
			 
			 
			 
			 videoEmotionService.updateVideoEmotion(emotion);
			 
			 return "삭제 완료";
		 }
		return null;
	}
	
	@RequestMapping("/countgood.hta")
	@ResponseBody
	public String countGood(HttpSession session) {
		
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			
			int loginedUserNo = loginedUser.getNo();
			
			int countgood = videoService.countVideoEmotionByUserNo(loginedUserNo);
			String stringCountGood = Integer.toString(countgood);
			
			return stringCountGood;
		}
		
		
		return null;
	}
	
	@GetMapping("/playlist.hta")
	public String playList(HttpSession session, @RequestParam("playlistno") int playlistNo, Model model) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			
			List<PlaylistVideoDto> plv = playlistService.getPlaylistVideoByListNo(playlistNo);
			model.addAttribute("plv", plv);
			model.addAttribute("playListNo", playlistNo);
			
			return "/box/playlist";
		}
		
		return null;
	}
}
