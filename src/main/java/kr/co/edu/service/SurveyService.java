package kr.co.edu.service;

import java.util.List;

import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyVO;

public interface SurveyService {
	
	
	/**
	 * 설문조사 목록을 가져오는 메소드(테스트용 메소드)
	 * @return 설문조사 목록(테스트용)
	 */
	public List<SurveyVO> getList();
	
	/**
	 * SurveyVO들 중에서 하나의 SurveyVO만 가져오기 위함
	 * @param sur_seq -> 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return {@link SurveyVO}
	 */
	public SurveyVO getSurveyVO(int sur_seq);
	
	/**
	 * 설문조사 문항들을 가져오는 메소드(테스트용 메소드)
	 * @param sur_seq 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항(테스트용)
	 */
	public List<SurveyItemVO> getItemList(int sur_seq);
	

	/**
	 * 설문조사 신규 등록하기
	 * @param surveyVO -> 이 안에 있는 sur_title을 가지고 와야 함
	 * @return
	 */
	public boolean insertSurveyVO(SurveyVO surveyVO);
	
	
	/**
	 * 설문조사의 문항들을 신규 등록하기
	 * @param question -> 문항들의 질문 내용이다. (예: 오늘 덥나요? 등) {@link SurveyItemVO.suri_title}
	 * @param sur_seq -> 제목 번호 {@link SurveyVO.sur_seq}
	 * @return
	 */
	public boolean insertSurveyItemVO(List<String> question, int sur_seq);
	
}
