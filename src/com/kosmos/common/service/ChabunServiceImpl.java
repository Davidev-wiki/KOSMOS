package com.kosmos.common.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosmos.board.vo.KosmosBoardVO;
import com.kosmos.common.dao.ChabunDAO;
import com.kosmos.rboard.vo.KosmosRboardVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}

	@Override
	public KosmosBoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunServiceImpl getBoardChabun >>> : ");
		return chabunDAO.getBoardChabun();
	}

	@Override
	public KosmosRboardVO getRboardChabun() {
		// TODO Auto-generated method stub
		logger.info("ChabunServiceImpl getRboardChabun >>> : ");
		return chabunDAO.getRboardChabun();
	}
}	
