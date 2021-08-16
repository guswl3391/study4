package kr.co.edu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.edu.dao.SurveyDao;
import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyPeopleVO;
import kr.co.edu.vo.SurveyVO;


@Service
public class SurveyServiceImpl implements SurveyService {
	@Inject
	private SurveyDao dao;
	
	@Override
	public Date test() {
		return dao.test();
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
	 * 설문조사 문항들을 가져오는 메소드
	 * @param sur_seq 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항
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
	public List<SurveyAnswerVO> selectSurveyAnswerChoiceReasonList(SurveyItemVO surveyItemVO) {
		return dao.selectSurveyAnswerChoiceReasonList(surveyItemVO);
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


	@Override
	public int selectSurveyListCount(String keyword) {
		return dao.selectSurveyListCount(keyword);
	}

	@Override
	public List<SurveyVO> selectSurveyList(int page, int count, String keyword, int pno) {
		return dao.selectSurveyList(page, count, keyword, pno);
	}

	@Override
	public SurveyPeopleVO selectPeople(String id, String pw) {
		return dao.selectPeople(id, pw);
	}

	@Override
	public List<Map<String, Object>> selectResult(int sur_seq) {
		return dao.selectResult(sur_seq);
	}

	@Override
	public int deleteResearchAnswer(int sur_seq) {
	    return dao.deleteResearchAnswer(sur_seq);
	}
	
	@Override
	public int deleteResearchItem(int sur_seq) {
	    return dao.deleteResearchItem(sur_seq);
	}
	
	@Override
	public int deleteResearchSurvey(int sur_seq) {
	    return dao.deleteResearchSurvey(sur_seq);
	}
}
