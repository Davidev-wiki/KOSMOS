package com.kosmos.rboard.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.rboard.dao.KosmosRboardDAO;
import com.kosmos.rboard.vo.KosmosRboardVO;

@Service
@Transactional
public class KosmosRboardServiceImpl implements KosmosRboardService{
Logger logger = Logger.getLogger(KosmosRboardServiceImpl.class);
	
	@Autowired(required=false)
	private KosmosRboardDAO kosmosRboardDAO;

	@Override
	public List<KosmosRboardVO> rboardSelect(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardServiceImpl rboardSelect >>> : ");
		
		return kosmosRboardDAO.rboardSelect(rbvo);
	}

	@Override
	public List<KosmosRboardVO> rboardSelectAll(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardServiceImpl rboardSelectAll >>> : ");
		
		return kosmosRboardDAO.rboardSelectAll(rbvo);
	}

	@Override
	public int rboardInsert(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardServiceImpl rboardInsert >>> : ");
		
		return kosmosRboardDAO.rboardInsert(rbvo);
	}

	@Override
	public int rboardDelete(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardServiceImpl rboardDelete >>> : ");
		
		return kosmosRboardDAO.rboardDelete(rbvo);
	}
	
	
}
