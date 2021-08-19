package kr.co.edu.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
import kr.co.edu.vo.SurveyPeopleVO;
import kr.co.edu.vo.SurveyVO;

@Repository
public class SurveyDaoImpl implements SurveyDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Date test() {
		return sqlSession.selectOne("surveyMapper.test");
	}

	@Override
	public int insertSurvey(SurveyVO surveyVO) {
		return sqlSession.insert("surveyMapper.insertSurvey", surveyVO);
	}

	@Override
	public SurveyVO selectSurvey(int sur_seq) {
		return sqlSession.selectOne("surveyMapper.selectSurvey", sur_seq);
	}

	@Override
	public int updateSurvey(SurveyVO surveyVO) {
		return sqlSession.update("surveyMapper.updateSurvey", surveyVO);
	}

	@Override
	public int insertSurveyItem(SurveyItemVO surveyItemVO, SurveyVO surveyVO) {
		int sur_seq = surveyVO.getSur_seq();
		surveyItemVO.setSur_seq(sur_seq);
		
		return sqlSession.insert("surveyMapper.insertSurveyItem", surveyItemVO);
	}

	@Override
	public List<SurveyItemVO> selectItemList(int sur_seq) {
		return sqlSession.selectList("surveyMapper.selectItemList", sur_seq);
	}
	
	@Override
	public SurveyItemVO selectItemOne(SurveyItemVO surveyItemVO) {
		return sqlSession.selectOne("surveyMapper.selectItemOne", surveyItemVO);
	}

	@Override
	public int updateSurveyItem(SurveyItemVO surveyItemVO) {
		return sqlSession.update("surveyMapper.updateSurveyItem", surveyItemVO);
	}

	@Override
	public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO) {
		return sqlSession.insert("surveyMapper.insertSurveyAnswer", surveyAnswerVO);
	}
	
	@Override
	public List<SurveyAnswerVO> selectSurveyAnswerChoiceReasonList(SurveyItemVO surveyItemVO) {
		return sqlSession.selectList("surveyMapper.selectSurveyAnswerChoiceReasonList", surveyItemVO);
	}

	@Override
	public int selectSurveyListCount(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		return sqlSession.selectOne("surveyMapper.selectSurveyListCount", map);
	}

	@Override
	public List<SurveyVO> selectSurveyList(int page, int count, String keyword, int pno) {
		int pageSize = 10;
		int maxPage = count / pageSize; //끝 페이지
		if(count % pageSize > 0) { 
			maxPage++;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("pno", pno);
		
		int rowStart = count - (page * pageSize) + 1;
		map.put("rowStart", rowStart);
		
		int rowEnd = count - (page - 1) * pageSize;
		map.put("rowEnd", rowEnd);
		
		return sqlSession.selectList("surveyMapper.selectSurveyList", map);
	}

	@Override
	public SurveyPeopleVO selectPeople(String id, String pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);

		return sqlSession.selectOne("surveyMapper.selectPeople", map);
	}

	@Override
	public List<Map<String, Object>> selectResult(int sur_seq) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		// nested loop 중첩 루프: 가능하면 안 쓰는게 제일 좋음
		List<Map<String, Object>> list1 = sqlSession.selectList("surveyMapper.selectResultBySurSeq", sur_seq);
		for (Map<String, Object> item1 : list1) {
			Integer suri_seq = ((BigDecimal) item1.get("SURI_SEQ")).intValue();
			String suri_title = (String) item1.get("SURI_TITLE");
			
			List<String> nameList = new ArrayList<String>();
			nameList.add("매우 그렇다");
			nameList.add("조금 그렇다");
			nameList.add("그렇다");
			nameList.add("조금 아니다");
			nameList.add("매우 아니다");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("suri_seq", suri_seq);
			map.put("suri_title", suri_title);
			map.put("1", 0);
			map.put("2", 0);
			map.put("3", 0);
			map.put("4", 0);
			map.put("5", 0);
			map.put("nameList", nameList);
			map.put("maxAnswer", 0);
			
			List<Map<String, BigDecimal>> list2 = sqlSession.selectList("surveyMapper.selectResultBySuriSeq", suri_seq);
			
			// maxAnswer
			int maxAnswer = 0;
			
			// scan and set
			for (Map<String, BigDecimal> item2 : list2) {
				String answer = Integer.toString(item2.get("ANSWER").intValue()); // (1, 2, 3, 4, 5)
				Integer count = item2.get("COUNT").intValue();
				map.replace(answer, count);
				
				maxAnswer = Math.max(maxAnswer, count);
			}
			map.replace("maxAnswer", maxAnswer);
			
			list.add(map);
		}
		
		return list;
	}
	
	@Override
	public int deleteResearchAnswer(int sur_seq) {
	    return sqlSession.delete("surveyMapper.deleteResearchAnswer", sur_seq);
	}
	
	@Override
	public int deleteResearchItem(int sur_seq) {
	    return sqlSession.delete("surveyMapper.deleteResearchItem", sur_seq);
	}
	
	@Override
	public int deleteResearchSurvey(int sur_seq) {
	    return sqlSession.delete("surveyMapper.deleteResearchSurvey", sur_seq);
	}
}
