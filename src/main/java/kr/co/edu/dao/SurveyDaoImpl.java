package kr.co.edu.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public int insertSurveyItem(SurveyItemVO surveyItemVO, SurveyVO surveyVO) {
		int sur_seq = surveyVO.getSur_seq();
		surveyItemVO.setSur_seq(sur_seq);
		
		return sqlSession.insert("surveyMapper.insertSurveyItem", surveyItemVO);
	}

}
