package kr.co.tffp.youtube.dao;

import kr.co.tffp.youtube.vo.Categories;

public interface CateDao {

	Categories getCateNameByCateNo(int cateNo);
	
}
