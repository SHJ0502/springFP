package kr.co.tffp.youtube.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.PlaylistVideoDto;
import kr.co.tffp.youtube.service.PlayListService;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.PlayListVideo;
import kr.co.tffp.youtube.vo.User;

@Controller
public class PlayListController {

	@Autowired
	private PlayListService playListService;
	
	@RequestMapping("/adddelplaylistvideo.hta")
	@ResponseBody
	public Map<String, Object> addDelPlayListVideo(@RequestParam("videono") int videoNo, @RequestParam("playlistvideono") int playListVideoNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		PlayListDto plv = new PlayListDto();
		plv.setPlaylistNo(playListVideoNo);
		plv.setVideoNo(videoNo);
		
		PlayListDto playListVideoNo2 = playListService.getListVideoByDto(plv);
		
		if(playListVideoNo2 == null) {
			playListService.addPlayListVideo(plv);		
			map.put("playListNo", playListVideoNo);
			map.put("work", "save");
			return map;
		} else {
			playListService.removePlayListVideo(plv);
			map.put("playListNo", playListVideoNo);
			map.put("work", "del");
			return map;
		}	
		
	}
	
	@RequestMapping("/addplaylist.hta")
	@ResponseBody
	public PlayList addPlayList(HttpSession session, @RequestParam("title") String title) {
		
		User loginedUser = (User) session.getAttribute("LU");
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			PlayList playList = new PlayList();
			playList.setUserNo(loginedUserNo);
			playList.setTitle(title);
			PlayList saved = playListService.addPlayList(playList);
			return saved;
		}
		return null;
	}
	
	@RequestMapping("/allplaylist.hta")
	@ResponseBody
	public Map<String, Object> allPlayList(@RequestParam("videono") int videoNo, HttpSession session) {
		User loginedUser = (User) session.getAttribute("LU");
		Map<String, Object> map = new HashMap<String, Object>();
		List<PlayList> playList = new ArrayList<PlayList>();
		List<Integer> playListNoByVideoNo = new ArrayList<Integer>();
				
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			playList = playListService.getMyList(loginedUserNo);
			playListNoByVideoNo = playListService.getPlayListNoInVideo(videoNo);
			
			for(PlayList pl : playList) {
				if(playListNoByVideoNo.contains(pl.getNo())) {
					pl.setIstrue(true);
				}
			}			
		}
		
		map.put("playlist", playList);
		map.put("playlistno", playListNoByVideoNo);
		
		return map;
		
	}
	
	@RequestMapping("/startplvlist.hta")
	@ResponseBody
	public List<PlaylistVideoDto> startList(HttpSession session, @RequestParam("playlistno") int playlistNo) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			List<PlaylistVideoDto> list = playListService.getPlaylistVideoByListNo(playlistNo);
			
			return list;
		}
		
		return null;
	}
	
	@RequestMapping("/playlistvideolistsort.hta")
	@ResponseBody
	public Map<String, Object> plvList(HttpSession session, @RequestParam("playlistno") int playlistNo, @RequestParam("sort") String sort) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			
			  int loginedUserNo = loginedUser.getNo();
			  
			  Map<String, Object> map = new HashMap<String, Object>();
			  map.put("sort", sort);
			  map.put("playlistno", playlistNo);
			  List<PlaylistVideoDto> plv = playListService.getPlaylistVideoBymap(map); 
			  int count = playListService.countVideo(playlistNo);
			  
			  Map<String, Object> param = new HashMap<String, Object>();
			  param.put("plvlist", plv); 
			  param.put("count", count);
			  
			  return param;			 			
		}
		return null;
	}
	
	@RequestMapping("/countplv.hta")
	@ResponseBody
	public String countPlv(HttpSession session, @RequestParam("playlistno") int playlistNo) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int count = playListService.countVideo(playlistNo);
			String countString = Integer.toString(count);
			
			return countString;
		}
	
		return null;
	}
	
	@RequestMapping(value="/playlisttitle.hta", produces = "text/plain; charset=UTF-8" )
	@ResponseBody
	public String listTitle(HttpSession session, @RequestParam("playlistno") int playlistNo) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			int loginedUserNo = loginedUser.getNo();
			
			PlayList playlist = playListService.getPlaylistByNo(playlistNo);
			
			return playlist.getTitle();
		}
		
		return null;
	}
	
	@RequestMapping("/updatePlaylist.hta")
	@ResponseBody
	public String updateTitle(HttpSession session, @RequestParam("playlistno") int playlistNo, @RequestParam("title") String title) {
		User loginedUser = (User) session.getAttribute("LU");
		
		if(loginedUser != null) {
			
			PlayList playlist = playListService.getPlaylistByNo(playlistNo);
			playlist.setTitle(title);
			playListService.updatePlaylist(playlist);
			
			return "updatecomplete";
		}
		
		return null;
	}
	
	@GetMapping("/delplaylist.hta")	
	public String delPlayList(@RequestParam("playlistno") int playlistNo) {
			
			List<PlayListVideo> listVideoes = playListService.getPlvByListNo(playlistNo);
			
			if(listVideoes != null) {
				playListService.delPlv(playlistNo);
				playListService.delPlaylist(playlistNo);
				
				return "redirect:/home.hta";
			}
			playListService.delPlaylist(playlistNo);
			
			return "redirect:/home.hta";

	}
	
	@RequestMapping("/delPlaylistVideo.hta")
	@ResponseBody
	public String delPlayListVideo(@RequestParam("playlistno") int playlistNo, @RequestParam("videono") int videoNo) {
		
		PlayListVideo plv = new PlayListVideo();
		plv.setPlaylistNo(playlistNo);
		plv.setVideoNo(videoNo);
		
		playListService.delPlvByPlv(plv);
		
		return "delsuccess";
	}
}
