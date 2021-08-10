package kr.co.edu.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.edu.vo.SurveyAnswerVO;
import kr.co.edu.vo.SurveyItemVO;
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
	public int updateSurveyItem(SurveyItemVO surveyItemVO) {
		return sqlSession.update("surveyMapper.updateSurveyItem", surveyItemVO);
	}

	@Override
	public int insertSurveyAnswer(SurveyAnswerVO surveyAnswerVO) {
		return sqlSession.insert("surveyMapper.insertSurveyAnswer", surveyAnswerVO);
	}

	@Override
	public int selectSurveyListCount(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		return sqlSession.selectOne("surveyMapper.selectSurveyListCount", map);
	}

	@Override
	public List<SurveyVO> selectSurveyList(int page, String keyword, int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("pno", pno);
		
		int rowStart = (page - 1) * 10 + 1;
		map.put("rowStart", rowStart);
		
		int rowEnd = page * 10;
		map.put("rowEnd", rowEnd);
		
		return sqlSession.selectList("surveyMapper.selectSurveyList", map);
	}

}
