package com.forTicket.center.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

public interface CenterService {
	//글 저장
	public int addWrite(CenterVO centerVO) throws DataAccessException;
	
	//고객센터 상세화면
	public CenterVO view(int center_No) throws DataAccessException;
	
	//고객센터 상세 수정하기 
	public void edit(Map vieswMap) throws DataAccessException;
	
	//고객센터 상세 삭제하기 
	public void delete(int center_No) throws DataAccessException;
	
	//고객센터 목록
	public ArrayList<CenterVO> re_list(HashMap condMap) throws DataAccessException;
	
	//고객센터 목록
	public ArrayList<CenterVO> no_list(HashMap condMap) throws DataAccessException;
	
	//고객센터 목록
	public ArrayList<CenterVO> faq_list(HashMap condMap) throws DataAccessException;
	
	//고객센터 1:1 회원
	public List<QuestionVO> questionList(String mem_id) throws DataAccessException;
	
	//글 저장
	public int addQue(QuestionVO questionVO) throws DataAccessException;
	
	//고객센터 1:1 삭제하기 
	public void q_delete(int q_Num) throws DataAccessException;
	
	//고객센터 1:1 관리자
	public ArrayList<QuestionVO> a_questionList(HashMap condMap) throws DataAccessException;
	
	//1:1 답변 페이지 이동 
	public QuestionVO q_Num(int q_Num) throws DataAccessException;
	
	//1:1 답변 추가
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
