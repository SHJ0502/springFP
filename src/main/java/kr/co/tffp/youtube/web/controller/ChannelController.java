package kr.co.tffp.youtube.web.controller;





import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tffp.youtube.dto.ChannelCmntUserDto;
import kr.co.tffp.youtube.dto.ChannelUserDto;
import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.dto.HomeThumbnaildto;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.form.ChannelRegisterForm;
import kr.co.tffp.youtube.form.UserRegisterForm;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.CommentService;
import kr.co.tffp.youtube.service.CommunityEmotionService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.UserService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.Subscribe;
import kr.co.tffp.youtube.vo.User;


@Controller
@RequestMapping("/mychannel")
public class ChannelController {
	
	private final String  artPathSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\images\\channelImage";
	private final String photoSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\images\\photo";
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private	 VideoService videoService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommunityEmotionService cmntEmotionService;
	
	
	@GetMapping("/test.hta")
	public String test() {
		return "mychannel/test";
	}
	
	// 마이채널 홈페이지 출력
	@GetMapping("/mychannel_main.hta")
	public String mychannelMain (HttpSession session, Model model, @RequestParam("channelno") int channelNo) {
		
		User user = (User) session.getAttribute("LU");
		
		if (user == null) {
			List<HomeThumbnaildto> videoVideoPath = videoService.getHomeThumnailsByChannelNo(channelNo);
			model.addAttribute("videoThumbnails", videoVideoPath);
			
			List<HomeThumbnaildto> videoVideoPathLike = videoService.getHomeThumnailsByChannelNoLike(channelNo);
			model.addAttribute("videoThumbnailsLike", videoVideoPathLike);
			
			HomeThumbnaildto bestViewVideo = videoService.BestViewVideoByChannelNo(channelNo);
			model.addAttribute("bestViewVideo", bestViewVideo);
			
			
			
		} else {
			Channel loginUserChannel = channelService.getChannelByUserNo(user.getNo());
			int loginUserChannelNo = loginUserChannel.getNo();
			model.addAttribute("loginUserChannelNo", loginUserChannelNo);
			
			if (loginUserChannelNo == channelNo) {
				List<HomeThumbnaildto> videoVideoPath = videoService.getHomeThumnailsByChannelNo(loginUserChannelNo);
				model.addAttribute("videoThumbnails", videoVideoPath);
				
				List<HomeThumbnaildto> videoVideoPathLike = videoService.getHomeThumnailsByChannelNoLike(loginUserChannelNo);
				model.addAttribute("videoThumbnailsLike", videoVideoPathLike);
				
				HomeThumbnaildto bestViewVideo = videoService.BestViewVideoByChannelNo(loginUserChannelNo);
				model.addAttribute("bestViewVideo", bestViewVideo);
				
				
			} else {
				List<HomeThumbnaildto> videoVideoPath = videoService.getHomeThumnailsByChannelNo(channelNo);
				model.addAttribute("videoThumbnails", videoVideoPath);
				
				List<HomeThumbnaildto> videoVideoPathLike = videoService.getHomeThumnailsByChannelNoLike(channelNo);
				model.addAttribute("videoThumbnailsLike", videoVideoPathLike);
				
				HomeThumbnaildto bestViewVideo = videoService.BestViewVideoByChannelNo(channelNo);
				model.addAttribute("bestViewVideo", bestViewVideo);
				
				Map<String, Object> mapSubscribe = new HashMap<String, Object>();
				mapSubscribe.put("userno", user.getNo());
				mapSubscribe.put("channelno", channelNo);
				
				Subscribe subscribeInfo = subscribeService.getSubscribeByMap(mapSubscribe);
				model.addAttribute("subscribeInfo", subscribeInfo);
				
			}
			
		}	
		Channel channelByUserNoSub = channelService.getChannelByChannelNo(channelNo);
		
		List<HomeSubscribeByUserNo> subscribeUsers = subscribeService.getSubscribeByUserNo(channelByUserNoSub.getUserNo());
		model.addAttribute("subscribeUsers", subscribeUsers);
		
		List<ChannelCmntUserDto> channelCmntUsers = commentService.getChannelCmntUserByChannelNo(channelNo);
		model.addAttribute("cmntusers", channelCmntUsers);
		
		ChannelUserDto channelUserInfo = channelService.getChannelUserBychannelNo(channelNo);
		
		
		int subscribeCount = subscribeService.countsubscribeByChannelNo(channelNo);
		
		
		
		model.addAttribute("subscribeCount", subscribeCount);
		
		model.addAttribute("channelUserInfo", channelUserInfo);
		model.addAttribute("channelNo", channelNo);
		
		
		
		
		return "mychannel/mychannel_main";
			
	}
	
	// 채널아트 수정하기
	@RequestMapping("/artPathModify.hta")
	@ResponseBody
	public String channelModify(ChannelRegisterForm regiForm) throws IOException {
		
		
			Channel channel = channelService.getChannelByChannelNo(regiForm.getNo());
			
			MultipartFile artPathFile = regiForm.getArtPath();
			if(!artPathFile.isEmpty()) {
				String artPathFileName = artPathFile.getOriginalFilename();
				
				
				FileCopyUtils.copy(artPathFile.getBytes(), new File(artPathSaveDirectory, artPathFileName));
				
				channel.setArtPath(artPathFileName);
				
				channelService.updateChannel(channel);
				
			}
			
		
				return "success";
	}
	
	// 채널아트 삭제하기
	@RequestMapping("/artPathDelete.hta")
	@ResponseBody
	public String channelDelete(ChannelRegisterForm regiForm) {
		
		try {
			
			Channel channel = channelService.getChannelByChannelNo(regiForm.getNo());
			
			channel.setArtPath("");
			
			channelService.updateChannel(channel);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	
	//업로드 페이지 출력
	@GetMapping("/mychannel_upload.hta")
	public String mychannelUpload (HttpSession session, Model model, @RequestParam("channelno") int channelNo) {
		
		User user = (User) session.getAttribute("LU");
		
		if(user == null) {
			
			return "/user/user/loginform";
			
		} else {
			
			List<VideoVideoPathDto> videoVideoPath = videoService.getVideoVideoPathByUserNo(user.getNo());
			model.addAttribute("videoVideoPathInfo", videoVideoPath);
		}
		
		
		return "mychannel/mychannel_upload";
	}
	
	//프로필사진수정
	@RequestMapping("userImgModify.hta")
	@ResponseBody
	public String userModify(UserRegisterForm regiForm, HttpSession session) {
		
		User user = (User) session.getAttribute("LU");
		
		try {
			
			MultipartFile userImgFile = regiForm.getUserImagePath();
			if(!userImgFile.isEmpty()) {
				String userImgFileName = userImgFile.getOriginalFilename();
				
				FileCopyUtils.copy(userImgFile.getBytes(), new File(photoSaveDirectory, userImgFileName));
				
				user.setUserImagePath(userImgFileName);
				
				userService.updateUser(user);
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return "success";
	}
	
	@RequestMapping("userImgDel.hta")
	@ResponseBody
	public String userImgDel (HttpSession session) {
		User user = (User) session.getAttribute("LU");
		
		try {
			user.setUserImagePath("");
			userService.updateUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	//구독생성
	@RequestMapping("/addSubscribe.hta")
	@ResponseBody
	public void insertSubscribe(@RequestParam("channelNo") int channelNo, HttpSession session) {
		
		User logineduser = (User) session.getAttribute("LU");
		int loginedUserNo = logineduser.getNo();
		
		Map<String, Object> mapSubscribe = new HashMap<String, Object>();
		mapSubscribe.put("userno", loginedUserNo);
		mapSubscribe.put("channelno", channelNo);
		
		subscribeService.addSubscribe(mapSubscribe);
		
	}
	
	//구독삭제
	@RequestMapping("/cancelSubscribe.hta")
	@ResponseBody
	public void deleteSubscribe(@RequestParam("channelNo") int channelNo, HttpSession session) {
		
		User logineduser = (User) session.getAttribute("LU");
		int loginedUserNo = logineduser.getNo();
		
		Map<String, Object> mapSubscribe = new HashMap<String, Object>();
		mapSubscribe.put("userno", loginedUserNo);
		mapSubscribe.put("channelno", channelNo);
		
		subscribeService.deleteSubscribe(mapSubscribe);
	}
	
	@RequestMapping("/changeEmotion.hta")
	@ResponseBody
	public Map<String, Object> changeLike(@RequestParam("cmntNo") int cmntNo, @RequestParam("emotion")  String emotion, @RequestParam("work") String work, HttpSession session) {
		
		User logineduser = (User) session.getAttribute("LU");
		int loginedUserNo = logineduser.getNo();
		
		Map<String, Object> mapEmotion = new HashMap<String, Object>();
		
		mapEmotion.put("userNo", loginedUserNo);
		mapEmotion.put("channelCmntNo", cmntNo);
		mapEmotion.put("communityEmotion", emotion);
		mapEmotion.put("work", work);
		
		
		return cmntEmotionService.changeEmntEmotion(mapEmotion);
		
	}
	
	// 채널 설명 변경/등록
	@RequestMapping("/channelModify.hta")
	@ResponseBody
	public Map<String, Object> channelModifyAdd(ChannelRegisterForm regiForm ) {
		
		Map<String, Object> mapChannel = new HashMap<String, Object>();
		
		Channel channel = channelService.getChannelByChannelNo(regiForm.getNo());
		channel.setChannelContent(regiForm.getChannelContent());
		
		channelService.updateChannel(channel);
		
		Channel channelUpdate = channelService.getChannelByChannelNo(channel.getNo());
		
		mapChannel.put("success", "success");
		
		mapChannel.put("channelUpdate", channelUpdate);
		
		return mapChannel;
	}
}
