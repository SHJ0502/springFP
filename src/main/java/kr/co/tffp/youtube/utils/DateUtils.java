package kr.co.tffp.youtube.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String dateToYYYYMMDD(Date date) {
		if (date == null) {
			return "";
		}
		return yyyymmdd.format(date);
	}
	
	public static  String getBeforeTime(Date date) {
		if (date == null) {
			return "";
		}
		Date now = new Date();
		
		long minute = 60*1000;
		long hour = minute*60;
		long day = hour*24;
		long week = day*7;
		long month = day*30;
		long year = day*365;
		
		long nowTime = now.getTime();
		long createTime = date.getTime();
		long gap = nowTime - createTime;
	
		
		
		if (gap < hour) {			
	         return gap/minute + "분 전";
	      } else if(gap < day) {
	         return gap/hour + "시간 전";
	      } else if(gap < week) {
	         return gap/day + "일 전";
	      } else if(gap < month) {
	         return gap/week + "주 전";
	      } else if(gap < year) {
	         return gap/month + "달 전";
	      } else {
	         return gap/year + "년 전";
	      }
	}
}
