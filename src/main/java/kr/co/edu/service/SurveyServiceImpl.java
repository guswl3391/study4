package kr.co.edu.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyVO;


@Service
public class SurveyServiceImpl implements SurveyService {

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

	@Override
	public SurveyVO getSurveyVO(int sur_seq) {
		// public SurveyVO(int number, String title, Date start_date, Date end_date, String finish_yn)
		Date start_date = new Date();
		Date end_date = new Date();
		SurveyVO surveyVO = new SurveyVO(sur_seq, "Test 설문 조사 "+sur_seq, start_date, end_date, null);
		return surveyVO;	
	}

	@Override
	public List<SurveyItemVO> getItemList(int sur_seq) {
		List<SurveyItemVO> list = new ArrayList<SurveyItemVO>();
		
		
		//public SurveyItemVO(int surveyNumber, int itemNumber, String question)
		SurveyItemVO item = new SurveyItemVO(sur_seq, 1, "첫 번째 질문");
		list.add(item);
		
		SurveyItemVO item1 = new SurveyItemVO(sur_seq, 2, "두 번째 질문"); // surveyNumber가 0으로 동일한 이유: 같은 surveyNumber 안의 문항들이기 때문이다.
		list.add(item1);
		
		SurveyItemVO item2 = new SurveyItemVO(sur_seq, 3, "세 번째 질문");
		list.add(item2);
		
		
		return list;
	}

}
