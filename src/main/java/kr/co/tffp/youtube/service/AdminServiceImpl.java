package kr.co.tffp.youtube.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.AdminDao;
import kr.co.tffp.youtube.vo.AdminUploadByDate;
import kr.co.tffp.youtube.vo.AdminViewsByDate;
import kr.co.tffp.youtube.vo.RecentData;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<AdminViewsByDate> getBeforeSevenDaysViews(String selectedDate) {
		
		List<AdminViewsByDate> dateList = adminDao.getBeforeSevenDaysViews(selectedDate);
		return dateList;
	}

	@Override
	public List<AdminViewsByDate> getToDayDate() {
		
		List<AdminViewsByDate> todays = adminDao.getToDayDate();
		
		return todays;
	}

	@Override
	public List<AdminUploadByDate> getToDayUpLoad() {
		
		List<AdminUploadByDate> todays = adminDao.getToDayUpLoad();
		return todays;
	}

	@Override
	public List<AdminUploadByDate> getDateToUpload(String selectedDate) {
		
		List<AdminUploadByDate> dateList = adminDao.getDateToUpload(selectedDate);
		
		System.out.println(dateList);
		return dateList;
	}

	@Override
	public List<RecentData> getRecentDataList() {
		List<RecentData> dataList = adminDao.getRecnetDataList();
		return dataList;
	}

	@Override
	public List<RecentData> getRecentFiveData() {
		List<RecentData> dataList = adminDao.getRecentFiveData();
		return dataList;
	}

	@Override
	public List<RecentData> getRecentActivityByUserNo(int userNo) {
			
		return adminDao.getRecentActivityByUserNo(userNo);
	}

	@Override
	public RecentData getRecentOneData() {
		return adminDao.getRecentOneData();
	}

}
