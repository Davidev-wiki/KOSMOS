package com.kosmos.rboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmos.rboard.vo.KosmosRboardVO;

@Repository
public class KosmosRboardDAOImpl implements KosmosRboardDAO{
	Logger logger = Logger.getLogger(KosmosRboardDAOImpl.class);

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<KosmosRboardVO> rboardSelect(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardDAOImpl rboardSelect >>> : ");
		return sqlSession.selectList("rboardSelect", rbvo);
	}

	@Override
	public List<KosmosRboardVO> rboardSelectAll(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardDAOImpl rboardSelectAll >>> : ");
		return sqlSession.selectList("rboardSelectAll", rbvo);
	}

	@Override
	public int rboardInsert(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardDAOImpl rboardInsert >>> : ");
		return (Integer)sqlSession.insert("rboardInsert", rbvo);
	}

	@Override
	public int rboardDelete(KosmosRboardVO rbvo) {
		// TODO Auto-generated method stub
		logger.info("KosmosRboardDAOImpl rboardDelete >>> : ");
		return (Integer)sqlSession.update("rboardDelete", rbvo);
	}
	
}
