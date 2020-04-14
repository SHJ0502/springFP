package kr.co.tffp.youtube.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tffp.youtube.dto.ChannelCmntUserDto;
import kr.co.tffp.youtube.dto.CmntCommentUserDto;
import kr.co.tffp.youtube.form.CmntCommentRegisterForm;
import kr.co.tffp.youtube.form.CmntRegisterForm;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.CommentService;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.CmntBoard;
import kr.co.tffp.youtube.vo.CmntComment;
import kr.co.tffp.youtube.vo.User;

@Controller
@RequestMapping("/mychannel")
public class CmntCommentController {

	private final String  cmntSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\images\\cmntimage";
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping("/addCmnt.hta")
	@ResponseBody
	public Map<String, Object> addCmnt (HttpSession session, CmntRegisterForm cmntRegister) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			
		User user = (User) session.getAttribute("LU");
		Channel channel = channelService.getChannelByUserNo(user.getNo());
				
				
		CmntBoard cmntBoard = new CmntBoard();
		cmntBoard.setCmntContent(cmntRegister.getCmntContent());
		cmntBoard.setChannelNo(channel.getNo());
		cmntBoard.setCmntTitle(cmntRegister.getCmntTitle());
		
		MultipartFile cmntFile = cmntRegister.getCmntFilePath();
		if(cmntFile != null && !cmntFile.isEmpty()) {
			
			String cmntFilename = cmntFile.getOriginalFilename();
			FileCopyUtils.copy(cmntFile.getBytes(), new File(cmntSaveDirectory, cmntFilename));
			cmntBoard.setCmntFilePath(cmntFilename);
			
			commentService.insertCmnt(cmntBoard);
			
			map.put("result", "success");
			
		} 
		
		commentService.insertCmnt(cmntBoard);
		
		map.put("result", "success");
		
		
		ChannelCmntUserDto channelCmntUser = commentService.getChannelCmntUserByCmntNo(cmntBoard.getChannelCmntNo());
		
		map.put("cmntusers", channelCmntUser);
		
		return map;
	}
	
	
	
	@RequestMapping("/cmntComment.hta")
	@ResponseBody
	public Map<String, Object> addCmntComment (HttpSession session, CmntCommentRegisterForm cmntCommentRegister) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			
			User user = (User) session.getAttribute("LU");
			
			Date date = new Date();
			
			CmntComment cmntComment = new CmntComment();
			cmntComment.setCmntNo(cmntCommentRegister.getCmntNo());
			cmntComment.setCmntComment(cmntCommentRegister.getCmntComment());
			cmntComment.setUserNo(user.getNo());
			cmntComment.setCmntCommnetDate(date);
			
			
			commentService.insertCmntComment(cmntComment);
			
			map.put("result", "success");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<CmntCommentUserDto> cmntComments = commentService.getCmntCommentsUserByCmntNo(cmntCommentRegister.getCmntNo());
				
		map.put("cmntCommentList", cmntComments);
	
		return map;
	}
	
	@RequestMapping("/exportCmntNo.hta")
	@ResponseBody
	public List<CmntCommentUserDto> exportCmntNo(@RequestParam("cmntno") int cmntNo) {
		
		List<CmntCommentUserDto> cmntComments = commentService.getCmntCommentsUserByCmntNo(cmntNo);
		
		 return cmntComments;
	}
	
	@RequestMapping("/commentDelete.hta")
	@ResponseBody
	public void commentDelete(@RequestParam("cmntCommentNo") int cmntCommentNo) {
		
		commentService.deleteCmntComment(cmntCommentNo);
	}
	
	@RequestMapping("/commentModify.hta")
	@ResponseBody
	public CmntCommentUserDto commentModify(CmntCommentUserDto regiForm) {
		
		
		
		Date date = new Date();
		
		CmntComment cmntComment = commentService.getCmntCommentsByCmntNo(regiForm.getCmntCommentNo());
		cmntComment.setCmntComment(regiForm.getCmntCommentContent());
		cmntComment.setCmntCommnetDate(date);
		
		commentService.updateCmntComment(cmntComment);
		
		CmntCommentUserDto cmntCommentUser = commentService.getCmntCommentsUserByCmntCommentNo(cmntComment.getCmntCommentNo());
		
		return cmntCommentUser;
		
	}
	
	@RequestMapping("/cmntDelete.hta")
	@ResponseBody
	public void cmntDelete(@RequestParam("cmntNo") int cmntNo) {
		
		commentService.deleteCmntCommentAll(cmntNo);
		commentService.deleteCmntByCmntNo(cmntNo);
	}
	
	
	@RequestMapping("/cmntModify.hta")
	@ResponseBody
	public Map<String, Object> cmntModify(CmntRegisterForm regiForm) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		
		CmntBoard cmntBoard = commentService.getCmntByCmntNo(regiForm.getCmntNo());
		cmntBoard.setCmntTitle(regiForm.getCmntTitle());
		cmntBoard.setCmntContent(regiForm.getCmntContent());
		cmntBoard.setCmntCreateDate(date);
		
		
		MultipartFile cmntBoardFile = regiForm.getCmntFilePath();
		if(cmntBoardFile != null && !cmntBoardFile.isEmpty()) {
			String cmntBoardFileName = cmntBoardFile.getOriginalFilename();
			FileCopyUtils.copy(cmntBoardFile.getBytes(), new File(cmntSaveDirectory, cmntBoardFileName));
			
			
			cmntBoard.setCmntFilePath(cmntBoardFileName);
			
			commentService.updateCmntByCmntNo(cmntBoard);
			
			map.put("result", "success");
		}
		
		
		commentService.updateCmntByCmntNo(cmntBoard);
		
		map.put("result", "success");
		
		ChannelCmntUserDto cmntUser = commentService.getChannelCmntUserByCmntNo(cmntBoard.getChannelCmntNo());
		
		map.put("cmntusers", cmntUser);
		
		return map;
		
	}
	
	@RequestMapping("/getCmntByCmntNo.hta")
	@ResponseBody
	public ChannelCmntUserDto getCmntByCmntNo(@RequestParam("cmntNo") int cmntNo, Model model) {
		
		
		ChannelCmntUserDto cmntUser = commentService.getChannelCmntUserByCmntNo(cmntNo);
		
		
		return cmntUser;
		
		
	}
	
}
