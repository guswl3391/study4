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
	 * 설문조사 문항들을 가져오는 메소드(테스트용 메소드)
	 * @param surveyNumber 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항(테스트용)
	 */
	public List<SurveyItemVO> getItemList(int sur_seq);
	

}
