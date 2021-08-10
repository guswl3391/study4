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
	public SurveyVO getSurveyVO(int sur_seq) {
		// public SurveyVO(int number, String title, Date start_date, Date end_date, String finish_yn)
		
//		Date start_date = new Date();
//		Date end_date = new Date();
//		SurveyVO surveyVO = new SurveyVO(sur_seq, "Test 설문 조사 "+sur_seq, start_date, end_date, null);
//		return surveyVO;	
		
		// return this.serveyVO;
		
		for (SurveyVO surveyVO : surveyList) { // 향상된 for문!
			boolean isFind = (surveyVO.getSur_seq() == sur_seq); // 찾았다!
			if (isFind) {
				return surveyVO;
			}
		}
		
		return null;
	}

	
	/**
	 * 설문조사 문항들을 가져오는 메소드(테스트용 메소드)
	 * @param sur_seq 설문조사의 제목 번호: 제목 번호가 같은 문항들을 가지고 오기 위함
	 * @return 설문조사 문항(테스트용)
	 */
	@Override
	public List<SurveyItemVO> getItemList(int sur_seq) {
//		List<SurveyItemVO> list = new ArrayList<SurveyItemVO>();
//		
//		
//		//public SurveyItemVO(int surveyNumber, int itemNumber, String question)
//		SurveyItemVO item = new SurveyItemVO(sur_seq, 1, "첫 번째 질문");
//		list.add(item);
//		
//		SurveyItemVO item1 = new SurveyItemVO(sur_seq, 2, "두 번째 질문"); // surveyNumber가 0으로 동일한 이유: 같은 surveyNumber 안의 문항들이기 때문이다.
//		list.add(item1);
//		
//		SurveyItemVO item2 = new SurveyItemVO(sur_seq, 3, "세 번째 질문");
//		list.add(item2);
//		
//		
//		return list;
		
		// test code
		List<SurveyItemVO> list = new ArrayList<SurveyItemVO>();
		for (SurveyItemVO item : this.itemList) {
			boolean isFind = (item.getSur_seq() == sur_seq); // 찾았다! = WHERE sur_seq
			if (isFind) {
				list.add(item);
			}
		}
		
		return list;
	}


	@Override
	public boolean insertSurveyVO(SurveyVO surveyVO) {
		dao.insertSurvey(surveyVO);
		return true;
	}
	
	@Override
	public boolean insertSurveyItemVO(SurveyItemVO surveyItemVO, SurveyVO surveyVO) {
		dao.insertSurveyItem(surveyItemVO, surveyVO);
		return true;
	}
	

	@Override
	public boolean updateSurveyVO(SurveyVO surveyVO) {
//		 // test code: 나중에 DB에서 해야함!
//		int sur_seq = surveyVO.getSur_seq();
//		if (this.serveyVO.getSur_seq() != sur_seq) { // WHERE
//			return false; // early return
//		}
//		
//		String sur_title = surveyVO.getSur_title();
//		this.serveyVO.setSur_title(sur_title); // UPDATE
//		return true;
		
		// test code (2)
		int sur_seq = surveyVO.getSur_seq();
//		for (SurveyVO item : this.surveyList) { // 향상된 for문을 여기서는 쓰지 않는다: UPDATE를  위해서!
//			boolean isFind = (item.getSur_seq() == sur_seq);
//			
//		}
		for (int i = 0; i < this.surveyList.size(); i++) {
			SurveyVO item = this.surveyList.get(i);
			boolean isFind = (item.getSur_seq() == sur_seq); // WHERE
			if (isFind) {
				this.surveyList.set(i, surveyVO); // UPDATE
				return true;
			}
		}
		
		return false; // test code: WHERE-> 0
	}

	@Override
	public boolean updateSurveyItemVO(SurveyItemVO surveyItemVO) {
		// test code: 나중에 DB에서 해야함!
		int suri_seq = surveyItemVO.getSuri_seq();
		
		for (SurveyItemVO surveyItemVO2 : itemList) {
			if (surveyItemVO2.getSuri_seq() != suri_seq) { // WHERE
				continue; // early return: for
			}
			
			String suri_title = surveyItemVO.getSuri_title();
			surveyItemVO2.setSuri_title(suri_title); // UPDATE
			return true;
		}
		
		return false;
	}

	@Override
	public boolean insertSurveyAnswerVO(SurveyAnswerVO surveyAnswerVO) {
		
		// test code
		answerListAno++;
		surveyAnswerVO.setAno(answerListAno);
		answerList.add(surveyAnswerVO); // test code
		
		return true;
	}
}
