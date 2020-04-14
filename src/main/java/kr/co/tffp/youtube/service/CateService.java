package kr.co.tffp.youtube.service;

import org.springframework.transaction.annotation.Transactional;

import kr.co.tffp.youtube.vo.Categories;

@Transactional
public interface CateService {

	Categories getCateNameByCateNo(int cateNo);
}
