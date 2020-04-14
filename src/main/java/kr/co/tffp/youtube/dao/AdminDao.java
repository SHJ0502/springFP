package kr.co.tffp.youtube.dao;

import java.util.List;

import kr.co.tffp.youtube.vo.Admin;
import kr.co.tffp.youtube.vo.AdminUploadByDate;
import kr.co.tffp.youtube.vo.AdminViewsByDate;
import kr.co.tffp.youtube.vo.RecentData;

public interface AdminDao {
	
	Admin getAdminById(String adminId);
	
	List<AdminViewsByDate> getBeforeSevenDaysViews(String selectedDate);

	List<AdminViewsByDate> getToDayDate();

	List<AdminUploadByDate> getToDayUpLoad();

	List<AdminUploadByDate> getDateToUpload(String selectedDate);

	List<RecentData> getRecnetDataList();

	List<RecentData> getRecentFiveData();

	List<RecentData> getRecentActivityByUserNo(int userNo);

	RecentData getRecentOneData();
	
}	
