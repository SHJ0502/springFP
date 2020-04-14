package kr.co.tffp.youtube.vo;

import org.apache.ibatis.type.Alias;

@Alias("Categories")
public class Categories {

	private int no;
	private int mainCateNo;
	private String name;
	
	public Categories() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMainCateNo() {
		return mainCateNo;
	}

	public void setMainCateNo(int mainCateNo) {
		this.mainCateNo = mainCateNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
