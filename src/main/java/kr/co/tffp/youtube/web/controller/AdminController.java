package kr.co.tffp.youtube.web.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tffp.youtube.dto.HomeSubscribeByUserNo;
import kr.co.tffp.youtube.dto.VideoVideoPathDto;
import kr.co.tffp.youtube.service.AdminService;
import kr.co.tffp.youtube.service.ChannelService;
import kr.co.tffp.youtube.service.QnaSendService;
import kr.co.tffp.youtube.service.RecentVideoService;
import kr.co.tffp.youtube.service.SubscribeService;
import kr.co.tffp.youtube.service.UserService;
import kr.co.tffp.youtube.service.VideoService;
import kr.co.tffp.youtube.vo.AdminUploadByDate;
import kr.co.tffp.youtube.vo.AdminViewsByDate;
import kr.co.tffp.youtube.vo.Channel;
import kr.co.tffp.youtube.vo.Qna;
import kr.co.tffp.youtube.vo.RecentData;
import kr.co.tffp.youtube.vo.User;
import kr.co.tffp.youtube.vo.Video;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private QnaSendService qnaSendService;
	
	@Autowired
	private UserService userServce;
	
	@GetMapping("/adminmain.hta")
	public String adminmain() {
		
		return "/admin/admin_main";
	}
	
	@GetMapping("/recentactivity.hta")
	public String recentActivity(){
		
		return "/admin/recentActivity";
	}
	
	@GetMapping("/userdetail.hta")
	public String userdetail(){
		return "/admin/admin_userdetail";
	}
	
	@GetMapping("/userchannel.hta")
	public String userChannel(){
		return "/admin/admin_userchannel";
	}
	
	@GetMapping("/videomanage.hta")
	public String videomanage(){
		return "/admin/videomanager";
	}
	
	@GetMapping("/inbox.hta")
	public String inbox(){
		return "/admin/inbox";
	}
	
	@RequestMapping("mail_compose.hta")
	public String mailCompose(@RequestParam("mailNo") int mailNo, Model model) {
		
		Qna qna = qnaSendService.getMailByNo(mailNo);
		User user = userServce.getUserByNo(qna.getUserNo());
		
		model.addAttribute("qna", qna);
		model.addAttribute("email", user.getEmail());
		
		return "/admin/mail_compose";
	}
	
	
	@RequestMapping("/mail_view.hta")
	public String mailView(@RequestParam("mailNo") int mailNo, Model model) {
		
		Qna qna = qnaSendService.getMailByNo(mailNo);
		User user = userServce.getUserByNo(qna.getUserNo());
		
		model.addAttribute("qna", qna);
		model.addAttribute("email", user.getEmail());
		model.addAttribute("username", user.getId());
		model.addAttribute("userimg", user.getUserImagePath());
		
		return "/admin/mailView";
	}
	
	@RequestMapping("/getDateToViews.hta")
	@ResponseBody
	public List<AdminViewsByDate> getDateToViews(@RequestParam("date") String date) {
		System.out.println(date);
		
		return adminService.getBeforeSevenDaysViews(date);
	}
	
	@RequestMapping("/getToDayDate.hta")
	@ResponseBody
	public List<AdminViewsByDate> getToDayDate() {
		
		return adminService.getToDayDate();
	}
	
	@RequestMapping("/getToDayUpload.hta")
	@ResponseBody
	public List<AdminUploadByDate> getToDayUpLoad(){
		List<AdminUploadByDate> temp = adminService.getToDayUpLoad();
		System.out.println(temp);
		return adminService.getToDayUpLoad();
		
	}
	
	@RequestMapping("/getDateToUpload.hta")
	@ResponseBody
	public List<AdminUploadByDate> getDateToUpload(@RequestParam("date") String date){
		
		List<AdminUploadByDate> temp = adminService.getDateToUpload(date);
		
		return temp;
	}
	
	@RequestMapping("/getTotalViewsCount.hta")
	@ResponseBody
	public int getTotalViewsCount(@RequestParam("userNo") int userNo) {
		return videoService.getTotalViewsCount(userNo);
	}	
	
	@RequestMapping("/getMySubscribe.hta")
	@ResponseBody
	public List<HomeSubscribeByUserNo> getMySubscribe(@RequestParam("userNo") int userNo){
		return subscribeService.getMySubscribe(userNo);
	}
	
	@RequestMapping("/getMyChannel.hta")
	@ResponseBody
	public Channel getMyChnnel(@RequestParam("userNo") int userNo){
		return channelService.getChannelByUserNo(userNo);
	}
	
	@RequestMapping("/getRecentDataList.hta")
	@ResponseBody
	public List<RecentData> getRecentDataList() {
		return adminService.getRecentDataList();
	}
	
	@RequestMapping("/getVideoDataList.hta")
	@ResponseBody
	public List<Video> getVideoDataList() {
		
		return videoService.getAllVideoList();
	}
	
	@RequestMapping("/insertQNA.hta")
	@ResponseBody
	public int insertQNA(@RequestParam("title") String title,
							@RequestParam("textarea") String text,
							HttpSession session) throws Exception {
		
		
		
		User user = (User) session.getAttribute("LU");
		
		if(user == null) {
			return -1;
		}
		
		System.out.println(user);
		Qna qna = new Qna();
		
		qna.setUserNo(user.getNo());
		qna.setText(text);
		qna.setTitle(title);
		
		qnaSendService.insertQna(qna);
		return 1;
		
	}
	
	@RequestMapping("/getAllMail.hta")
	@ResponseBody
	public List<Qna> getAllMail() {
		return qnaSendService.getAllMail();
	}
	
	@RequestMapping("/updateReadMail.hta")
	@ResponseBody
	public void updateReadMail(@RequestParam("no") int no) {
		
		qnaSendService.updateReadMail(no);
	}
	
	@RequestMapping("/getFourQna.hta")
	@ResponseBody
	public List<Qna> getFourQna(){
		return qnaSendService.getFourQna();
	}
	
	@RequestMapping("/getRecentFiveData.hta")
	@ResponseBody
	public List<RecentData> getRecentFiveData(){
		return adminService.getRecentFiveData();
	}
	
	@RequestMapping("/getRecentActivityByUserNo.hta")
	@ResponseBody
	public List<RecentData> getRecentActivityByUserNo(@RequestParam("userNo") int userNo){
		return adminService.getRecentActivityByUserNo(userNo);
	}
	
	@RequestMapping("/getRecentOneData.hta")
	@ResponseBody
	public RecentData getRecentOneData() {
		return adminService.getRecentOneData();
	}
	
	@RequestMapping("/getVideoByNoadmin.hta")
	@ResponseBody
	public VideoVideoPathDto getVideoByNo(@RequestParam("videoNo") int videoNo) {
		VideoVideoPathDto video = videoService.getVideoVideoPathByVideoNo(videoNo);
		
		System.out.println(video);
		return video;
	}
	
	@RequestMapping("/getVideoListBySubject.hta")
	@ResponseBody
	public List<Video> getVideoListBySubject(@RequestParam("text") String text) {
		
		return videoService.getVideoListBySubject(text);
	}
	
	@RequestMapping("/deleteVideo.hta")
	@ResponseBody
	public void deleteVideo(@RequestParam("videoNo") int videoNo) {
		videoService.deleteVideo(videoNo);
	}
	
	@RequestMapping("/poi.hta")
	@ResponseBody
	public int poi(HttpServletResponse response) throws IOException {
		
		Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("게시판");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();
	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);



	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);



	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);



	    // 데이터용 경계 스타일 테두리만 지정

	    CellStyle bodyStyle = wb.createCellStyle();

	    bodyStyle.setBorderTop(BorderStyle.THIN);

	    bodyStyle.setBorderBottom(BorderStyle.THIN);

	    bodyStyle.setBorderLeft(BorderStyle.THIN);

	    bodyStyle.setBorderRight(BorderStyle.THIN);



	    // 헤더 생성

	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("번호");

	    cell = row.createCell(1);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("이름");

	    cell = row.createCell(2);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("제목");


	    // 데이터 부분 생성


	        row = sheet.createRow(rowNo++);

	        cell = row.createCell(0);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue(1);

	        cell = row.createCell(1);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue(1);

	        cell = row.createCell(2);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue(1);




	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");

	    response.setHeader("Content-Disposition", "attachment;filename=test.xls");

	    
	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    System.out.println("emfdjdhsi");
	    
	    return 1;

	}

}

