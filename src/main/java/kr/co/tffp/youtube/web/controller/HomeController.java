package kr.co.tffp.youtube.web.controller;

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

import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.dto.HomeSearchDto;
import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.VideoThumnailDto;
import kr.co.tffp.youtube.service.CateService;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.HomeService;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.vo.Categories;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.User;


@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	@Autowired
	private ChannelService  channelService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private CateService categoryService;
	
	@Autowired
	private PlayListService playListService;
	
	@GetMapping("/home.hta")
	public String home(Model model, HttpSession session) {
				
		/*
		 * 
		 * model.addAttribute("thumbnails", thumbnail);
		 */
		
		User loginedUser = (User) session.getAttribute("LU");
			
		if(loginedUser != null) {
				
			int loginedUserNo = loginedUser.getNo();
			Channel loginedUserChannel = channelService.getChannelByUserNo(loginedUserNo);
			int loginedChannelNo = loginedUserChannel.getNo();
			List<PlayList> playlists = playListService.getMyList(loginedUserNo);
			
			model.addAttribute("loginUserChannelNo", loginedChannelNo);
			model.addAttribute("playlists", playlists);
		}
							 
		return "home";
	}
	
	@GetMapping("/hot.hta")
	public String hot(@RequestParam(value = "cateno", required = false, defaultValue = "0") int cateNo, Model model) {
			System.out.println(cateNo);	
		if(cateNo != 0) {
			
			Categories cate = categoryService.getCateNameByCateNo(cateNo);
			model.addAttribute("cate", cate);
		}
		
		List<HomeThumbnaildto> hotList = videoService.hotBasicList(cateNo);
		model.addAttribute("hotlist", hotList);
		
		return "hot";
	}
	
	@RequestMapping("/homelist.hta")
	@ResponseBody
	public List<HomeThumbnaildto> homeList(@RequestParam("begin") int begin, @RequestParam("end") int end) {

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("begin", begin);
		param.put("end", end);
		List<HomeThumbnaildto> thumbnail = homeService.getHomeThumbnail(param);
		
		return thumbnail;
	}

	@GetMapping("/search.hta")
	public String mainSearch(Model model, @RequestParam("keyword") String keyword) {
		
		HomeSearchDto searchDto = homeService.getSearchDto(keyword);
		List<VideoThumnailDto> videos = searchDto.getVideos();
		List<ChannelUserDto> channels = searchDto.getChannels();
		
		model.addAttribute("videos", videos);
		model.addAttribute("channels", channels);
		
		return "search";
	}

	
}
