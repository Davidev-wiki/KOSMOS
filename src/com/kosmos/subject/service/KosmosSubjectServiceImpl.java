package com.kosmos.subject.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.member.vo.KosmosMemberVO;
import com.kosmos.subject.dao.KosmosSubjectDAO;
import com.kosmos.subject.dao.KosmosSubjectDAOImpl;
import com.kosmos.subject.vo.KosmosSubjectVO;

@Service
@Transactional
public class KosmosSubjectServiceImpl implements KosmosSubjectService {
	private Logger logger = Logger.getLogger(KosmosSubjectDAOImpl.class);
	
	private KosmosSubjectDAO kosmosSubjectDAO;
	
	@Autowired(required=false)
	public KosmosSubjectServiceImpl(KosmosSubjectDAO kosmosSubjectDAO) {
		this.kosmosSubjectDAO = kosmosSubjectDAO;
	}

	@Override
	public List<KosmosSubjectVO> subjectSelectAll(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl subjectSelectAll() >>> : ");
		return kosmosSubjectDAO.subjectSelectAll(svo);
	}
	
	@Override
	public List<KosmosSubjectVO> subjectSelect(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl subjectSelect() >>> : ");
		return kosmosSubjectDAO.subjectSelect(svo);
	}

	@Override
	public List<KosmosSubjectVO> subjectAdminCheck(KosmosMemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosSubjectServiceImpl subjectAdminCheck() >>> : ");
		return kosmosSubjectDAO.subjectAdminCheck(mvo);
	}

	@Override
	public int subjectInsert(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KsmosSubjectServiceImpl : subjectInsert() >>> : ");
		return kosmosSubjectDAO.subjectInsert(svo);
	}

	@Override
	public int subjectUpdate(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KsmosSubjectServiceImpl : subjectUpdate() >>> : ");
		return kosmosSubjectDAO.subjectUpdate(svo);
	}

	@Override
	public int subjectDelete(KosmosSubjectVO svo) {
		// TODO Auto-generated method stub
		logger.info("KsmosSubjectServiceImpl : subjectDelete() >>> : ");
		return kosmosSubjectDAO.subjectDelete(svo);
	}

	@Override
	public List<KosmosSubjectVO> beforeNameList() {
		// TODO Auto-generated method stub
		logger.info("KsmosSubjectServiceImpl : subjectDelete() >>> : ");
		return kosmosSubjectDAO.beforeNameList();
	}

}	