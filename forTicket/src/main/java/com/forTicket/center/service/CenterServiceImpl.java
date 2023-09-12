package com.forTicket.center.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.center.dao.CenterDAO;
import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;

@Service("centerService")
@Transactional(propagation = Propagation.REQUIRED)
public class CenterServiceImpl implements CenterService{
	@Autowired
	private CenterDAO centerDAO;
	
	@Autowired
	private QuestionVO questionDAO;
		
	//글 저장
	@Override
	public int addWrite(CenterVO centerVO) throws DataAccessException {
		return centerDAO.addWrite(centerVO);
	}
		
	//고객센터 상세화면
	@Override
	public CenterVO view(int center_No) throws DataAccessException {
		CenterVO center = centerDAO.view(center_No);
		return center;
	}
	
	//고객센터 상세 수정하기 
	@Override
	public void edit(Map vieswMap) throws DataAccessException {
		centerDAO.edit(vieswMap);
	}
	
	//고객센터 상세 삭제하기 
	@Override
	public void delete(int center_No) throws DataAccessException {
		centerDAO.delete(center_No);
	}
	
	//고객센터 환불목록
	@Override
	public ArrayList<CenterVO> re_list(HashMap condMap) throws DataAccessException{
		ArrayList<CenterVO> refund_list = centerDAO.re_list(condMap);
		return refund_list;
	}
	
	//고객센터 공지목록
	@Override
	public ArrayList<CenterVO> no_list(HashMap condMap) throws DataAccessException{
		ArrayList<CenterVO> refund_list = centerDAO.no_list(condMap);
		return refund_list;
	}
	
	//고객센터 faq목록
	@Override
	public ArrayList<CenterVO> faq_list(HashMap condMap) throws DataAccessException{
		ArrayList<CenterVO> refund_list = centerDAO.faq_list(condMap);
		return refund_list;
	}

	//고객센터 1:1 회원
	@Override
	public List<QuestionVO> questionList(String id) throws DataAccessException {
		return centerDAO.questionList(id);
	}

	//고객센터 1:1 글 추가
	@Override
	public int addQue(QuestionVO questionVO) throws DataAccessException {
		return centerDAO.addQue(questionVO);
	}
	
	//고객센터 1:1 삭제하기 
	@Override
	public void q_delete(int q_Num) throws DataAccessException {
		centerDAO.q_delete(q_Num);
	}
	
	//고객센터 1:1 관리자
	@Override
	public ArrayList<QuestionVO> a_questionList(HashMap condMap) throws DataAccessException {
		return centerDAO.a_questionList(condMap);
	}
	
	//1:1 답변페이지 이동
	@Override
	public QuestionVO q_Num(int q_Num) throws DataAccessException {
		QuestionVO num = new QuestionVO();
		num = centerDAO.q_Num(q_Num);
		return num;
	}
	
	//1:1답변 추가
	@Override
	public int update_reply(QuestionVO quesitonVO) throws DataAccessException {
		return centerDAO.update_reply(quesitonVO);
	}

	//1:1 삭제-관리자
	@Override
	public void a_delete(int q_Num) throws DataAccessException {
		centerDAO.a_delete(q_Num);		
	}

	//환불안내 게시글 수
	@Override
	public int totalRefundNum() throws DataAccessException {
		return centerDAO.totalRefundNum();
	}

	//공지사항 게시글 수
	@Override
	public int totalNoticeNum() throws DataAccessException {
		return centerDAO.totalNoticeNum();
	}

	//FAQ 게시글 수
	@Override
	public int totalFAQNum() throws DataAccessException {
		return centerDAO.totalFAQNum();
	}
	
}
