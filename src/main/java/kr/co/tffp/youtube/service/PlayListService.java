package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.PlaylistVideoDto;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.PlayListVideo;

public interface PlayListService {
	
	int countVideo(int playlistNo);
	PlayList addPlayList(PlayList playList);
	List<PlayList> getMyList(int userNo);
	void addPlayListVideo(PlayListDto playlistDto);
	void removePlayListVideo(PlayListDto playlistDto);
	void updatePlaylist(PlayList playlist);
	void delPlv(int playlistNo);
	void delPlaylist(int playlistNo);
	void delPlvByPlv(PlayListVideo plv);
	List<PlayListVideo> getPlvByListNo(int playlistNo);
	List<Integer> getPlayListNoInVideo(int videoNo);
	List<PlaylistVideoDto> getPlaylistVideoByListNo(int playlistNo);
	List<PlaylistVideoDto> getPlaylistVideoBymap(Map<String, Object> param);
	PlayListDto getListVideoByDto(PlayListDto playListVideo);
	PlayList getPlaylistByNo(int playlistNo);
	
}
