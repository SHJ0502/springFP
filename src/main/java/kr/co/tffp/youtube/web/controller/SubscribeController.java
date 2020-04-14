package kr.co.tffp.youtube.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tffp.youtube.dto.Thumbnails;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.User;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private ChannelService channelService;
	
	@GetMapping("/subscribe.hta")
	public String mainSubscribe(HttpSession session, Model model) {
		
		
		User loginedUser = (User) session.getAttribute("LU");
		if (loginedUser != null) {
			
			int userNo = loginedUser.getNo();
			
			List<Thumbnails> today = subscribeService.todayUpload(userNo);
			List<Thumbnails> yesterday = subscribeService.yesterdayUpload(userNo);
			List<Thumbnails> week = subscribeService.weekUpload(userNo);
			List<Thumbnails> month = subscribeService.monthUpload(userNo);
			
			model.addAttribute("today", today);
			model.addAttribute("yesterday", yesterday);
			model.addAttribute("week", week);
			model.addAttribute("month", month);
		}
		return "subscribe";
	}
	
	@RequestMapping("getMySubscribeCount.hta")
	@ResponseBody
	private int getMySubscribeCount(@RequestParam("userNo") int userNo) {
		Channel channel = channelService.getChannelByUserNo(userNo);
		return subscribeService.countsubscribeByChannelNo(channel.getNo());
	}
	
}
