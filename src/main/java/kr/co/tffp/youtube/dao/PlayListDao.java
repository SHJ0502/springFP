package kr.co.tffp.youtube.dao;

import java.util.List;
import java.util.Map;

import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.PlaylistVideoDto;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.PlayListVideo;

public interface PlayListDao {
	
	void addPlayList(PlayList playList);
	
	void delPlayListVideoByVideoNo(int videoNo);
	
	List<PlayList> getMyList(int userNo);
	
	List<PlaylistVideoDto> getPlaylistVideoByMap(Map<String, Object> param);

	int getPlayListSeq();
	
	int countPlaylistVideo(int playlistNo);

	void addPlayListVideo(PlayListDto playlistDto);
	
	void delPlvByPlv(PlayListVideo playlist);

	void removePlayListVideo(PlayListDto playlistDto);
	
	void updatePlaylist(PlayList playlist);
	
	void delPlaylistVideobyPlaylistNo(int playlistNo);
	
	void delPlaylistByPlaylistNo(int playlistNo);

	List<Integer> getPlayListNoInvideo(int videoNo);
	
	List<PlaylistVideoDto> getPlaylistVideoByListNo(int playlistNo);
	
	List<PlayListVideo> getPlvByListNo(int playlistNo);
	
	PlayList getPlayListByUserNoTitle(PlayList playList);
	
	PlayListDto getListVideoByDto(PlayListDto playListVideo);
	
	PlayList getPlaylistByNo(int playlistNo);
	
	
}
