package kr.co.tffp.youtube.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tffp.youtube.form.UserRegisterForm;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.UserService;
import kr.co.tffp.youtube.vo.Admin;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	ChannelService channelService;

	private final String photoSaveDirectory = "C:\\projects\\spring_workspace\\Team4FP\\src\\main\\webapp\\resources\\images\\photo";

	@GetMapping("/register.hta")
	public String registerform() {

		return "user/registerform";
	}

	@PostMapping("/register.hta")
	public String register(UserRegisterForm regiForm) throws Exception {
		User user = new User();
		user.setId(regiForm.getId());
		user.setPassword(regiForm.getPassword());
		user.setName(regiForm.getName());
		user.setEmail(regiForm.getEmail());
		user.setBirthDay(regiForm.getBirthDay());
		
		MultipartFile imgfile =  regiForm.getUserImagePath();
		if(!imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveDirectory, filename));
			user.setUserImagePath(filename);
		}
		
		 boolean isSuccess = userService.addNewUser(user); 
		 if(!isSuccess) { 
			 return "redirect:/user/register.hta?error=fail"; 
			 }
		
		return "redirect:/home.hta";
	}

	@RequestMapping("/login.hta")
	public String loginform() {

		return "user/loginform";
	}

	@PostMapping("/login.hta")
	public String login(@RequestParam("id") String userId, @RequestParam("pwd") String password, HttpSession session) {
		Admin admin = userService.login(userId, password, 1);
		
		if(admin == null) {
			
		}else {
			session.setAttribute("AD", admin);
			
			return "redirect:/adminmain.hta";
		}
		
		User user = userService.login(userId, password);
		
		if(user == null) {
			return "redirect:/user/login.hta?error=fail";
		}
		
		session.setAttribute("LU", user);
		Channel loginUserChannel = channelService.getChannelByUserNo(user.getNo());
		int loginUserChannelNo = loginUserChannel.getNo();
		session.setAttribute("loginUserChannelNo", loginUserChannelNo);
		
		return "redirect:/home.hta";
	}
	
	
	@RequestMapping("/logout.hta")
	public String logout(HttpSession session) {
			
		session.invalidate();
		
		return "redirect:/home.hta";
	}
	
	@RequestMapping("/getUserList.hta")
	@ResponseBody
	public List<User> getUserList(){
		
		return userService.getUserList();
	}
	
	@RequestMapping("/getUserListbyText.hta")
	@ResponseBody
	public List<User> getUserList(@RequestParam("text") String searchText){
		
		return userService.getUserList(searchText);
	}
	
	@RequestMapping("getUserByNo.hta")
	@ResponseBody
	public User getUserByNo(@RequestParam("userNo") int userNo) {
		
		return userService.getUserByNo(userNo);
	}
}
