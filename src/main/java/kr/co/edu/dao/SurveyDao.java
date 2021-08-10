package kr.co.edu.dao;

import java.util.Date;

// org.springframework.beans.factory.BeanDefinitionStoreException: Failed to parse configuration class [kr.co.edu.dao.SurveyDaoImpl]; nested exception is java.io.FileNotFoundException: 
// class path resource [kr/co/edu/dao/SurveyDao.class] cannot be opened because it does not exist

public interface SurveyDao {
	
	/**
	 * 테스트 쿼리
	 * @return SYSDATE
	 */
	public Date test();
}
