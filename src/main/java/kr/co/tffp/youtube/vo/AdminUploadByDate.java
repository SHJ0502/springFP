package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("adminUploadByDate")
public class AdminUploadByDate {
	private String viewsCreateDate;
	private int count;
	
	
	public String getViewsCreateDate() {
		return viewsCreateDate;
	}
	public void setViewsCreateDate(String viewsCreateDate) {
		this.viewsCreateDate = viewsCreateDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "AdminUploadByDate [viewsCreateDate=" + viewsCreateDate + ", count=" + count + "]";
	}
	
	
	
	
}
