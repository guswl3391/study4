package kr.co.edu.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyPeopleVO;
import kr.co.edu.vo.SurveyVO;

public interface SurveyService {
	
	/**
	 * mybatis 테스트용 메소드
	 * @return SYSDATE
	 */
	public Date test();
	
	/**
	 * SurveyVO들 중에서 하나의 SurveyVO만 가져오기 위함
	 * @param sur_seq -> 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return {@link SurveyVO}
	 */
	public SurveyVO selectSurvey(int sur_seq);
	
	/**
	 * 설문조사 문항들을 가져오는 메소드
	 * @param sur_seq 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항
	 */
	public List<SurveyItemVO> selectItemList(int sur_seq);
	
	/**
	 * 
	 * @param surveyItemVO
	 * @return
	 */
	public SurveyItemVO selectItemOne(SurveyItemVO surveyItemVO);

	/**
	 * 설문조사 신규 등록하기
	 * @param surveyVO -> 이 안에 있는 sur_title을 가지고 와야 함
	 * @return
	 */
	public boolean insertSurvey(SurveyVO surveyVO);
	
	
	/**
	 * 설문조사의 문항들을 신규 등록하기
	 * @param surveyItemVO 신규 등록할 문항 모델
	 * @param surveyVO 신규 등록할 문항의 제목 모델
	 * @return
	 */
	public boolean insertSurveyItem(SurveyItemVO surveyItemVO, SurveyVO surveyVO);
	
	/**
	 * 참여자 응답 중에 상세 사유만을 조회한다.
	 * @param surveyItemVO -> sur_seq, suri_seq
	 * @return
	 */
	public List<List<SurveyAnswerVO>> selectSurveyAnswerChoiceReasonList(SurveyItemVO surveyItemVO);
	
	/**
	 * 설문 조사 제목과 상세 정보들 업데이트 하기
	 * @param surveyVO -> sur_title과 sur_seq 업데이트 해야 함
	 * @return
	 */
	public int updateSurvey(SurveyVO surveyVO);
	
	
	/**
	 * 설문 조사 각각의 문항들에 대한 정보를 업데이트 하기
	 * @param surveyItemVO -> suri_title, sur_seq, suri_seq
	 * @return
	 */
	public int updateSurveyItem(SurveyItemVO surveyItemVO);
	
	/**
	 * 참여자가 응답을 서버에 전송해서 insert 하기
	 * @param surveyAnswerVO -> 설문 조사에 참여자가 응답하는 상세 내용
	 * @return
	 */
	public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO);

	/**
	 * 
	 * @param keyword
	 * @return
	 */
	public int selectSurveyListCount(String keyword);
	
	/**
	 * 
	 * @param page
	 * @param count
	 * @param keyword
	 * @param pno
	 * @return
	 */
	public List<SurveyVO> selectSurveyList(int page, int count, String keyword, int pno);
	
	/**
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public SurveyPeopleVO selectPeople(String id, String pw);
	

	/**
	 * 
	 * @param sur_seq
	 * @return
	 */
	public List<Map<String, Object>> selectResult(int sur_seq);
	
	public int deleteResearchAnswer(int sur_seq);
	public int deleteResearchItem(int sur_seq);
	public int deleteResearchSurvey(int sur_seq);
}
