package kr.co.edu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.edu.dao.SurveyDao;
import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyVO;


@Service
public class SurveyServiceImpl implements SurveyService {
	@Inject
	private SurveyDao dao;
	
	// public SurveyVO serveyVO; // test code
	public List<SurveyVO> surveyList;
	public int surveySurSeq = 0;
	
	public List<SurveyItemVO> itemList; // test code
	public int itemListSuriSeq = 0;
	
	public List<SurveyAnswerVO> answerList;
	public int answerListAno = 0;
	
	
	public SurveyServiceImpl() { // test code
		// int sur_seq = 1;
		
		// serveyVO = new SurveyVO(sur_seq, "Test 설문 조사 2", null, null, null);
		surveyList = new ArrayList<SurveyVO>();
		itemList = new ArrayList<SurveyItemVO>();
		
//		itemListSuriSeq++;
//		SurveyItemVO item = new SurveyItemVO(sur_seq, itemListSuriSeq, "첫 번째 질문");
//		itemList.add(item);
//		
//		itemListSuriSeq++;
//		SurveyItemVO item1 = new SurveyItemVO(sur_seq, itemListSuriSeq, "두 번째 질문");
//		itemList.add(item1);
//		
//		itemListSuriSeq++;
//		SurveyItemVO item2 = new SurveyItemVO(sur_seq, itemListSuriSeq, "세 번째 질문");
//		itemList.add(item2);
		
		answerList = new ArrayList<SurveyAnswerVO>();
	}
	

	@Override
	public Date test() {
		return dao.test();
	}
	
	/**
	 * 설문조사 목록을 가져오는 메소드(테스트용 메소드)
	 * @return 설문조사 목록(테스트용)
	 */
	@Override
	public List<SurveyVO> getList() {
		List<SurveyVO> list = new ArrayList<SurveyVO>();
		
		// public SurveyVO(int number, String title, Date start_date, Date end_date, String finish_yn)
		SurveyVO item = new SurveyVO(0, "Test 설문 조사 1", null, null, null);
		list.add(item);
		
		SurveyVO item1 = new SurveyVO(1, "Test 설문 조사 2", null, null, null);
		list.add(item1);
		
		return list;
	}
	
	
	/**
	 * SurveyVO들 중에서 하나의 SurveyVO만 가져오기 위함
	 * @param sur_seq -> 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return {@link SurveyVO}
	 */
	@Override
	public SurveyVO selectSurvey(int sur_seq) {
		return dao.selectSurvey(sur_seq);
	}

	
	/**
	 * 설문조사 문항들을 가져오는 메소드(테스트용 메소드)
	 * @param sur_seq 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항(테스트용)
	 */
	@Override
	public List<SurveyItemVO> selectItemList(int sur_seq) {
		return dao.selectItemList(sur_seq);
	}


	@Override
	public boolean insertSurvey(SurveyVO surveyVO) {
		dao.insertSurvey(surveyVO);
		return true;
	}
	
	@Override
	public boolean insertSurveyItem(SurveyItemVO surveyItemVO, SurveyVO surveyVO) {
		dao.insertSurveyItem(surveyItemVO, surveyVO);
		return true;
	}
	

	@Override
	public int updateSurvey(SurveyVO surveyVO) {
		return dao.updateSurvey(surveyVO);
	}

	@Override
	public int updateSurveyItem(SurveyItemVO surveyItemVO) {
		return dao.updateSurveyItem(surveyItemVO);
	}

	@Override
	public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO) {
		return dao.insertSurveyAnswer(surveyAnswerVO);
	}
}
