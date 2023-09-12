package com.forTicket.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.goods.dao.GoodsDAO;
import com.forTicket.goods.vo.G_imageFileVO;
import com.forTicket.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	@Override
	public List listGoods() throws DataAccessException {
		List goodsList = goodsDAO.selectGoodsList();
		return goodsList;
	}

	@Override
	public List a_listGoods(Map condMap) throws DataAccessException {
		List goodsList = goodsDAO.selectAdminGoodsList(condMap);
		return goodsList;
	}

	@Override
	public List b_listGoods(Map condMap) throws DataAccessException {
		List goodsList = goodsDAO.selectBusinessGoodsList(condMap);
		return goodsList;
	}

	@Override
	public List findGoodsById(String mem_id) throws DataAccessException {
		List goodsList = goodsDAO.selectGoodsById(mem_id);
		return goodsList;
	}

	@Override
	public Map goodsInfo(int goods_id) throws DataAccessException {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_id);
		List imageFileList = goodsDAO.selectGoodsImageFileList(goods_id);
		System.out.println("fileName: "+goodsVO.getGoods_fileName());
		
		goodsMap.put("goodsVO", goodsVO);
		goodsMap.put("imageList", imageFileList);
		return goodsMap;
	}
	
	

	@Override
	public Map goodDetail(int goods_id) throws DataAccessException {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(goods_id);
		List imageFileList = goodsDAO.selectGoodsImageFileList_2(goods_id);
		System.out.println("fileName: "+goodsVO.getGoods_fileName());
		
		goodsMap.put("goodsVO", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}

	@Override
	public int addGoods(Map goodsMap) throws DataAccessException {
		goodsDAO.insertGoods(goodsMap);
		int goods_id = goodsDAO.selectGoodsNo(goodsMap);
		ArrayList<G_imageFileVO> imageFileList = (ArrayList) goodsMap.get("imageFileList");
		for(G_imageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_id(goods_id);
			goodsDAO.insertGoodsImageFile(imageFileVO);
		}
		return goods_id;
	}

	@Override
	public void modGoods(Map goodsMap) throws DataAccessException {
		goodsDAO.updateGoods(goodsMap);
	}

	@Override
	public void modDisc(Map goodsMap) throws DataAccessException {
		goodsDAO.updateDisc(goodsMap);		
	}

	@Override
	public String goodsName(int goods_id) throws DataAccessException {
		String goods_name = goodsDAO.selectGoodsNameById(goods_id);
		return goods_name;
	}

	@Override
	public int goodsDisc(int goods_id) throws DataAccessException {
		int goods_discount = goodsDAO.selectGoodsDisc(goods_id);
		return goods_discount;
	}

	@Override
	public void removeGoods(int goods_id) throws DataAccessException {
		goodsDAO.deleteGoods(goods_id);
	}

	@Override
	public void addGoodsImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			G_imageFileVO imageFileVO = (G_imageFileVO) imageFileList.get(i);
			goodsDAO.insertGoodsImageFile(imageFileVO);
		}
	}

	@Override
	public void modGoodsImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			G_imageFileVO imageFileVO = (G_imageFileVO) imageFileList.get(i);
			goodsDAO.updateGoodsImage(imageFileVO);
		}	
	}

	@Override
	public void removeGoodsImage(int image_id) throws DataAccessException {
		goodsDAO.deleteGoodsImage(image_id);
	}

	@Override
	public void removeAllGoodsImage(int goods_id) throws DataAccessException {
		goodsDAO.deleteAllGoodsImage(goods_id);
	}
	

	
	
	/* 아래부분추가 */
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=goodsDAO.selectKeywordSearch(keyword);
		return list;
	}
	
	public List<GoodsVO> searchGoods(String searchWord) throws Exception{
		List goodsList=goodsDAO.selectGoodsBySearchWord(searchWord);
		return goodsList;
	}
	
	//별점평균
	@Override
	public Double avgStar(int goods_id) throws DataAccessException {
		
		return goodsDAO.avgStar(goods_id);
	}
	
	//별점 카운트
	@Override
	public int countStar(int goods_id) throws DataAccessException {
				
		return goodsDAO.countStar(goods_id);
	}
	
	//리뷰 호출
	@Override
	public List reviewList(int goods_id) throws DataAccessException {
		List reviewList = goodsDAO.reviewList(goods_id);
		return reviewList;
	}

	
	//메인페이지 상품 리스트
	@Override
	public Map<String, List<GoodsVO>> mainListGoods() throws DataAccessException {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList=goodsDAO.mainListGoods("drama");
		goodsMap.put("drama",goodsList);
		
		goodsList=goodsDAO.mainListGoods("musical");
		goodsMap.put("musical",goodsList);
		
		goodsList=goodsDAO.mainListGoods("concert");
		goodsMap.put("concert",goodsList);
		
		return goodsMap;
	}


	@Override
	public int totalGoodsNum() throws DataAccessException {
		int totalGoodsNum = goodsDAO.totalGoods();
		return totalGoodsNum;
	}

	@Override
	public int totalGoodsNumById(String mem_id) throws DataAccessException {
		int totalGoodsNum = goodsDAO.totalGoodsById(mem_id);
		return totalGoodsNum;
	}

}
