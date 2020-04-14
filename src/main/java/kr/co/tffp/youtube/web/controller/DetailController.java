package kr.co.tffp.youtube.web.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.CmtEmotionService;
import kr.co.tffp.youtube.service.CommentService;
import kr.co.tffp.youtube.service.RecentVideoService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.UserService;
import kr.co.tffp.youtube.service.VideoEmotionService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.CmtEmotion;
import kr.co.tffp.youtube.vo.Comment;
import kr.co.tffp.youtube.vo.RecentVideo;
import kr.co.tffp.youtube.vo.SubCmtEmotion;
import kr.co.tffp.youtube.vo.SubComment;
import kr.co.tffp.youtube.vo.Subscribe;
import kr.co.tffp.youtube.vo.User;
import kr.co.tffp.youtube.vo.Video;
import kr.co.tffp.youtube.vo.VideoEmotion;
import kr.co.tffp.youtube.vo.VideoPathInfo;
import kr.co.tffp.youtube.vo.Views;
import kr.co.tffp.youtube.websocket.NoticeWebSocketHandler;

@Controller
public class DetailController {
	
	

	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private ChannelService channelService;
	@Autowired
	private CmtEmotionService cmtEmotionService;
	@Autowired
	private VideoEmotionService videoEmotionService;
	@Autowired
	private RecentVideoService recentVideoService;
	
	@Autowired
	NoticeWebSocketHandler noticeWebSocketHandler;
	
	
	@RequestMapping("/videoView.hta")
	@ResponseBody
	private void videoView(@RequestParam int view, @RequestParam int videono, HttpSession session ) {
		
		User user = (User) session.getAttribute("LU");
		
		Video video = videoService.getVideoByNo(videono);
		
		if (user != null) {
			RecentVideo recentVideo = new RecentVideo();
			recentVideo.setUserNo(user.getNo());
			recentVideo.setVideoNo(videono);
			
			recentVideoService.RecentVideoInsert(recentVideo);
		}
		
		video.setViews(view);
		videoService.updateVideo(video);
		Views views = new Views();
		views.setVideoNo(videono);
		videoService.insertViews(views);
		
		
		
		
	}
	
	// 비디오 싫어요
	@RequestMapping("/videoDislike.hta")
	@ResponseBody
	private VideoEmotion videoEmotionDisLike(@RequestParam int videoNo,  HttpSession session) {
		User user = (User) session.getAttribute("LU");
		
		if (user == null) {
			return null;
		}
		
		Map<String, Integer> videoEmotionMap = new HashMap<String, Integer>();
		videoEmotionMap.put("userNo", user.getNo());
		videoEmotionMap.put("videoNo", videoNo);
		VideoEmotion videoEmotion = videoEmotionService.getVideoEmotionNo(videoEmotionMap);
		
		Video video = new Video();
		video =  videoService.getVideoByNo(videoNo);
		
		if (videoEmotion.getVideoEmtion().equals("Y")) {
			videoEmotion.setVideoEmtion("N");
			
			video.setLikeAmount(video.getLikeAmount() - 1);
			
			videoService.updateVideo(video);
			videoEmotionService.updateVideoEmotion(videoEmotion);
		}
		
		return videoEmotion;
	}
	
	// 동영상 좋아요
	@RequestMapping("/videoLike.hta")
	@ResponseBody
	private VideoEmotion videoEmotionLike(@RequestParam int videoNo, HttpSession session) {
		
		User user = (User) session.getAttribute("LU");
		
		if (user == null) {
			return null;
		}
		
		Map<String, Integer> videoEmotionMap = new HashMap<String, Integer>();
		videoEmotionMap.put("userNo", user.getNo());
		videoEmotionMap.put("videoNo", videoNo);
		VideoEmotion videoEmotion = videoEmotionService.getVideoEmotionNo(videoEmotionMap);
		
		
		Video video = new Video();
		video =  videoService.getVideoByNo(videoNo);
		
		if (videoEmotion == null) {
			VideoEmotion videoEmotion1 = new VideoEmotion();
			videoEmotion1.setUserNo(user.getNo());
			videoEmotion1.setVideoNo(videoNo);
			videoEmotion1.setVideoEmtion("Y");
			
			video.setLikeAmount(video.getLikeAmount() + 1);
			
			videoEmotionService.insertVideoEmotion(videoEmotion1);
			videoService.updateVideo(video);
		} else if (videoEmotion.getVideoEmtion().equals("Y")) {
			videoEmotion.setVideoEmtion("D");
			
			video.setLikeAmount(video.getLikeAmount() - 1);
			
			videoService.updateVideo(video);
			videoEmotionService.updateVideoEmotion(videoEmotion);
		} else if (videoEmotion.getVideoEmtion().equals("D") || videoEmotion.getVideoEmtion().equals("N")) {
			videoEmotion.setVideoEmtion("Y");
			
			video.setLikeAmount(video.getLikeAmount() + 1);
			
			videoService.updateVideo(video);
			videoEmotionService.updateVideoEmotion(videoEmotion);
		}
		
		
		return videoEmotion;
	}
	
	// 댓글 좋아요
	@RequestMapping("/commentLike.hta")
	@ResponseBody
	public int commentEmotionLike(@RequestParam int commentNo, HttpSession session) throws Exception {
		
		User user = (User) session.getAttribute("LU");
		
		if (user == null) {
			return 0;
		}
		
		Map<String, Integer> cmtEmotionMap = new HashMap<String, Integer>();
		cmtEmotionMap.put("userNo", user.getNo());
		cmtEmotionMap.put("commentNo", commentNo);
		CmtEmotion cmtEmotion = cmtEmotionService.CmtEmotionUserNo(cmtEmotionMap);
		
		Comment comment = new Comment();
		comment = commentService.getCommentByCommentNo(commentNo);
		
		if(cmtEmotion == null) {
			CmtEmotion cmtEmotion1 = new CmtEmotion();
			cmtEmotion1.setCommentNo(commentNo);
			cmtEmotion1.setUserNo(user.getNo());
			cmtEmotion1.setEmotion("Y");
			
			comment.setLikeAmount(comment.getLikeAmount() + 1);
			
			
			commentService.commentUpdate(comment);
			cmtEmotionService.CmtEmotionInsert(cmtEmotion1);
		} else if(cmtEmotion.getEmotion().equals("Y")) {
			cmtEmotion.setEmotion("D");
			
			comment.setLikeAmount(comment.getLikeAmount() - 1);
			
			cmtEmotionService.CmtEmotionUpdate(cmtEmotion);
			commentService.commentUpdate(comment);
			
		}else if(cmtEmotion.getEmotion().equals("N") || cmtEmotion.getEmotion().equals("D")) {
			cmtEmotion.setEmotion("Y");
			
			comment.setLikeAmount(comment.getLikeAmount() + 1);
			
			commentService.commentUpdate(comment);
			cmtEmotionService.CmtEmotionUpdate(cmtEmotion);
		}
		return 1;
	}
	
	// 댓글 싫어요
	@RequestMapping("/commentDislike.hta")
	@ResponseBody
	public int commentEmotionDisLike(@RequestParam int commentNo, HttpSession session) {
		
		User user = (User) session.getAttribute("LU");
		
		Map<String, Integer> cmtEmotionMap = new HashMap<String, Integer>();
		cmtEmotionMap.put("userNo", user.getNo());
		cmtEmotionMap.put("commentNo", commentNo);
		CmtEmotion cmtEmotion = cmtEmotionService.CmtEmotionUserNo(cmtEmotionMap);
		
		Comment comment = new Comment();
		comment = commentService.getCommentByCommentNo(commentNo);
		
		if(cmtEmotion.getEmotion().equals("Y")) {
			cmtEmotion.setEmotion("N");
			
			comment.setLikeAmount(comment.getLikeAmount() - 1);
			
			cmtEmotionService.CmtEmotionUpdate(cmtEmotion);
			commentService.commentUpdate(comment);
			
		}
		
		return commentNo;
	}
	
	// 서브댓글 좋아요
		@RequestMapping("/subcommentLike.hta")
		@ResponseBody
		public SubComment subCommentEmotionLike(@RequestParam int subcommentNo, HttpSession session) throws Exception {
			
			User user = (User) session.getAttribute("LU");
			
			if (user == null) {
				return null;
			}
			
			Map<String, Integer> subCmtEmotionMap = new HashMap<String, Integer>();
			subCmtEmotionMap.put("subcommentNo", subcommentNo);
			subCmtEmotionMap.put("userNo", user.getNo());
			
			SubCmtEmotion subCmtEmotion = cmtEmotionService.SubCmtEmotionUserNo(subCmtEmotionMap);
			
			SubComment subComment = new SubComment();
			subComment = commentService.getSubCommentSubCommentNo(subcommentNo);
			
			if(subCmtEmotion == null) {
				SubCmtEmotion subCmtEmotion1 = new SubCmtEmotion();
				subCmtEmotion1.setSubcommentNo(subcommentNo);
				subCmtEmotion1.setUserNo(user.getNo());
				subCmtEmotion1.setSubEmotion("Y");
				
				subComment.setLikeAmount(subComment.getLikeAmount() + 1);
				
				commentService.subCommentUpdate(subComment);
				cmtEmotionService.SubCmtEmotionInsert(subCmtEmotion1);
			} else if(subCmtEmotion.getSubEmotion().equals("Y")) {
				subCmtEmotion.setSubEmotion("D");
				
				subComment.setLikeAmount(subComment.getLikeAmount() - 1);
				
				cmtEmotionService.SubCmtEmotionUpdate(subCmtEmotion);
				commentService.subCommentUpdate(subComment);
				
			}else if(subCmtEmotion.getSubEmotion().equals("N") || subCmtEmotion.getSubEmotion().equals("D")) {
				subCmtEmotion.setSubEmotion("Y");
				
				subComment.setLikeAmount(subComment.getLikeAmount() + 1);
				
				commentService.subCommentUpdate(subComment);
				cmtEmotionService.SubCmtEmotionUpdate(subCmtEmotion);
			}
			
			subComment = commentService.getSubCommentSubCommentNo(subcommentNo);
			
			return subComment;
		}
		
	// 서브댓글 싫어요
	@RequestMapping("/subcommentDislike.hta")
	@ResponseBody
	public SubComment subCommentEmotionDisLike(@RequestParam int subcommentNo, HttpSession session) {
		
		User user = (User) session.getAttribute("LU");
		
		Map<String, Integer> subCmtEmotionMap = new HashMap<String, Integer>();
		subCmtEmotionMap.put("subcommentNo", subcommentNo);
		subCmtEmotionMap.put("userNo", user.getNo());
		
		SubCmtEmotion subCmtEmotion = cmtEmotionService.SubCmtEmotionUserNo(subCmtEmotionMap);
		
		SubComment subComment = new SubComment();
		subComment = commentService.getSubCommentSubCommentNo(subcommentNo);
		
		if(subCmtEmotion.getSubEmotion().equals("Y")) {
			subCmtEmotion.setSubEmotion("N");
			
			subComment.setLikeAmount(subComment.getLikeAmount() - 1);
			
			commentService.subCommentUpdate(subComment);
			cmtEmotionService.SubCmtEmotionUpdate(subCmtEmotion);
		}
		
		subComment = commentService.getSubCommentSubCommentNo(subcommentNo);
		
		return subComment;
	}

	// 댓글 목록
	// @GetMapping("/detail.hta")
	@RequestMapping("/detail.hta")
	public String newComments(@RequestParam("videono") int videoNo, HttpSession session, Model model, Model model2, Model model3, Model model4) {

		User user = (User) session.getAttribute("LU");
		
		Video video = videoService.getVideoByNo(videoNo);
		
		VideoPathInfo videoPath = videoService.getVideoPathInfoByNo(videoNo);
		
		List<VideoVideoPathDto> videoListRemoveByNo = videoService.getVideoRemoveByNo(videoNo);
		List<VideoVideoPathDto> videoList = videoService.AllVideoVideoPathList();
		
		int j = 0;
		for (int i=0; i<videoList.size()-1; i++) {
			if (videoList.get(i).getVideoNo() == (video.getNo())) {
				j = i;
				break;
			}
		}
		VideoVideoPathDto nextVideo = videoListRemoveByNo.remove(j);
		if(videoList.get(j).getVideoNo() == videoList.get(videoList.size()-1).getVideoNo()) {
			videoListRemoveByNo.remove(j+1);
		}else {
			videoListRemoveByNo.addAll(videoListRemoveByNo);
		}
		
		
		Channel channel = channelService.getChannelByChannelNo(video.getChannelNo());
		User channelUser = userService.getUserByNo(video.getUserNo());
		
		int count =  subscribeService.countsubscribeByChannelNo(channel.getNo());
		
		
		
		model2.addAttribute("channel", channel);
		model2.addAttribute("count", count);
		model2.addAttribute("channelUser",channelUser);
		model2.addAttribute("video",video);
		model2.addAttribute("videoPath",videoPath);
		model3.addAttribute("videos",videoListRemoveByNo);
		model4.addAttribute("nextVideo",nextVideo);
		
		if (user != null) {
			Map<String, Integer> commentMap = new HashMap<String, Integer>();

			commentMap.put("userNo", user.getNo()); 
			commentMap.put("videoNo", videoNo);

			List<Comment> loginUserWritedComments = commentService.getCommentsUser(commentMap);
			List<Comment> otherWritedComments = commentService.getCommentRemoveUserNo(commentMap);
			
			loginUserWritedComments.addAll(otherWritedComments);
			
			model.addAttribute("comments", loginUserWritedComments);
			model.addAttribute("size", loginUserWritedComments.size());
			
			Map<String, Object> mapSubscribe = new HashMap<String, Object>();
		    mapSubscribe.put("userno", user.getNo());
		    mapSubscribe.put("channelno", channel.getNo());
		    Subscribe subscribeInfo = new Subscribe();
		    subscribeInfo = subscribeService.getSubscribeByMap(mapSubscribe);
		    model4.addAttribute("subscribeInfo", subscribeInfo);
			
		}

		else {
			List<Comment> comments = commentService.getCommentsVideo(videoNo);

			model.addAttribute("comments", comments);
			model.addAttribute("size", comments.size());
		}

		videoService.updateVideo(video);
		return "detail";
	}
	
	// 구독자 수
	@RequestMapping("/subscribe.hta")
	@ResponseBody
	private int getSubscribe(@RequestParam int videono) {
		
		Video video = videoService.getVideoByNo(videono);
		Channel channel = channelService.getChannelByChannelNo(video.getChannelNo());
		int count =  subscribeService.countsubscribeByChannelNo(channel.getNo());
		
		return count;
	}
	
	//구독생성
		@RequestMapping("/insertSubscribe.hta")
		@ResponseBody
		public void insertSubscribe(@RequestParam("videono") int videoNo, HttpSession session) {
			
			User logineduser = (User) session.getAttribute("LU");
			int loginedUserNo = logineduser.getNo();
			
			Video video = videoService.getVideoByNo(videoNo);
			int videoChannelNo = video.getChannelNo();
			
			Map<String, Object> mapSubscribe = new HashMap<String, Object>();
			mapSubscribe.put("userno", loginedUserNo);
			mapSubscribe.put("channelno", videoChannelNo);
			
			subscribeService.addSubscribe(mapSubscribe);
			
		}
		
		//구독삭제
		@RequestMapping("/deleteSubscribe.hta")
		@ResponseBody
		public void deleteSubscribe(@RequestParam("videono") int videoNo, HttpSession session) {
			
			User logineduser = (User) session.getAttribute("LU");
			int loginedUserNo = logineduser.getNo();
			
			Video video = videoService.getVideoByNo(videoNo);
			int videoChannelNo = video.getChannelNo();
			
			Map<String, Object> mapSubscribe = new HashMap<String, Object>();
			mapSubscribe.put("userno", loginedUserNo);
			mapSubscribe.put("channelno", videoChannelNo);
			
			subscribeService.deleteSubscribe(mapSubscribe);
		}

	// 동영상 목록
	@RequestMapping("/videoList.hta")
	@ResponseBody
	private List<VideoVideoPathDto> videoList(@RequestParam int videono) {
		
		List<VideoVideoPathDto> videoListByNo = videoService.getVideoRemoveByNo(videono);
		
		
		List<VideoVideoPathDto> videoList = videoService.AllVideoVideoPathList();
		
		int j = 0;
		for (int i=0; i<videoList.size()-1; i++) {
			if (videoList.get(i).getVideoNo() == (videono)) {
				j = i;
				break;
			}
		}
		
		videoListByNo.remove(j);
		if(videoList.get(j).getVideoNo() == videoList.get(videoList.size()-1).getVideoNo()) {
			videoListByNo.remove(j+1);
		}else {
			videoListByNo.addAll(videoListByNo);
		}
		
		// VideoVideoPathDto lastIndex = videoListUserNo.get(videoListUserNo.size());
		
		
		
		return videoListByNo;
	}
		
	// 서브댓글 목록
	@RequestMapping("/subShow.hta")
	@ResponseBody
	public List<SubComment> SubComment(@RequestParam int commentNo, HttpSession session) {
		User loginedUser = (User) session.getAttribute("LU");

		List<SubComment> subComments = commentService.getSubCommentCommentNo(commentNo);
		if (loginedUser != null) {
			for (SubComment c : subComments) {
				if (loginedUser.getNo() == c.getUserNo()) {
					c.setModify(true);
				} else {
					c.setReport(true);
				}
			}

		}
		
		System.out.println(subComments);
		
		return subComments;

	}

	@RequestMapping("/subComment.hta") // 서브댓글 작성
	@ResponseBody
	private void subCommentServiceInsert(@RequestParam int commentNo, @RequestParam String content, HttpSession session)
			throws Exception {

		User user = (User) session.getAttribute("LU");

		if (user == null) {
			return;
		}

		SubComment subComment = new SubComment();

		subComment.setContent(content);
		subComment.setUserNo(user.getNo());
		subComment.setCommentNo(commentNo);
		noticeWebSocketHandler.sendMessage("RECENT:" + user.getId() + ":subcommnet");
		commentService.subCommentInsert(subComment);
	}

	@RequestMapping("/insert.hta") // 댓글 작성
	@ResponseBody
	private void CommentServiceInsert(@RequestParam int videono, @RequestParam String content, HttpSession session)
			throws Exception {

		User user = (User) session.getAttribute("LU");

		if (user == null) {
			return;
		}
		Comment comment = new Comment();

		comment.setContent(content);
		comment.setUserNo(user.getNo());
		comment.setVideoNo(videono);
		
		
		noticeWebSocketHandler.sendMessage("RECENT:" + user.getId() + ":commnet");
		
		commentService.commentInsert(comment);
	}

	// 댓글 수정
	@RequestMapping("/update.hta")
	@ResponseBody
	private void CommentUpdate(@RequestParam int commentNo, @RequestParam String content) {

		Comment comment = new Comment();

		comment = commentService.getCommentByCommentNo(commentNo);
		comment.setContent(content);

		commentService.commentUpdate(comment);

	}

	// 서브댓글 수정
	@RequestMapping("/subupdate.hta")
	@ResponseBody
	private void SubCommentUpdate(@RequestParam int subcommentNo, @RequestParam String content) {

		SubComment subComment = new SubComment();

		subComment = commentService.getSubCommentSubCommentNo(subcommentNo);
		subComment.setContent(content);

		commentService.subCommentUpdate(subComment);
	}

	// 댓글 삭제
	@RequestMapping("/delete.hta")
	@ResponseBody
	private void CommentDelete(@RequestParam int commentNo) {
		commentService.commentDelete(commentNo);
	}

	// 서브댓글 삭제
	@RequestMapping("/deleteSub.hta")
	@ResponseBody
	private void subCommentDelete(@RequestParam int subcommentNo) {
		System.out.println("----------------------------");
		commentService.subCommentDelete(subcommentNo);
	}
	
}
