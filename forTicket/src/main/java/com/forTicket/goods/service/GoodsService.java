package com.forTicket.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.goods.vo.GoodsVO;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
	public List a_listGoods(Map condMap) throws DataAccessException;
	public List b_listGoods(Map condMap) throws DataAccessException;
	public List findGoodsById(String mem_id) throws DataAccessException;
	public Map goodsInfo(int goods_id) throws DataAccessException;
	public Map goodDetail(int goods_id) throws DataAccessException;
	public String goodsName(int goods_id) throws DataAccessException;
	public int goodsDisc(int goods_id) throws DataAccessException;
	public int addGoods(Map goodsMap) throws DataAccessException;
	public void modGoods(Map goodsMap) throws DataAccessException;
	public void modDisc(Map goodsMap) throws DataAccessException;
	public void removeGoods(int goods_id) throws DataAccessException;
	public void addGoodsImage(List imageFileList) throws DataAccessException;
	public void modGoodsImage(List imageFileList) throws DataAccessException;
	public void removeGoodsImage(int image_id) throws DataAccessException;
	public void removeAllGoodsImage(int goods_id) throws DataAccessException;
	//별점평균
	public Double avgStar(int goods_id) throws DataAccessException;
	//별점 카운트
	public int countStar(int goods_id) throws DataAccessException;
	//리뷰 호출
	public List reviewList(int goods_id) throws DataAccessException;
	//메인페이지 상품 리스트
	public Map<String,List<GoodsVO>> mainListGoods() throws DataAccessException;
	public int totalGoodsNum() throws DataAccessException;
	public int totalGoodsNumById(String mem_id) throws DataAccessException;
	
		/* 아래부분추가 */
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<GoodsVO> searchGoods(String searchWord) throws Exception;
}