package kr.co.tffp.youtube.web.advice;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.User;

@ControllerAdvice
public class YoutubeControllerAdvice {

	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private PlayListService playlistService;
	
	@ModelAttribute
	public void leftSideSubscribe(HttpSession session, Model model) {
		
		
		  User loginedUser = (User) session.getAttribute("LU");
		  
		  if(loginedUser != null) { int loginedUserNo = loginedUser.getNo();
		  List<HomeSubscribeByUserNo> homeSubscribe =
		  subscribeService.getSubscribeByUserNo(loginedUserNo); int loginedSubSize =
		  subscribeService.countSubscribe(loginedUserNo);
		  List<PlayList> sidePlay = playlistService.getMyList(loginedUserNo);
		  model.addAttribute("homesubscribe", homeSubscribe);
		  model.addAttribute("sideplay", sidePlay);
		  model.addAttribute("subsize", loginedSubSize); }
		 
		
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
}
