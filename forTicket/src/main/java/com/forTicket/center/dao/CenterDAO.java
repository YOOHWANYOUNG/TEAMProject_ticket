package com.forTicket.center.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

@Mapper
@Repository("centerDAO")
public interface CenterDAO {
	//글 저장
	public int addWrite(CenterVO centerVO) throws DataAccessException;
	
	//고객센터 글 상세창
	public  CenterVO view(int center_No) throws DataAccessException;
	
	//고객센터 상세 수정하기
	public void edit(Map vieswMap) throws DataAccessException;
	
	//고객센터 상세 삭제하기
	public void delete(int center_No) throws DataAccessException; 
	
	//고객센터 환불 목록
	public ArrayList<CenterVO> re_list(HashMap condMap) throws DataAccessException;
	
	//고객센터 공지 목록
	public ArrayList<CenterVO> no_list(HashMap condMap) throws DataAccessException;
	
	//고객센터 faq 목록
	public ArrayList<CenterVO> faq_list(HashMap condMap) throws DataAccessException;

	//고객센터 1:1 회원
	public List<QuestionVO> questionList(String id)  throws DataAccessException;
	
	//1:1 글 저장
	public int addQue(QuestionVO questionVO) throws DataAccessException;
	
	//고객센터 1:1 삭제하기 - 회원 
	public void q_delete(int q_Num) throws DataAccessException; 
	
	//고객센터 1:1 관리자
	public ArrayList<QuestionVO> a_questionList(HashMap condMap)  throws DataAccessException;
	
	//1:1 답변페이지 이동 
	public QuestionVO q_Num(int q_Num) throws DataAccessException;
	
	//1:1 답변업데이트
	public int update_reply(QuestionVO quesitonVO) throws DataAccessException; 
	
	//1:1 삭제 - 관리자
	public void a_delete(int q_Num) throws DataAccessException; 

	//환불안내 게시글 수
	public int totalRefundNum() throws DataAccessException;
	
	//공지사항 게시글 수
	public int totalNoticeNum() throws DataAccessException;
	
	//FAQ 게시글 수
	public int totalFAQNum() throws DataAccessException;

}