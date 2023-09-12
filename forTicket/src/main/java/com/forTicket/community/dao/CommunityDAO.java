package com.forTicket.community.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.center.vo.QuestionVO;
import com.forTicket.community.vo.CommunityVO;
import com.forTicket.order.vo.OrderVO;

@Mapper
@Repository("communityDAO")
public interface CommunityDAO {
	
	//회원 커뮤니티 페이지
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws DataAccessException;
	
    //리뷰페이지 이동 
    public  OrderVO review(int order_No) throws DataAccessException;
	
	//리뷰 글 추가 
	public int add_review(Map commuMap) throws DataAccessException;
	
	//리뷰 이미지 번호 등록
	public int selectReviewNO() throws DataAccessException;
	
	//답변페이지 이동 
	public CommunityVO c_No(int c_No) throws DataAccessException;
	
	//답변업데이트
	public int update_reply(CommunityVO communityVO) throws DataAccessException; 
	
	//리뷰 삭제
	public void delete(int c_No) throws DataAccessException; 
	
	public int totalCommNum() throws DataAccessException;
}
