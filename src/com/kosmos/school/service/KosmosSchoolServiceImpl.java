package com.kosmos.school.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.school.dao.KosmosSchoolDAO;
import com.kosmos.school.vo.KosmosSchoolVO;

@Service
@Transactional
public class KosmosSchoolServiceImpl implements KosmosSchoolService {
	Logger logger = Logger.getLogger(KosmosSchoolServiceImpl.class);
	
	private KosmosSchoolDAO kosmosSchoolDAO;
	
	@Autowired(required = false)
	public KosmosSchoolServiceImpl(KosmosSchoolDAO kosmosSchoolDAO) {
		this.kosmosSchoolDAO = kosmosSchoolDAO;
	}
	
	@Override
	public List<KosmosSchoolVO> timetable1(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable1() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable1(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable2(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable2() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable2(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable3(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable3() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable3(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable4(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable4() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable4(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable5(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable5() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable5(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable6(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable6() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable6(svo);
	}

	@Override
	public List<KosmosSchoolVO> timetable7(KosmosSchoolVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSchoolServiceImpl timetable7() 함수 진입 >>> : ");
		
		return kosmosSchoolDAO.timetable7(svo);
	}

}
