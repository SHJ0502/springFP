package kr.co.tffp.youtube.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.PlayListDao;
import kr.co.tffp.youtube.dto.PlayListDto;
import kr.co.tffp.youtube.dto.PlaylistVideoDto;
import kr.co.tffp.youtube.vo.PlayList;
import kr.co.tffp.youtube.vo.PlayListVideo;

@Service
public class PlayListServiceImpl implements PlayListService {

	@Autowired
	private PlayListDao playListDao;
	
	
	@Override
	public PlayList addPlayList(PlayList playList) {
		
		PlayList saved = playListDao.getPlayListByUserNoTitle(playList);
		if (saved != null) {
			return null; 
		}
		
		int seq = playListDao.getPlayListSeq();
		playList.setNo(seq);
		playListDao.addPlayList(playList);
		
		return playList;
	}

	@Override
	public List<PlayList> getMyList(int userNo) {
		return playListDao.getMyList(userNo);
	}
	
	@Override
	public void addPlayListVideo(PlayListDto playlistDto) {
		playListDao.addPlayListVideo(playlistDto);
		
	}

	@Override
	public void removePlayListVideo(PlayListDto playlistDto) {
		playListDao.removePlayListVideo(playlistDto);
		
	}

	@Override
	public List<Integer> getPlayListNoInVideo(int videoNo) {
		return playListDao.getPlayListNoInvideo(videoNo);
	}

	@Override
	public PlayListDto getListVideoByDto(PlayListDto playListVideo) {
		
		return playListDao.getListVideoByDto(playListVideo);
	}

	@Override
	public List<PlaylistVideoDto> getPlaylistVideoByListNo(int playlistNo) {
	
		return playListDao.getPlaylistVideoByListNo(playlistNo);
	}

	@Override
	public int countVideo(int playlistNo) {
		
		return playListDao.countPlaylistVideo(playlistNo);
	}

	@Override
	public List<PlaylistVideoDto> getPlaylistVideoBymap(Map<String, Object> param) {
		
		return playListDao.getPlaylistVideoByMap(param);
	}

	@Override
	public PlayList getPlaylistByNo(int playlistNo) {
		
		return playListDao.getPlaylistByNo(playlistNo);
	}

	@Override
	public void updatePlaylist(PlayList playlist) {
		playListDao.updatePlaylist(playlist);
	}

	@Override
	public void delPlv(int playlistNo) {
		playListDao.delPlaylistVideobyPlaylistNo(playlistNo);
		
	}

	@Override
	public void delPlaylist(int playlistNo) {
		playListDao.delPlaylistByPlaylistNo(playlistNo);
		
	}

	@Override
	public List<PlayListVideo> getPlvByListNo(int playlistNo) {
				
		return playListDao.getPlvByListNo(playlistNo);
	}

	@Override
	public void delPlvByPlv(PlayListVideo plv) {
		playListDao.delPlvByPlv(plv);
		
	}

	

}
