package com.forTicket.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.goods.vo.GoodsVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	public List selectGoodsList() throws DataAccessException;
	public List selectAdminGoodsList(Map condMap) throws DataAccessException;
	public List selectBusinessGoodsList(Map condMap) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
	public int selectGoodsNo(Map goodsMap) throws DataAccessException;
	public String selectGoodsNameById(int goods_id) throws DataAccessException;
	public int selectGoodsDisc(int goods_id) throws DataAccessException;
	public List selectGoodsById(String mem_id) throws DataAccessException;
	public void insertGoods(Map goodsMap) throws DataAccessException;
	public void updateGoods(Map goodsMap) throws DataAccessException;
	public void updateDisc(Map goodsMap) throws DataAccessException;
	public void deleteGoods(int event_no) throws DataAccessException;
	public List selectGoodsImageFileList(int goods_id) throws DataAccessException;
	public List selectGoodsImageFileList_2(int goods_id) throws DataAccessException;
	public void insertGoodsImageFile(G_imageFileVO imageFileVO) throws DataAccessException;
	public void updateGoodsImage(G_imageFileVO imageFileVO) throws DataAccessException;
	public void deleteGoodsImage(int image_id) throws DataAccessException;
	public void deleteAllGoodsImage(int image_id) throws DataAccessException;

	
	/*yhy */
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;

	//별점 평균
	public Double avgStar(int goods_id) throws DataAccessException;
	//별점 카운트
	public int countStar(int goods_id) throws DataAccessException;
	//리뷰 호출
	public List reviewList(int goods_id) throws DataAccessException;

	//메인페이지 상품 리스트
	public List<GoodsVO> mainListGoods(String goods_type) throws DataAccessException;

	public int totalGoods() throws DataAccessException;
	public int totalGoodsById(String mem_id) throws DataAccessException;

}
