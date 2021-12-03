package com.kosmos.school.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.school.vo.KosmosSchoolVO;

@Repository
public class KosmosSchoolDAOImpl implements KosmosSchoolDAO {
	Logger logger = Logger.getLogger(KosmosSchoolDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<KosmosSchoolVO> timetable1(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable1() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable1", svo);

	}

	@Override
	public List<KosmosSchoolVO> timetable2(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable2() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable2", svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable3(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable3() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable3", svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable4(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable4() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable4", svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable5(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable5() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable5", svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable6(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable6() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable6", svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable7(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolDAOImpl timetable7() 함수 진입 >>> : ");
		
		return sqlSession.selectList("timetable7", svo);
	}

}
