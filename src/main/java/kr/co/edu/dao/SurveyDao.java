package kr.co.edu.dao;

import java.util.Date;

import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyVO;

// org.springframework.beans.factory.BeanDefinitionStoreException: Failed to parse configuration class [kr.co.edu.dao.SurveyDaoImpl]; nested exception is java.io.FileNotFoundException: 
// class path resource [kr/co/edu/dao/SurveyDao.class] cannot be opened because it does not exist

public interface SurveyDao {
	
	/**
	 * 테스트 쿼리
	 * @return SYSDATE
	 */
	public Date test();
	
	/**
	 * 설문조사 신규 등록하기
	 * @param surveyVO
	 * @return
	 */
	public int insertSurvey(SurveyVO surveyVO);
	
	/**
	 * 설문조사의 문항들을 신규 등록하기
	 * @param surveyItemVO 신규 등록할 문항 모델
	 * @param surveyVO 신규 등록할 문항의 제목 모델
	 * @return
	 */
	public int insertSurveyItem(SurveyItemVO surveyItemVO, SurveyVO surveyVO);
}
