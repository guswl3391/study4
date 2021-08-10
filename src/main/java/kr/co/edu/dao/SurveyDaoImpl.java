package kr.co.edu.dao;

import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDaoImpl implements SurveyDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Date test() {
		return sqlSession.selectOne("surveyMapper.test");
	}

}
