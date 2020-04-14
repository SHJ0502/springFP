package kr.co.tffp.youtube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tffp.youtube.dao.CateDao;
import kr.co.tffp.youtube.vo.Categories;

@Service("CategoryService")
public class CateServiceImpl implements CateService{

	@Autowired
	private CateDao cateDao;
	
	@Override
	public Categories getCateNameByCateNo(int cateNo) {
		
		cateDao.getCateNameByCateNo(cateNo);
		
		return null;
	}

}
